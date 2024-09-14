from flask import (
    Blueprint,
    abort,
    flash,
    g,
    redirect,
    render_template,
    request,
    url_for,
)

from flaskr.Role import Role
from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint("lead", __name__, url_prefix="/leads")


@bp.route("/", methods=["GET"])
@login_required
def index():
    db = get_db()
    leads = []
    if Role.isAdmin(g.user["role_id"]):
        leads = db.execute("SELECT * FROM lead ORDER BY stage_id ASC").fetchall()
    if Role.isWorker(g.user["role_id"]):
        leads = db.execute(
            "SELECT * FROM lead l JOIN worker_client wc"
            " ON l.owner_id = wc.client_id"
            " WHERE wc.worker_id = ?",
            (g.user["id"],),
        ).fetchall()
    if Role.isClient(g.user["role_id"]):
        leads = db.execute(
            "SELECT * FROM lead"
            " WHERE owner_id = ?",
            (g.user["id"],),
        ).fetchall()

    stages = db.execute("SELECT * FROM stage").fetchall()
    return render_template("lead/index.html", leads=leads, stages=stages)


@bp.route("/new", methods=["GET"])
@login_required
def new_lead():
    db = get_db()
    stages = db.execute("SELECT * FROM stage").fetchall()
    return render_template("lead/new.html", lead={"errors": []}, stages=stages)


@bp.route("/new", methods=["POST"])
@login_required
def create_lead():
    stage_id = request.form["stage_id"]
    name = request.form["name"]
    first_name = request.form["first_name"]
    position = request.form["position"]
    linkedin = request.form["linkedin"]
    phone = request.form["phone"]
    email = request.form["email"]
    company = request.form["company"]
    location = request.form["location"]
    headline = request.form["headline"]
    connected = request.form["connected"]

    error = None

    if not stage_id:
        error = "Stage is required."
    if not name:
        error = "Name is required."
    if not first_name:
        error = "First Name is required."
    if not linkedin:
        error = "Linkedin is required."

    if error is not None:
        flash(error)
    else:
        db = get_db()
        db.execute(
            "INSERT INTO lead (author_id, stage_id, name, first_name,"
            " position, linkedin, phone, email, company, location, headline,"
            " connected)"
            " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
            (
                g.user["id"],
                stage_id,
                name,
                first_name,
                position,
                linkedin,
                phone,
                email,
                company,
                location,
                headline,
                connected + " 00:00:00",
            ),
        )
        db.commit()
        return redirect(url_for("lead.index"))

    return render_template("lead/create.html")


def get_lead(id):
    lead = (
        get_db()
        .execute(
            "SELECT l.id, s.name AS stage, l.name, l.first_name,"
            " l.position, l.linkedin, l.phone, l.email, l.company,"
            " l.location, l.headline, l.connected, l.last_text, l.last_email"
            " FROM lead l JOIN stage s ON l.stage_id = s.id"
            " WHERE l.id = ?",
            (id,),
        )
        .fetchone()
    )

    if lead is None:
        abort(404, f"Lead id {id} doesn't exist.")

    return lead


@bp.route("/<int:id>", methods=["GET, POST"])
@login_required
def update(id):
    lead = get_lead(id)

    if request.method == "POST":
        return redirect(url_for("lead.index"))

    return render_template("lead/update.html", lead=lead)


@bp.route("/<int:id>/stage", methods=["PUT"])
@login_required
def update_stage(id):
    stage_id = request.form.get("stage_id")
    db = get_db()
    db.execute("UPDATE lead SET stage_id = ? WHERE id = ?", (stage_id, id))
    db.commit()
    return redirect(url_for("lead.index"), 303)


@bp.route("/<int:id>", methods=["DELETE"])
@login_required
def delete(id):
    db = get_db()
    db.execute("DELETE FROM lead WHERE id = ?", (id,))
    db.commit()
    return redirect(url_for("lead.index"), 303)
