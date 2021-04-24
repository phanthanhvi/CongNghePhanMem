from demo import  db,admin
from flask_admin.contrib.sqla import ModelView
from demo.models import  Sach , TheLoai ,TacGia, PhieuNhapSach ,ChiTietPhieuNhap ,\
  NhanVien , KhachHang , KhachHangNo , HoaDon, ChiTietHoaDon , PhieuThuTienNo, UserRole, User,SoLuongSach,QuyDinh
from flask_admin import BaseView, expose
from flask_login import  current_user, logout_user
from demo.util import Read_data, util_pay
from flask import redirect, request, url_for, jsonify




###

class ContactView(BaseView):
    @expose('/')
    def __index__(self):
        return self.render('admin/contact.html')


class NhapSachView(BaseView):
    @expose('/', methods=['post','get'])
    def indexpn(self):
        err_msg = ""
        sach = Read_data.read_books()
        if request.method == 'POST':
            ngay = request.form.get("date")
            soluong = request.form.get('soLuong')
            idsach = request.form.get('idsach')
            if util_pay.nhap_sach(ngaynhap=ngay, soluong=soluong, idsach=idsach):
                    err_msg = "Nhập Sách Thành Công!"
            else:
                err_msg = "Nhập Không Thành công!"
        return self.render('admin/nhapsach.html', sach=sach, err_msg=err_msg)

    def is_accessible(self):
            return current_user.is_authenticated


class NhapSach1View(BaseView):
    @expose('/', methods=['post', 'get'])
    def indexns1(self):

        sach = Read_data.read_books()

        return self.render('admin/nhapsach1.html', sach=sach)

    def is_accessible(self):
        return current_user.is_authenticated



class HoaDonBanSachView(BaseView):
    @expose('/', methods=['post', 'get'])
    def indexhd(self):
        err_msg =""
        sach = Read_data.read_books()
        khachhang = Read_data.read_khachhang()

        return self.render('admin/hoadonbansach.html', sach=sach, khachhang=khachhang)

    def is_accessible(self):
        return current_user.is_authenticated


class DanhSachSachView(BaseView):
    @expose('/', methods=['post', 'get'])
    def indexds(self):
        sach = Read_data.read_book()
        return self.render('admin/danhsachsach.html', sach=sach)

    def is_accessible(self):
        return current_user.is_authenticated


class PhieuThuTienView(BaseView):
    @expose('/', methods=['post', 'get'])
    def indexpt(self):
        err_msg =" "
        khachhangno = Read_data.read_khachhang()
        idkhachhang = request.form.get("idkhachhang")
        date = request.form.get("date")
        sotien = request.form.get("sotien")
        if util_pay.thu_tien_no(ngaynhap=date, idkhach=idkhachhang, sotien=sotien):
            err_msg = "Thu tiền nợ Thành công !"
        else:
            err_msg = "Lỗi! chưa thành công"
        return self.render('admin/phieuthutien.html', khachhangno=khachhangno, err_msg=err_msg)

    def is_accessible(self):
        return current_user.is_authenticated


class QuyDinhView(BaseView):
    @expose('/', methods=['post', 'get'])
    def indexqd(self):
        err_msg = ""
        nhaptoithieu = request.form.get("ntt")
        iduser = request.form.get("iduser")
        tontoithieunhap = request.form.get("lttt")
        tontoithieuban = request.form.get("slttt")
        tiennotoida = request.form.get("tntd")
        check = request.form.get("check")
        if util_pay.thay_doi_quy_dinh(iduser=iduser, nhaptoithieu=nhaptoithieu, tontoithieuban=tontoithieuban,\
                                          tontoithieunhap= tontoithieunhap, tiennotoida=tiennotoida, check=check):
            err_msg="Thành Công !!!"
        else:
            err_msg="Không Thành Công !!"
        return self.render('admin/quydinh.html', err_msg =err_msg)

    def is_accessible(self):
            return current_user.is_authenticated
"""



"""

class LogoutView(BaseView):
    @expose('/')
    def index(self):
        logout_user()
        return redirect('/admin')

    def is_accessible(self):
            return current_user.is_authenticated


class BaoCaoView(BaseView):
    @expose('/', methods=['post','get'])
    def indexbc(self):
        thang = request.form.get("idthang")
        sach = Read_data.read_bao_cao_sach_month(thang)
        return self.render('admin/baocao.html',sach=sach)

    def is_accessible(self):
        return current_user.is_authenticated



