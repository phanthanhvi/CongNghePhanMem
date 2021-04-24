from demo.models import UserRole, User
from demo import db
import hashlib


def check_login(username, password):
    '''

    :param username:
    :param password:
    :param role:
    :return: check đăng nhập
    '''
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())
    user = User.query.filter(User.username == username,
                             User.password == password,
                             User.user_role == UserRole.ADMIN).first()

    return user


def get_user_by_id(user_id):
    return User.query.get(user_id)


def add_user(name, email, username, password, avatar_path):
    '''

    :param name: tên của khách hàng đăng ký
    :param email: email của khách hàng
    :param username: tên đăng nhập
    :param password: mật khẩu của người dùng được băm md5
    :param avatar_path: đường dẩn ảnh của người dùng
    :return: nếu thành công sẽ add vào database còn nếu lỗi thì xuất ra lỗi.

    '''
    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())
    U = User(name=name,email=email, username=username, password=password, avatar=avatar_path)

    try:
        db.session.add(U)
        db.session.commit()
        return True
    except Exception as ex:
        print(ex)
        return False

