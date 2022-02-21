from flask import Flask
from pybo.views.main_views import bp

app=Flask(__name__)
app.register_blueprint(bp)
