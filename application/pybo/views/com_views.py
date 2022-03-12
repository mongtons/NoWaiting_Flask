from flask import Blueprint, render_template, request, flash, redirect, url_for
from flask import current_app as app
from pybo import models

bp=Blueprint('Commuity', __name__, url_prefix='/Commuity')

@bp.route('/', methods=['GET'])
def comm():
    db=models.DB()
    sql="SELECT `No_Com_writing`, `title`, `writer`, `date` from commuite_info order by date desc"
    return render_template('commu.html')
