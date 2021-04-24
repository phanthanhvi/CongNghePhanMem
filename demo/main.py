from flask import render_template,request,session,redirect,url_for,jsonify
from demo import app, utils,login
from flask_login import login_user,logout_user, login_required
import os,json
from demo import decorator
from demo.util import Read_data,util_login, util_pay
from demo.utils import User,UserRole
from demo.templates.admin import  *

@app.route("/")
def index():
    quantity, amount= utils.cart_stats(session.get('cart'))
    cart_info = {
        "total_quantity": quantity,
        "total_amount": amount,
    }
    books = utils.read_books()
    theloai = utils.read_theloai()
    return render_template("index.html", books=books, theloai=theloai, cart_info=cart_info)

@app.route("/user/<int:user_id>")
def user_detail(user_id):
    user = utils.get_user_by_id(user_id=user_id)
    return render_template('user-detail.html',user=user)

@app.route("/books/<int:book_id>")
def book_details(book_id):
    quantity, amount = utils.cart_stats(session.get('cart'))
    cart_info = {
        "total_quantity": quantity,
        "total_amount": amount,
    }
    book_detail = utils.read_books_by_id(book_id=book_id)
    book = utils.read_books()
    theloai = utils.read_theloai()
    return render_template('books_details.html',book_detail=book_detail, book=book,theloai=theloai, cart_info=cart_info)

@app.route("/search")
def search_books():
    quantity, amount = utils.cart_stats(session.get('cart'))
    cart_info = {
        "total_quantity": quantity,
        "total_amount": amount,
    }
    kw = request.args.get('kw')
    books = utils.read_books(kw=kw)
    return render_template('search_books.html',
                           books=books,cart_info=cart_info)


@app.route("/loginuser", methods=['post', 'get'])
def user_login():
    quantity, amount = utils.cart_stats(session.get('cart'))
    cart_info = {
        "total_quantity": quantity,
        "total_amount": amount,
    }
    if request.method == 'POST':
        username = request.form.get("username")
        password = request.form.get("password", "")
        user = utils.check_login(username=username, password=password)
        if user:
            login_user(user=user)
            if user.user_role == UserRole.KH:
                return redirect("/")

    return render_template("login.html",cart_info=cart_info)


@app.route('/logout')
@login_required
def user_logout():
    logout_user()
    return redirect("/")

@app.route("/register", methods=['get','post'])
def user_register():
    err_msg = ""
    if request.method == "POST":
        password = request.form.get('password')
        confirm = request.form.get('confirm-password')
        if password == confirm:
            name = request.form.get('name')
            email = request.form.get('email')
            username = request.form.get('username')
            f = request.files["avatar"]
            avatar_path = 'image/upload/%s' % f.filename
            f.save(os.path.join(app.root_path, 'static/', avatar_path))
            if utils.register_user(name=name, username=username, password=password,
                                    email=email, avatar=avatar_path):
                return redirect('/loginuser')
            else:
                err_msg = "Tên đăng nhập, email đã tồn tại!"
        else:
            err_msg = "Mật khẩu không khớp!"

    return render_template('register.html', err_msg=err_msg)


@app.route('/api/update-user', methods=['post'])
def update_user():
    name = request.form.get('name')
    email = request.form.get('email')
    phone = request.form.get('phone')
    address = request.form.get('address')
    f = request.files["avatar"]
    avatar_path = 'image/upload/%s' % f.filename
    f.save(os.path.join(app.root_path, 'static/', avatar_path))
    if utils.update_user(name=name, email=email, phone=phone, address=address,avatar=avatar_path):
        return jsonify({
            "message": "Update successful!",
            "err_code": 200
        })
    return jsonify({"message": "Cập nhật thông tin không thành công"})


@app.route('/api/update-user-noavatar', methods=['post'])
def update_user_noavatar():

    name = request.form.get('name1')
    email = request.form.get('email1')
    phone = request.form.get('phone1')
    address = request.form.get('address1')
    if utils.update_user_noavatar(name=name, email=email, phone=phone, address=address):
        return jsonify({
            "message": "Update successful!",
            "err_code": 200
        })
    return jsonify({"message": "Cập nhật thông tin không thành công"})

@login.user_loader
def user_load(user_id):
    return utils.get_user_by_id(user_id=user_id)




@app.route('/cart')
@decorator.login_required
def cart():
    quantity, amount = utils.cart_stats(session.get('cart'))
    cart_info = {
        "total_quantity": quantity,
        "total_amount": amount,
    }
    return render_template('cart.html', cart_info=cart_info)

