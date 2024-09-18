from flask import Blueprint, g, redirect, render_template, request, abort, url_for

from flaskr.Role import Role
from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint("pipeline", __name__, url_prefix="/pipeline")

@bp.route("/", methods=["GET"])
@login_required
def index():
    db = get_db()
    pipelines = []

    if Role.isAdmin(g.user["role_id"]):
        pipelines = db.execute(
            "SELECT p.id, u.first, u.last, u.email FROM pipeline p"
            " JOIN user u ON p.owner_id = u.id"
        ).fetchall()
    elif Role.isWorker(g.user["role_id"]):
        pipelines = db.execute(
            "SELECT p.id, u.first, u.last, u.email FROM pipeline p"
            " JOIN user u ON p.owner_id = u.id"
            " WHERE p.worker_id = ?",
           (g.user["id"],),
        ).fetchall()
    elif Role.isClient(g.user["role_id"]):
        pipelines = db.execute(
            "SELECT p.id, u.first, u.last, u.email FROM pipeline p"
            " JOIN user u ON p.owner_id = u.id"
            " WHERE p.owner_id = ?",
           (g.user["id"],),
        ).fetchall()
    else:
        raise RuntimeError("Bad role_id: ", g.user["role_id"])

    return render_template("pipeline/index.html", pipelines=pipelines)


@bp.route("/<int:pipeline_id>", methods=["GET"])
@login_required
def select(pipeline_id: int):
    try:
        leads = get_leads(g.user["id"], g.user["role_id"], pipeline_id)
    except IndexError:
        return redirect(url_for(".index"))
    except PermissionError:
        return redirect(url_for(".index"))

    stages = get_stages()
    return render_template("pipeline/select.html", leads=leads, stages=stages)


@bp.route("/<int:pipeline_id>/lead/<int:lead_id>", methods=["PUT"])
@login_required
def update_stage(pipeline_id: int, lead_id: int):
    stage_id = request.form.get("stage_id")
    db = get_db()
    db.execute("UPDATE lead SET stage_id = ? WHERE id = ?", (stage_id, lead_id))
    db.commit()
    return redirect(url_for(".select", pipeline_id=pipeline_id), 303)


def get_stages():
    return get_db().execute("SELECT * FROM stage").fetchall()


def get_lead(user_id: int, lead_id: int):
    lead = None
    db = get_db()

    if Role.isAdmin(user_id):
        lead = db.execute(
            "SELECT l.*, s.name AS stage"
            " FROM lead l JOIN stage s ON l.stage_id = s.id"
            " WHERE l.id = ?",
            (lead_id,),
        ).fetchone()
    elif Role.isWorker(user_id):
        lead = db.execute(
            "SELECT l.*, s.name AS stage"
            " FROM lead l JOIN stage s ON l.stage_id = s.id"
            " JOIN pipeline p ON p.id = l.pipeline_id"
            " WHERE l.id = ? AND p.worker_id = ?",
            (lead_id, user_id),
        ).fetchone()
    elif Role.isClient(user_id):
        lead = db.execute(
            "SELECT l.*, s.name AS stage"
            " FROM lead l JOIN stage s ON l.stage_id = s.id"
            " JOIN pipeline p ON p.id = l.pipeline_id"
            " WHERE l.id = ? AND p.owner_id = ?",
            (lead_id, user_id),
        ).fetchone()

    if lead is None:
        abort(404, f"Failed to get Lead id {lead_id}.")

    return lead


def get_leads(user_id: int, role_id: int, pipeline_id: int):
    db = get_db()

    pipeline = db.execute("SELECT * FROM pipeline WHERE id = ?", (pipeline_id,)).fetchone()
    if pipeline is None:
        raise IndexError

    if Role.isAdmin(role_id):
        pass
    elif Role.isWorker(role_id):
        if pipeline["worker_id"] != user_id:
            raise PermissionError
    elif Role.isClient(role_id):
        if pipeline["owner_id"] != user_id:
            raise PermissionError
    else:
        raise RuntimeError("Bad role id", role_id)

    return db.execute(
        "SELECT l.*, s.name AS stage"
        " FROM lead l JOIN stage s ON l.stage_id = s.id"
        " WHERE l.pipeline_id = ?"
        " ORDER BY l.stage_id ASC",
        (pipeline_id,),
    ).fetchall()

