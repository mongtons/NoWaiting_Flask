import os
from pybo.views.main_views import result
from app import app

app.run(host='127.0.0.1')
BASE_DIR=os.path.dirname(__file__)
db=result
SQLALCHEMY_DATABASE_URI='mysql+pymysql:///root:kjh13579@localhost:3306/NoWaiting'
SQLALCHEMY_TRACK_MODIFICATIONS=False