from demo import db, app,utils,login
from demo.models import  Sach,TheLoai,TacGia,User,UserRole,HoaDon,ChiTietHoaDon,SoLuongSach
import os, json,hashlib
from sqlalchemy import or_
from flask_login import current_user
from datetime import datetime


def cart_stats(cart):
    total_amount, total_quantity = 0, 0
    if cart:
        for p in cart.values():
            total_quantity = total_quantity + p["quantity"]
            total_amount = total_amount + p["quantity"]*p["donGia"]
    return total_quantity, total_amount


def get_user_by_id(user_id):
    return User.query.get(user_id)



def check_login(username, password):

    password = str(hashlib.md5(password.encode('utf-8')).hexdigest())
    user = User.query.filter(User.username == username,
                             User.password == password).first()

    return user




def read_books(kw = None, keyword=None, from_price=None, to_price=None, theloai = None):
    '''

    :param keyword: từ khóa cần tìm kiếm
    :param from_price:  tìm từ khoảng giá
    :param to_price: tới giá .
    :return: trả về sách đạt các yêu cầu
    '''
    books = Sach.query.join(TheLoai, Sach.theLoai_id==TheLoai.id).join(TacGia, Sach.tacGia_id == TacGia.id).join(SoLuongSach, Sach.id==SoLuongSach.sach_id)\
            .add_columns(Sach.description,Sach.avatar,Sach.id, Sach.name,Sach.donGia, TheLoai.nametl,TacGia.nametg, SoLuongSach.soLuong)


    if kw:
        books = books.filter(or_(Sach.name.contains(kw), TheLoai.nametl.contains(kw),TacGia.nametg.contains(kw)))

    if keyword:
        books = books.filter(Sach.name.contains(keyword))

    if theloai:
        books = books.filter(TheLoai.nametl.like(theloai))

    if from_price and to_price:
        books = books.filter(Sach.donGia.__gt__(from_price),
                             Sach.donGia.__lt__(to_price))

    return books.all()


def read_user():
    return User.query.all()


def read_books_by_id(book_id):
    return Sach.query.get(book_id)

def read_user_by_id(user_id):
    return User.query.get(user_id)

def read_theloai():
    return TheLoai.query.all()

def read_tacGia():
    return TacGia.query.all()

def read_books_by_theloai(theloai_id):

    return TheLoai.query.get(theloai_id).books

@login.user_loader
def user_load(user_id):
    return utils.get_user_by_id(user_id=user_id)


def update_amount(cart):
    for p in list(cart.values()):
        db.session.query(SoLuongSach).filter(SoLuongSach.sach_id == p["id"]).update(
            {'soLuong': SoLuongSach.soLuong - p["quantity"]})
    try:
        db.session.commit()
        return True
    except Exception as ex:
        print(ex)
    return False


def register_user(name, email, username, password, avatar):
    password = str(hashlib.md5(password.strip().encode('utf-8')).hexdigest())
    u = User(name=name,
             email=email,
             username=username,
             password=password,
             avatar=avatar,
             user_role=UserRole.KH)
    try:
        db.session.add(u)
        db.session.commit()
        return True
    except:
        return False

def update_user(name, email, phone, address,avatar):
    db.session.query(User).filter(User.id==current_user.id).update(
        {'name':name,
         'email':email,
         'dienThoai':phone,
         'diaChi':address,
         'avatar': avatar})
    try:
        db.session.commit()
        return True
    except:
        return False

def update_user_noavatar(name, email, phone, address):
    db.session.query(User).filter(User.id==current_user.id).update(
        {'name':name,
         'email':email,
         'dienThoai':phone,
         'diaChi':address,
         })

    try:
        db.session.commit()
        return True
    except:
        return False



def add_receipt(cart):
    if cart and current_user.is_authenticated:
        hoadon = HoaDon(user_id=current_user.id,
                        nhanVien_id = 1,
                        ngayLapHD=datetime.now())
        db.session.add(hoadon)

        for p in list(cart.values()):
            detail = ChiTietHoaDon(hoadon=hoadon,
                                   sach_id=int(p["id"]),
                                   soLuong=p["quantity"],
                                   donGia=p["donGia"],
                                  )
            db.session.add(detail)
        try:
            db.session.commit()
            return True
        except Exception as ex:
            print(ex)
    return False


