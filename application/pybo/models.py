from flask_sqlalchemy import SQLAlchemy
import pymysql

db=SQLAlchemy()

class Store(db.Model):
    """table name : store
    Args:
        num_store: pk
        managerID: pk
        store_name: 
        location:
        phone:
        manager_name:
    """
    __tablename__='store'
    num_store=db.Column(db.Integer, primary_key=True, nullable=False)
    managerID=db.Column(db.String(20, 'utf8mb4_unicode_ci'), primary_key=Ture, nullable=False)
    store_name=db.Column(db.String(10, 'utf8mb4_unicode_ci'), nullable=False)
    location=db.Column(db.String(30, 'utf8mb4_unicode_ci'), nullable=False)
    phone=db.Column(db.String(11, 'utf8mb4_unicode_ci'))
    manager_name=db.Column(db.String(10, 'utf8mb4_unicode_ci'))
    def __init__(self, nS, mI, sN, lo, ph, mN):
        self.num_store=nS
        self.managerID=mI
        self.store_name=sN
        self.location=lo
        self.phone=ph
        self.manager_name=mN
        