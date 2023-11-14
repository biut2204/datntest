package com.example.demo.controller.admin.quanli;

import com.example.demo.entity.khachhang.GioHangChiTiet;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.dto.DonHangDTO;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.repo.sanpham.AoChiTietRepo;
import com.example.demo.repo.users.HoaDonRepo;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.users.GioHangChiTietSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class QuanLiDonHang {

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    HoaDonRepo hoaDonRepo;

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    GioHangChiTietSer gioHangChiTietSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @GetMapping("/admin/quan_li_don_hang/*")
    public String viewQuanLiDonHang(HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/quan_li_don_hang/");
        String ma = parts[1];

        try {
            HoaDon hoaDon = hoaDonSer.findByMa(ma);
            List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

            model.addAttribute("hoaDon", hoaDon);
            model.addAttribute("hoaDonChiTiets", hoaDonChiTiets);
            model.addAttribute("trangThai", hoaDon.getTrangThai());
        }catch (Exception e){
            model.addAttribute("trangThai", "0");
        }

        List<DonHangDTO> listDonHangDTOS = hoaDonSer.findAllByOrderByNgayTaoDesc();

        model.addAttribute("listDonHangDTOS", listDonHangDTOS);

        return "/admin/quan_li_don_hang_admin";
    }

    @PostMapping("/admin/quan_li_don_hang/detail")
    public String detail(HttpServletRequest request){
        String maHd = request.getParameter("detail");
        return "redirect:/admin/quan_li_don_hang/"+maHd;
    }

    @PostMapping("/admin/don_hang/xac_nhan")
    public String xanNhanDonHang(HttpServletRequest request){
        LocalDate currentDate = LocalDate.now();

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String maDonHang = request.getParameter("maDonHang");

        HoaDon hoaDon = hoaDonSer.findByMa(maDonHang);
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setNhanVien(user);
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayXacNhan(LocalDateTime.now());
        hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(2);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(), hd);

        return "redirect:/admin/quan_li_don_hang/" + hoaDon.getMa();
    }

    @PostMapping("/admin/don_hang/huy")
    public String huyDonHang(HttpServletRequest request){

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String maDonHang = request.getParameter("maDonHang");
        String ghiChu = request.getParameter("ghiChu");

        HoaDon hoaDon = hoaDonSer.findByMa(maDonHang);
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setNhanVien(user);
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayHuy(LocalDateTime.now());
        hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(4);
        hd.setGhiChu(ghiChu);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(), hd);

        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets){

            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            AoChiTiet aoChiTiet = new AoChiTiet();

            int slTon = act.getSlton() + hoaDonChiTiet.getSoLuong();
            int slBan = act.getSlban() - hoaDonChiTiet.getSoLuong();

            aoChiTiet.setMau_sac(act.getMau_sac());
            aoChiTiet.setSize(act.getSize());
            aoChiTiet.setAo(act.getAo());
            aoChiTiet.setSlton(slTon);
            aoChiTiet.setSlban(slBan);
            aoChiTiet.setTrangthai(act.getTrangthai());

            aoChiTietSer.update(act.getId(), aoChiTiet);
        }

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(hoaDon.getKhachHang().getEmail());
        message.setSubject("Thông tin đơn hàng");
        message.setText(ghiChu);

        mailSender.send(message);

        return "redirect:/admin/quan_li_don_hang/" + hoaDon.getMa();
    }

    @PostMapping("/admin/don_hang/hoan_thanh")
    public String hoanThanhDonHang(HttpServletRequest request){
        LocalDate currentDate = LocalDate.now();

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        String maDonHang = request.getParameter("maDonHang");

        HoaDon hoaDon = hoaDonSer.findByMa(maDonHang);
        HoaDon hd = new HoaDon();

        if(hoaDon.getNgayThanhToan() == null){
            hd.setNgayThanhToan(LocalDateTime.now());
        }else {
            hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        }

        hd.setMa(hoaDon.getMa());
        hd.setNhanVien(user);
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setNgayChoXacNhan(hoaDon.getNgayChoXacNhan());
        hd.setNgayXacNhan(hoaDon.getNgayXacNhan());
        hd.setNgayHoanThanh(LocalDateTime.now());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setHinhThuc(hoaDon.getHinhThuc());
        hd.setTrangThai(3);
        hd.setMoTa(hoaDon.getMoTa());

        if(hoaDon.getNgayThanhToan() == null){
            hd.setNgayThanhToan(LocalDateTime.now());
        }else {
            hd.setNgayThanhToan(hoaDon.getNgayThanhToan());
        }

        hoaDonSer.update(hoaDon.getId(), hd);

        List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets){
            AoChiTiet act = hoaDonChiTiet.getAoChiTiet();

            GioHangChiTiet gioHangChiTiet = gioHangChiTietSer.findByKhachHangAndAoChiTiet(hoaDon.getKhachHang().getId(), act.getId());
            if(gioHangChiTiet != null){
                gioHangChiTietSer.delete(gioHangChiTiet.getId());
            }
        }

        return "redirect:/admin/quan_li_don_hang/" + hoaDon.getMa();
    }
}