#class can phai dang nhap
class Authenticated(ModelView):
    def is_accessible(self):
        return current_user.is_authenticated

    def inaccessible_callback(self, name, **kwargs):
        '''
         chưa test thử cái chức năng này
        :param name:
        :param kwargs:
        :return:
        '''
        # redirect to login page if user doesn't have access
        return redirect(url_for('admin/login', next=request.url))



class ChiTietPhieuNhapModelView(Authenticated):
    column_display_pk = True
    can_view_details = True


class SoLuongSachModelView(Authenticated):
    column_display_pk = True


class TacGiaModelView(Authenticated):
    column_display_pk =  True
    can_view_details = True


class SachModelView(Authenticated):
    column_display_pk = True


class TheLoaiModelView(Authenticated):
    can_view_details = True


class PhieuNhapSachModelView(Authenticated):
    column_display_pk = True
    form_columns = ('ngayNhap',)

    def __repr__(self):
        return repr(self.id)


class NhanVienModelView(ModelView):
    column_display_pk = True
    #form_columns = ('name', 'email', 'ngaySinh', 'diaChi', 'cmnd')
     # def is_accessible(self):
      #      user = User.query.filter(User.user_role == "ADMIN").first()
       #     if current_user == user:
        #        return current_user.is_authenticated





class BaoCaoTonModelView(Authenticated):
    column_display_pk = True


class BaoCaoCongNoModelView(Authenticated):
    column_display_pk = True


class KhachHangModelView(Authenticated):
    column_display_pk = True
    form_columns = ('name', 'diaChi', 'dienThoai', 'email')


class KhachHangNoModelView(Authenticated):
    column_display_pk = True


class HoaDonModelView(Authenticated):
    column_display_pk = True


class ChiTietHoaDonModelView(Authenticated):
    column_display_pk = True



class PhieuThuNoModelView(Authenticated):
    column_display_pk = True


admin.add_view(NhanVienModelView(NhanVien, db.session, name="Nhân Viên", category="Team Sách"))

admin.add_view(KhachHangModelView(KhachHang, db.session, name='Khách Hàng',category="TeamKH"))

admin.add_view(KhachHangNoModelView(KhachHangNo, db.session, name= 'Khách Hàng Nợ',category="TeamKH"))

admin.add_view(TacGiaModelView(TacGia, db.session, name= 'Tác Giả', category="Team Sách"))

admin.add_view(TheLoaiModelView(TheLoai, db.session, name='Thể Loại', category="Team Sách"))

admin.add_view(SachModelView(Sach, db.session, name='Sách', category="Team Sách"))

admin.add_view(PhieuNhapSachModelView(PhieuNhapSach, db.session, name ="Phiếu Nhập Sách", category="Team Sách"))

admin.add_view(ChiTietPhieuNhapModelView(ChiTietPhieuNhap, db.session, name="Nhập Sách", category="Team Sách"))

admin.add_view(HoaDonModelView(HoaDon, db.session, name= 'Hóa Đơn', category="Team"))

admin.add_view(ChiTietHoaDonModelView(ChiTietHoaDon, db.session, name='Chi Tiết Hóa Đơn',  category="Team"))
admin.add_view(ModelView(QuyDinh, db.session))

admin.add_view(PhieuThuNoModelView(PhieuThuTienNo, db.session, name="Phiếu Thu Nợ", category="TeamKH"))

#admin.add_view(BaoCaoTonModelView(BaoCaoTon, db.session, name='Báo Cáo Tồn'))

#admin.add_view(BaoCaoCongNoModelView(BaoCaoCongNo, db.session, name='Báo Cáo Công Nợ'))

admin.add_view(SoLuongSachModelView(SoLuongSach, db.session, name="Số Lượng", category="Team Sách"))

admin.add_view(BaoCaoView(name="Báo Cáo"))

admin.add_view(NhapSachView(name="Nhập Sách"))
admin.add_view(HoaDonBanSachView(name="Hóa Đơn Bán"))
admin.add_view(DanhSachSachView(name="Danh Sách Sách"))
admin.add_view(PhieuThuTienView(name = "Phiếu Thu Tiền"))
admin.add_view(QuyDinhView(name="Thay Đổi Quy Định"))
admin.add_view(NhapSach1View(name="Nhập Sách 1"))


admin.add_view(ContactView(name='Lien He'))

admin.add_view(LogoutView(name='Log Out'))