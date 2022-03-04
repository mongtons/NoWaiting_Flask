from flask import Blueprint, render_template, request, flash, redirect, url_for
from flask import current_app as app
from pybo import models

bp=Blueprint('Commuity', __name__, url_prefix='/Commuity')

@bp.route('/', methods=['GET'])
def comm():
    return render_template('commu.html')
