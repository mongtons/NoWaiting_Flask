from flask import Blueprint, render_template, request, flash, redirect, url_for
from flask import current_app as app
from pybo import models

bp=Blueprint('main', __name__, url_prefix='/')

@bp.route('/', methods=['GET'])
def startLogin():
    db=models.DB()
    return render_template('login.html')

@bp.route('/main', methods=['GET'])
def mainPage():
    db=models.DB()
    sql="SELECT `store_name`, `location`, `phone` FROM store;"
    row=db.executeAll(sql)
    db.commit()
    return render_template('index.html',
                           datalist=row)

@bp.route('/database', methods=['GET'])
def database_pybo():
    return render_template('test.html',
                           result=None,
                           resultData=None,
                           resultUPDATE=None)
    
@bp.route('/database/select', methods=['GET'])
def select():
    db_class=models.DB()
    sql="SELECT * FROM store;"
    row=db_class.executeOne(sql)
    db_class.commit()
    return render_template('test.html',
                           result=None,
                           resultData=row,
                           resultUPDATE=None)

@bp.route('/Commuity', methods=['GET'])
def commu():
    return render_template('commu.html')
    
def makelist(x1, x2):
    lt=[]
    for i in range(x1, x2):
        lt.append(i)
    return lt