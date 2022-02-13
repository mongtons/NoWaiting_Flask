import os
from pybo.views.main_views import result

BASE_DIR=os.path.dirname(__file__)
db=result
SQLALCHEMY_DATABASE_URI='mysql+pymysql:///root:kjh13579@localhost:3306/{}'.format(result)
SQLALCHEMY_TRACK_MODIFICATIONS=False