from flask import Flask
from .views import main_views
from .views import com_views

app=Flask(__name__)
app.register_blueprint(main_views.bp)
app.register_blueprint(com_views.bp)