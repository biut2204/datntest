package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.dto.HoaDonChiTietDTO;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.sanpham.Anh;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.sanpham.ChatVai;
import com.example.demo.entity.sanpham.Form;
import com.example.demo.entity.sanpham.Hang;
import com.example.demo.entity.sanpham.LoaiAo;
import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.entity.sanpham.Size;
import com.example.demo.entity.dto.ThongKeDTO;
import com.example.demo.repo.chat.DemChatRepository;
import com.example.demo.ser.sanpham.AnhSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.sanpham.AoSer;
import com.example.demo.ser.sanpham.ChatVaiSer;
import com.example.demo.ser.sanpham.FormSer;
import com.example.demo.ser.sanpham.HangSer;
import com.example.demo.ser.sanpham.LoaiAoSer;
import com.example.demo.ser.sanpham.MauSacSer;
import com.example.demo.ser.sanpham.SizeSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class SanPhamController {

    @Autowired
    AoSer aoSer;

    @Autowired
    ChatVaiSer chatVaiSer;

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    HangSer hangSer;

    @Autowired
    FormSer formSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    SizeSer sizeSer;

    @Autowired
    MauSacSer mauSacSer;

    @Autowired
    AnhSer anhSer;

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    DemChatRepository demChatRepository;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @GetMapping("/admin/index/*")
    public String index(Model model, @RequestParam(name = "pageNo", required = false, defaultValue = "0") Integer pageNo) {
        LocalDateTime ngayHienTai = LocalDateTime.now();

        LocalDate date = LocalDate.now();

        List<ThongKeDTO> listThongKeDTOS = hoaDonSer.thongKeTheoNgayThanhToan();
        int soDonMoi = hoaDonSer.soLuongHoaDonTheoNgayandTrangThai(date, 1);
        int soDonDangGiao = hoaDonSer.countHoaDonDangGiaoByNgayHienTai(date);
        int soDonHoanThanh = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(date);
        int soDonHuy = hoaDonSer.countHoaDonHuyByNgayHienTai(date);
        Page<HoaDon> page = hoaDonSer.listHoaDonTheoNgay(date, pageNo);

        List<HoaDon> listHDChoXacNhan = hoaDonSer.listHoaDonByNgayChoXacNhan(date);
        List<HoaDon> listHDDangGiao = hoaDonSer.listHoaDonByNgayDangGiao(date);
        List<HoaDon> listHDHoanThanh = hoaDonSer.listHoaDonByNgayHoanThanh(date);
        List<HoaDon> listHDHuy = hoaDonSer.listHoaDonByNgayHuy(date);

        List<HoaDonChiTietDTO> listHoaDonChoXacNhanDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDChoXacNhan);
        List<HoaDonChiTietDTO> listHoaDonDangGiaoDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDDangGiao);
        List<HoaDonChiTietDTO> listHoaDonHoanThanhDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDHoanThanh);
        List<HoaDonChiTietDTO> listHoaDonHuyDTOS = hoaDonChiTietSer.listHoaDonTheoNgay(listHDHuy);

        model.addAttribute("listThongKeDTOS", listThongKeDTOS);
        model.addAttribute("ngayHienTai", ngayHienTai);
        model.addAttribute("soDonMoi", soDonMoi);
        model.addAttribute("soDonDangGiao", soDonDangGiao);
        model.addAttribute("soDonHoanThanh", soDonHoanThanh);
        model.addAttribute("soDonHuy", soDonHuy);
        model.addAttribute("page", page);
        model.addAttribute("allChat", demChatRepository.count());
        model.addAttribute("listHoaDonChoXacNhanDTOS", listHoaDonChoXacNhanDTOS);
        model.addAttribute("listHoaDonDangGiaoDTOS", listHoaDonDangGiaoDTOS);
        model.addAttribute("listHoaDonHoanThanhDTOS", listHoaDonHoanThanhDTOS);
        model.addAttribute("listHoaDonHuyDTOS", listHoaDonHuyDTOS);

        return "/admin/index";
    }

    @GetMapping("/admin/thong_ke/*")
    public String thongKe(Model model) {
        LocalDate ngayHienTai = LocalDate.now();
        LocalDate ngayHomTruoc = ngayHienTai.minus(1, ChronoUnit.DAYS);
        LocalDate ngayStart = null;

        System.out.println(ngayHienTai);

        int soDonNgayHienTai = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(ngayHienTai);
        double soDonNgayHomTruoc = hoaDonSer.soLuongHoaDonHoanThanhTheoNgay(ngayHienTai);

        Integer soLuongBanNgayHienTai = hoaDonChiTietSer.soLuongBanTheoNgay(ngayHienTai);
        Integer soLuongBanNgayTruoc = hoaDonChiTietSer.soLuongBanTheoNgay(ngayHomTruoc);

        if (soLuongBanNgayHienTai == null) {
            soLuongBanNgayHienTai = 0;
        }
        if (soLuongBanNgayTruoc == null) {
            soLuongBanNgayTruoc = 0;
        }

        Integer doanhThuNgayHienTai = hoaDonSer.doanhThuTheoNgay(ngayHienTai);
        Integer doanhThuNgayTruocStr = hoaDonSer.doanhThuTheoNgay(ngayHomTruoc);

        int doanhThuNgayTruoc = 0;

        if (doanhThuNgayHienTai == null) {
            doanhThuNgayHienTai = 0;
        }
        if (doanhThuNgayTruocStr == null) {
            doanhThuNgayTruoc = 0;
        }

        Integer soLuongKhachMuaNgayHienTai = hoaDonSer.soLuongKhachMuaTheoNgay(ngayHienTai);
        Integer soLuongKhachMuaNgayTruocStr = hoaDonSer.soLuongKhachMuaTheoNgay(ngayHomTruoc);

        int soLuongKhachMuaNgayTruoc = 0;

        if (soLuongKhachMuaNgayHienTai == null) {
            soLuongKhachMuaNgayHienTai = 0;
        }
        if (soLuongKhachMuaNgayTruocStr == null) {
            soLuongKhachMuaNgayTruoc = 0;
        }

        DecimalFormat df = new DecimalFormat("0.00");

        double soSanhHoaDon = ((soDonNgayHienTai - soDonNgayHomTruoc) / soDonNgayHomTruoc) * 100;
        String formatSoSanhHoaDon = df.format(soSanhHoaDon);

        if (soSanhHoaDon < 0) {
            model.addAttribute("soSanhHoaDon", formatSoSanhHoaDon);
            model.addAttribute("mauHD", "danger");
        } else {
            model.addAttribute("soSanhHoaDon", "+" + formatSoSanhHoaDon);
            model.addAttribute("mauHD", "success");
        }

        double soSanhSoLuong;

        if (soLuongBanNgayTruoc == 0) {
            soSanhSoLuong = soLuongBanNgayHienTai;
        } else {
            soSanhSoLuong = ((soLuongBanNgayHienTai - soLuongBanNgayTruoc) / soLuongBanNgayTruoc) * 100;
        }

        String formatSoSanhSoLuong = df.format(soSanhSoLuong);
        if (soSanhSoLuong < 0) {
            model.addAttribute("soSanhSoLuong", formatSoSanhSoLuong);
            model.addAttribute("mauSL", "danger");
        } else {
            model.addAttribute("soSanhSoLuong", "+" + formatSoSanhSoLuong);
            model.addAttribute("mauSL", "success");
        }

        double soSanhDoanhThu ;

        if (doanhThuNgayTruoc == 0){
            soSanhDoanhThu = doanhThuNgayHienTai;
        }else {
            soSanhDoanhThu = ((doanhThuNgayHienTai - doanhThuNgayTruoc) / doanhThuNgayTruoc) * 100;
        }
        String formatSoSanhDoanhThu = df.format(soSanhDoanhThu);

        if (soSanhDoanhThu < 0) {
            model.addAttribute("soSanhDoanhThu", formatSoSanhDoanhThu);
            model.addAttribute("mauDT", "danger");
        } else {
            model.addAttribute("soSanhDoanhThu", "+" + formatSoSanhDoanhThu);
            model.addAttribute("mauDT", "success");
        }

        double soSanhSoLuongKhach;

        if (soLuongKhachMuaNgayTruoc == 0){
            soSanhSoLuongKhach = 0;
        }else {
            soSanhSoLuongKhach = ((soLuongKhachMuaNgayHienTai - soLuongKhachMuaNgayTruoc) / soLuongKhachMuaNgayTruoc) * 100;
        }

        String formatSoSanhSoLuongKhach = df.format(soSanhSoLuongKhach);

        if (soSanhSoLuongKhach < 0) {
            model.addAttribute("soSanhSoLuongKhach", formatSoSanhSoLuongKhach);
            model.addAttribute("mauSLK", "danger");
        } else {
            model.addAttribute("soSanhSoLuongKhach", "+" + formatSoSanhSoLuongKhach);
            model.addAttribute("mauSLK", "success");
        }
        List<Double> doanhThuTheoThang = hoaDonSer.doanhThuTheoThang(ngayStart, ngayHienTai);


        List<Integer> soLuongBanTheoThang = hoaDonChiTietSer.soLuongBanTheoThang(ngayStart, ngayHienTai);

        model.addAttribute("soHoaDonHomNay", soDonNgayHienTai);
        model.addAttribute("soLuongHomNay", soLuongBanNgayHienTai);
        model.addAttribute("doanhThuHomNay", doanhThuNgayHienTai);
        model.addAttribute("soLuongKhachMua", soLuongKhachMuaNgayHienTai);
        model.addAttribute("listDoanhThu", doanhThuTheoThang);
        model.addAttribute("listSoLuong", soLuongBanTheoThang);

        model.addAttribute("ngayHienTai", ngayHienTai);

        return "/admin/thongke";
    }

    @GetMapping("/admin/ao/view/*")
    public String view(Model model, HttpServletRequest request) {

        List<Ao> listAos = aoSer.findAllByTrangThai(2);
        List<Ao> listAoChuaHoanThiens = aoSer.findAllByTrangThai(1);
        List<Hang> listHangs = hangSer.findAllByTrangThai(1);
        List<ChatVai> listChatVais = chatVaiSer.findAllByTrangThai(1);
        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        List<Form> listForms = formSer.findAllByTrangThai(1);
        List<MauSac> listMauSacs = mauSacSer.findAllByTrangThai(1);
        List<Size> listSizes = sizeSer.findAllByTrangThai(1);

        model.addAttribute("listChatVais", listChatVais);
        model.addAttribute("listLoaiAos", listLoaiAos);
        model.addAttribute("listForms", listForms);
        model.addAttribute("listMauSacs", listMauSacs);
        model.addAttribute("listSizes", listSizes);

        model.addAttribute("listAos", listAos);
        model.addAttribute("listAoChuaHoanThiens", listAoChuaHoanThiens);
        model.addAttribute("listHangs", listHangs);

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/ao/view/");
        String id = parts[1];

        try {
            UUID idAo = null;
            if (aoChiTietSer.findById(UUID.fromString(id)) != null) {
                idAo = aoChiTietSer.findById(UUID.fromString(id)).getAo().getId();

                AoChiTiet aoChiTiet = aoChiTietSer.findById(UUID.fromString(id));
                model.addAttribute("aoChiTiet", aoChiTiet);
            } else {
                idAo = UUID.fromString(id);
            }

            Ao ao = aoSer.findById(idAo);
            List<AoChiTiet> listAoChiTiets = aoChiTietSer.findByAoId(idAo);
            List<Anh> listAnhs = anhSer.findAllByAoId(idAo);

            model.addAttribute("item", ao);
            model.addAttribute("listAoChiTiets", listAoChiTiets);
            model.addAttribute("listAnhs", listAnhs);
            model.addAttribute("checkAnhs", aoChiTietSer.soLuongAoChiTietByIdAo(idAo));

            model.addAttribute("checkUpdate", "1");
        } catch (Exception e) {

        }
        return "/admin/ao";
    }

    @PostMapping("/admin/ao/add")
    public String add(HttpServletRequest request) {
        String ten = request.getParameter("ten");
        String hang_id = request.getParameter("hang_id");
        String loai_ao_id = request.getParameter("loai_ao_id");
        String chat_vai_id = request.getParameter("chat_vai_id");
        String co_ao = request.getParameter("co_ao");
        String tui_ao = request.getParameter("tui_ao");
        String tay_ao = request.getParameter("tay_ao");
        String form_id = request.getParameter("form_id");
        String trangthai = request.getParameter("trangthai");
        String gianhapStr = request.getParameter("gianhap");
        String giabanStr = request.getParameter("giaban");
        String mota = request.getParameter("mota");

        String ngayNhapString = request.getParameter("ngayNhap");
        LocalDate ngayNhap = LocalDate.parse(ngayNhapString);

        BigDecimal giaNhap = BigDecimal.valueOf(Integer.parseInt(gianhapStr));
        BigDecimal giaBan = BigDecimal.valueOf(Integer.parseInt(giabanStr));

        Ao ao = new Ao();

        int sl = aoSer.soLuongAo() + 1;

        ao.setMa("SP" + sl);
        ao.setTen(ten);
        ao.setHang(hangSer.findById(UUID.fromString(hang_id)));
        ao.setChatVai(chatVaiSer.findById(UUID.fromString(chat_vai_id)));
        ao.setLoaiAo(loaiAoSer.findById(UUID.fromString(loai_ao_id)));
        ao.setCoAo(co_ao);
        ao.setTui(tui_ao);
        ao.setTayAo(tay_ao);
        ao.setForm(formSer.findById(UUID.fromString(form_id)));
        ao.setNgayNhap(Date.from(ngayNhap.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        ao.setGiaNhap(giaNhap);
        ao.setGiaBan(giaBan);
        ao.setMoTa(mota);
        ao.setTrangThai(1);

        aoSer.add(ao);
        return "redirect:/admin/ao/view/" + ao.getId();
    }

    @PostMapping("/admin/ao/update/*")
    public String update(HttpServletRequest request) {

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/ao/update/");
        String id = parts[1];

        String ten = request.getParameter("ten1");
        String hang_id = request.getParameter("hang_id1");
        String loai_ao_id = request.getParameter("loai_ao_id1");
        String chat_vai_id = request.getParameter("chat_vai_id1");
        String co_ao = request.getParameter("co_ao1");
        String tui_ao = request.getParameter("tui_ao1");
        String tay_ao = request.getParameter("tay_ao1");
        String form_id = request.getParameter("form_id1");
        String gianhapStr = request.getParameter("gianhap1");
        String giabanStr = request.getParameter("giaban1");
        String mota = request.getParameter("mota1");

        String ngayNhapString = request.getParameter("ngayNhap1");
        LocalDate ngayNhap = LocalDate.parse(ngayNhapString);

        BigDecimal giaNhap = BigDecimal.valueOf(Integer.parseInt(gianhapStr));
        BigDecimal giaBan = BigDecimal.valueOf(Integer.parseInt(giabanStr));

        Ao updateAo = aoSer.findById(UUID.fromString(id));

        Ao ao = new Ao();

        ao.setMa(updateAo.getMa());
        ao.setTen(ten);
        ao.setHang(hangSer.findById(UUID.fromString(hang_id)));
        ao.setChatVai(chatVaiSer.findById(UUID.fromString(chat_vai_id)));
        ao.setLoaiAo(loaiAoSer.findById(UUID.fromString(loai_ao_id)));
        ao.setCoAo(co_ao);
        ao.setTui(tui_ao);
        ao.setTayAo(tay_ao);
        ao.setForm(formSer.findById(UUID.fromString(form_id)));
        ao.setNgayNhap(Date.from(ngayNhap.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        ao.setGiaNhap(giaNhap);
        ao.setGiaBan(giaBan);
        ao.setMoTa(mota);
        ao.setTrangThai(updateAo.getTrangThai());

        aoSer.update(updateAo.getId(), ao);
        return "redirect:/admin/ao/view/" + id;
    }

    @PostMapping("/admin/ao_chi_tiet/add")
    public String addAoChiTiet(HttpServletRequest request, @RequestParam(value = "size_id", required = false) List<UUID> size_id) {

        String mau_sac_id = request.getParameter("mau_sac_id");
        String soLuong = request.getParameter("soLuong");
        String ao_id = request.getParameter("ao_id");

        if (size_id != null) {
            for (int i = 0; i < size_id.size(); i++) {
                AoChiTiet aoChiTiet = new AoChiTiet();
                aoChiTiet.setAo(aoSer.findById(UUID.fromString(ao_id)));
                aoChiTiet.setMau_sac(mauSacSer.findById(UUID.fromString(mau_sac_id)));
                aoChiTiet.setSize(sizeSer.findById(size_id.get(i)));
                aoChiTiet.setSlton(Integer.parseInt(soLuong));
                aoChiTiet.setSlban(0);
                aoChiTiet.setTrangthai(1);
                aoChiTietSer.add(aoChiTiet);
            }
        }

        Ao updateAo = aoSer.findById(UUID.fromString(ao_id));

        Ao ao = new Ao();
        ao.setMa(updateAo.getMa());
        ao.setTen(updateAo.getTen());
        ao.setChatVai(updateAo.getChatVai());
        ao.setLoaiAo(updateAo.getLoaiAo());
        ao.setCoAo(updateAo.getCoAo());
        ao.setTui(updateAo.getTui());
        ao.setTayAo(updateAo.getTayAo());
        ao.setForm(updateAo.getForm());
        ao.setHang(updateAo.getHang());
        ao.setMoTa(updateAo.getMoTa());
        ao.setNgayNhap(updateAo.getNgayNhap());
        ao.setGiaNhap(updateAo.getGiaNhap());
        ao.setGiaBan(updateAo.getGiaBan());
        ao.setTrangThai(1);

        aoSer.update(updateAo.getId(), ao);

        return "redirect:/admin/ao/view/" + ao_id;
    }

    @PostMapping("/admin/ao_chi_tiet/update/*")
    public String updateAoChiTiet(HttpServletRequest request, @RequestParam(value = "size_id", required = false) List<UUID> size_id) {

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/ao_chi_tiet/update/");
        String id = parts[1];

        String mau_sac_id = request.getParameter("mau_sac_id");
        String soLuong = request.getParameter("soLuong");
        String ao_id = request.getParameter("ao_id");

        if (size_id != null) {
            for (int i = 0; i < size_id.size(); i++) {
                AoChiTiet aoChiTiet = new AoChiTiet();
                aoChiTiet.setAo(aoSer.findById(UUID.fromString(ao_id)));
                aoChiTiet.setMau_sac(mauSacSer.findById(UUID.fromString(mau_sac_id)));
                aoChiTiet.setSize(sizeSer.findById(size_id.get(i)));
                aoChiTiet.setSlton(Integer.parseInt(soLuong));
                aoChiTiet.setSlban(0);
                aoChiTiet.setTrangthai(1);
                aoChiTietSer.update(UUID.fromString(id), aoChiTiet);
            }
        }

        Ao updateAo = aoSer.findById(UUID.fromString(ao_id));

        Ao ao = new Ao();
        ao.setMa(updateAo.getMa());
        ao.setTen(updateAo.getTen());
        ao.setChatVai(updateAo.getChatVai());
        ao.setLoaiAo(updateAo.getLoaiAo());
        ao.setCoAo(updateAo.getCoAo());
        ao.setTui(updateAo.getTui());
        ao.setTayAo(updateAo.getTayAo());
        ao.setForm(updateAo.getForm());
        ao.setHang(updateAo.getHang());
        ao.setMoTa(updateAo.getMoTa());
        ao.setNgayNhap(updateAo.getNgayNhap());
        ao.setGiaNhap(updateAo.getGiaNhap());
        ao.setGiaBan(updateAo.getGiaBan());
        ao.setTrangThai(updateAo.getTrangThai());

        aoSer.update(updateAo.getId(), ao);

        return "redirect:/admin/ao/view/" + ao_id;
    }

    @PostMapping("/admin/ao/detail")
    public String aoDetail(HttpServletRequest request) {
        String detail = request.getParameter("detail");
        return "redirect:/admin/ao/view/" + detail;
    }

    @PostMapping("/admin/ao_chi_tiet/detail")
    public String aoChiTietDetail(HttpServletRequest request) {
        String detail = request.getParameter("detail");
        return "redirect:/admin/ao/view/" + detail;
    }

    @PostMapping("/admin/anh/add")
    public String anhAdd(@RequestPart("ten_url1") MultipartFile file, HttpServletRequest request) {

        String ao_id = request.getParameter("ao_id");

        Path path = Paths.get("src/main/webapp/images/");

        try {
            InputStream inputStream = file.getInputStream();
            Files.copy(inputStream, path.resolve(file.getOriginalFilename()), StandardCopyOption.REPLACE_EXISTING);

        } catch (IOException e) {
            e.printStackTrace();
        }

        Anh anh = new Anh();

        anh.setAo(aoSer.findById(UUID.fromString(ao_id)));
        anh.setTen_url(file.getOriginalFilename());
        anhSer.add(anh);

        Ao updateAo = aoSer.findById(UUID.fromString(ao_id));

        Ao ao = new Ao();
        ao.setMa(updateAo.getMa());
        ao.setTen(updateAo.getTen());
        ao.setChatVai(updateAo.getChatVai());
        ao.setLoaiAo(updateAo.getLoaiAo());
        ao.setCoAo(updateAo.getCoAo());
        ao.setTui(updateAo.getTui());
        ao.setTayAo(updateAo.getTayAo());
        ao.setForm(updateAo.getForm());
        ao.setHang(updateAo.getHang());
        ao.setMoTa(updateAo.getMoTa());
        ao.setNgayNhap(updateAo.getNgayNhap());
        ao.setGiaNhap(updateAo.getGiaNhap());
        ao.setGiaBan(updateAo.getGiaBan());
        ao.setTrangThai(2);

        aoSer.update(updateAo.getId(), ao);

        return "redirect:/admin/ao/view/" + ao_id;
    }

    @GetMapping("/admin/anh/delete/*")
    public String anhDelete(HttpServletRequest request) {

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/anh/delete/");
        String id = parts[1];

        Anh anh = anhSer.findById(UUID.fromString(id));

        Ao updateAo = aoSer.findById(anh.getAo().getId());

        Ao ao = new Ao();
        ao.setMa(updateAo.getMa());
        ao.setTen(updateAo.getTen());
        ao.setChatVai(updateAo.getChatVai());
        ao.setLoaiAo(updateAo.getLoaiAo());
        ao.setCoAo(updateAo.getCoAo());
        ao.setTui(updateAo.getTui());
        ao.setTayAo(updateAo.getTayAo());
        ao.setForm(updateAo.getForm());
        ao.setHang(updateAo.getHang());
        ao.setMoTa(updateAo.getMoTa());
        ao.setNgayNhap(updateAo.getNgayNhap());
        ao.setGiaNhap(updateAo.getGiaNhap());
        ao.setGiaBan(updateAo.getGiaBan());

        int slAnh = anhSer.soLuongAnhByIdAo(UUID.fromString(id));

        if (slAnh > 0) {
            ao.setTrangThai(updateAo.getTrangThai());
        } else if (slAnh == 0) {
            ao.setTrangThai(1);
        }

        aoSer.update(updateAo.getId(), ao);

        anhSer.delete(UUID.fromString(id));

        return "redirect:/admin/ao/view/" + updateAo.getId();
    }
}