@app.route('/api/cart', methods =['post'])
def add_to_cart():
    if 'cart' not in session:
        session['cart'] = {}

    cart = session['cart']
    data = request.json

    id = str(data.get('id'))
    name = data.get('name')
    donGia = data.get('donGia')
    avatar = data.get('avatar')

    if id in cart:
       cart[id]['quantity'] = cart[id]['quantity'] + 1
    else:
        cart[id] = {
            "id" : id,
            "name": name,
            "donGia": donGia,
            "avatar": avatar,
            "quantity":1
        }
    session['cart'] = cart
    total_quantity, total_amount = utils.cart_stats(cart)

    return jsonify({
        "total_amount": total_amount,
        "total_quantity": total_quantity,
        "cart": cart
    })

@app.route('/api/minus_cart', methods =['post'])
def minus_to_cart():
    cart = session['cart']
    data = request.json

    id = str(data.get('id'))
    if  cart[id]['quantity'] > 1 :
        cart[id]['quantity'] = cart[id]['quantity'] - 1
    else:
        cart[id]['quantity'] = 1

    session['cart'] = cart
    total_quantity, total_amount = utils.cart_stats(cart)

    return jsonify({
        "total_amount": total_amount,
        "total_quantity": total_quantity,
        "cart": cart
    })

@app.route('/api/pay', methods=['get','post'])
@decorator.login_required
def pay():
    if utils.add_receipt(session.get('cart')):
        del session['cart']
        return jsonify({
            "message": "Add receipt successful!",
            "err_code": 200
        })

    return jsonify({
        "message": "Failed"
    })



@app.route("/cart/delete/<int:id>")
def delele_product(id):
    try:
        session.modified = True
        for key, item in session['cart'].items():
            if int(key) == id:
                session['cart'].pop(key,None)
                return redirect(url_for('cart'))
    except Exception as e:
        print(e)
        return redirect(url_for('cart'))


@app.route("/login_admin", methods=['post', 'get'])
def admin_login():
    if request.method == 'POST':
        username = request.form.get("username")
        password = request.form.get("password", "")
        user = util_login.check_login(username=username, password=password)
        if user:
            login_user(user=user)
            if user.user_role == UserRole.ADMIN :
                return redirect("/admin")
    return redirect("/admin")


@app.route('/api/sellcart', methods=["get", "post"])
def sellcart():
    if 'cart' not in session:
        session['cart'] = {}

    cart = session['cart']

    data = request.json
    idi = str(data.get("id"))
    idk = str(data.get("idk"))
    date = data.get("date")
    book = Read_data.read_books_by_id(idi)
    name = book.name
    donGia = float(book.donGia)

    if idi in cart:
        cart[idi]["quantity"] = cart[idi]["quantity"] + 1
    else:
        cart[idi] = {
            "id": idi,
            "name": name,
            "donGia": donGia,
            "quantity": 1,
            "idk": idk,
            "date": date
        }

    session['cart'] = cart

    quan, price = util_pay.cart_stats(cart)

    return jsonify({
        "total_amount": price,
        "total_quantity": quan,
        "cart": cart
    })


@app.route('/api/submit-buy', methods=['post'])
@decorator.login_required
def submit_buy():
    if util_pay.add_buy(session.get('cart')):
        del session['cart']

        return jsonify({
            "message": "Add receipt successful!",
            "err_code": 200
        })

    return jsonify({
        "message": "Failed"
    })


# cái này dùng để khởi tạo một cái cart cho nhập sách
@app.route('/api/bookcart', methods=["post","get"])
def bookcart():
    if "book_cart" not in session:
        session['book_cart'] = {}

    book_cart = session['book_cart']

    data = request.json
    id = str(data.get("id"))
    book = Read_data.read_books_by_id(id)
    name = book.name
    donGia = float(book.donGia)

    if id in book_cart:
        '''
            đã có sản phẩm ở trong giỏ. => tăng số lượng.
        '''
        book_cart[id]["quantity"] = book_cart[id]["quantity"] + 1
    else:
        book_cart[id] = {
            "id": id,
            "name": name,
            "donGia": donGia,
            "quantity": 1
        }
    session['book_cart'] = book_cart
    quan = util_pay.book_cart_stats(book_cart)

    return jsonify({
        "total_quantity": quan
    })

@app.route('/api/submit-buybook', methods=['post'])
@decorator.login_required
def submit_buybook():
    if util_pay.add_book(session.get('book_cart')):
        del session['book_cart']

        return jsonify({
            "message": "Add receipt successful!",
            "err_code": 200
        })

    return jsonify({
        "message": "Failed"
    })


if __name__ =="__main__":

    app.run(debug=True)