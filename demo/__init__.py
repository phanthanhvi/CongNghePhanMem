from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_login import LoginManager


app = Flask (__name__)
app.secret_key = "jvhhgghnfuyjghhjgnhf#%%^&^HJN^DVBEKHy"
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:123456@localhost/bookit?charset=utf8mb4"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True

db = SQLAlchemy(app=app)
admin = Admin(app=app, name="QUẢN LÝ NHÀ SÁCH", template_mode="bootstrap4")
login = LoginManager(app=app)