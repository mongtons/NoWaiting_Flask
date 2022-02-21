from distutils.command.config import config
from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
import config

db=SQLAlchemy()
migrate=Migrate()
app=Flask(__name__)

def create_app():
    app.config.from_object(config)
    
    db.init_app(app)
    migrate.init_app(app, db)
    from . import models
    
    from .views import main_views
    app.register_blueprint(main_views.bp)
    
    return app