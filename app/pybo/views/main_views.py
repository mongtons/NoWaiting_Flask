from flask import Blueprint, render_template, request, flash, redirect, url_for, current_app as app
from models import Store

bp=Blueprint('main', __name__, url_prefix='/')

@bp.route('hello')
def hello_pybo():
    return render_template('test.html')

@bp.route('/')
def index():
    return render_template('index.html',
                           title="Pybo project",
                           home_str="Hello",
                           home_list=makelist(1,11))

def makelist(x1, x2):
    lt=[]
    for i in range(x1, x2):
        lt.append(i)
    return lt