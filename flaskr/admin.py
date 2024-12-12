import sqlite3
from os import pipe

from flask import Blueprint, g, redirect, render_template

from flaskr.auth import login_required
from flaskr.db import get_db
from flaskr.Role import Role

bp = Blueprint("admin", __name__, url_prefix="/admin")

@bp.route("/", methods=["GET"])
@login_required
def index():
    if not Role.isAdmin(g.user["id"]):
        return redirect("/")

    db = get_db()
    pipelines: list[sqlite3.Row] = db.execute("SELECT * FROM pipeline").fetchall()
    users: list[sqlite3.Row] = db.execute("SELECT * FROM user").fetchall()
    clients = list(filter(lambda user: Role.isClient(user["role_id"]), users))
    print(len(clients))
    non_clients = list(filter(lambda user: Role.isAdmin(user["role_id"]) or Role.isWorker(user["role_id"]), users))
    print(len(non_clients))

    return render_template("admin/index.html", clients=clients, non_clients=non_clients, pipelines=pipelines)

