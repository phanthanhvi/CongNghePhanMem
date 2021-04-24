from functools import wraps
from flask import session, request, redirect, url_for
from flask_login import current_user
from demo.models import *

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if not current_user.is_authenticated:
            return redirect('/loginuser')

        return f(*args, **kwargs)

    return decorated_function


