package com.example.demo.ser.impl.users;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.dto.HoaDonDTO;
import com.example.demo.entity.sanpham.dto.ThongKeDTO;
import com.example.demo.repo.giamgia.GiamGiaSanPhamChiTietRepo;
import com.example.demo.repo.users.HoaDonChiTietRepo;
import com.example.demo.repo.users.HoaDonRepo;
import com.example.demo.ser.users.HoaDonSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonSerImpl implements HoaDonSer {

    @Autowired
    HoaDonRepo hoaDonRepo;

    @Autowired
    HoaDonChiTietRepo hoaDonChiTietRepo;

    @Autowired
    GiamGiaSanPhamChiTietRepo giamGiaSanPhamChiTietRepo;

    @Override
    public List<HoaDon> getAll() {
        return hoaDonRepo.findAll();
    }

    @Override
    public HoaDon findId(UUID id) {
        Optional<HoaDon> optionalHoaDon = hoaDonRepo.findById(id);
        return optionalHoaDon.orElse(null);
    }

    @Override
    public void update(UUID id, HoaDon updateHoaDon) {
        Optional<HoaDon> optionalHoaDon = hoaDonRepo.findById(id);
        if (optionalHoaDon.isPresent()) {
            HoaDon hoaDon = optionalHoaDon.get();

            hoaDon.setMa(updateHoaDon.getMa());
            hoaDon.setNgayTao(updateHoaDon.getNgayTao());
            hoaDon.setNgayThanhToan(updateHoaDon.getNgayThanhToan());
            hoaDon.setNhanVien(updateHoaDon.getNhanVien());
            hoaDon.setKhachHang(updateHoaDon.getKhachHang());
            hoaDon.setMoTa(updateHoaDon.getMoTa());
            hoaDon.setTongTien(updateHoaDon.getTongTien());
            hoaDon.setTrangThai(updateHoaDon.getTrangThai());

            hoaDonRepo.save(hoaDon);
        }
    }

    @Override
    public void add(HoaDon hoaDon) {
        hoaDonRepo.save(hoaDon);
    }

    @Override
    public Long tongSl(UUID id) {
        return hoaDonRepo.tongSl(id);
    }

    @Override
    public Page<HoaDon> listHoaDonFindByKhAndTrangThai(Integer pageNo, Integer size, UUID idKh, int trangThai) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return hoaDonRepo.listHoaDonFindByKhAndTrangThai(idKh, trangThai, pageable);
    }

    @Override
    public Page<HoaDon> listHoaDonFindByTrangThai(Integer pageNo, Integer size, int trangThai) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return hoaDonRepo.listHoaDonFindByTrangThai(trangThai, pageable);
    }

    @Override
    public List<HoaDon> findByUserAndTrangThai(UUID id, int trangThai) {
        return hoaDonRepo.findByUserAndTrangThai(id, trangThai);
    }

    @Override
    public List<HoaDonDTO> findHoaDonDT0(List<HoaDon> listHoaDons) {

        List<HoaDonDTO> hoaDonDTOS = new ArrayList<>();

        for (HoaDon hoaDon : listHoaDons) {
            int donGia = 0;
            HoaDonDTO hoaDonDTO = new HoaDonDTO();
            List<HoaDonChiTiet> listHoaDonChiTiets = hoaDonChiTietRepo.findByHoaDon(hoaDon.getId());
            for (HoaDonChiTiet hoaDonChiTiet : listHoaDonChiTiets) {
                Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();
                GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietRepo.findByIdAoAndTrangThai(ao.getId());
                if (giamGiaSanPhamChiTiet != null) {
                    donGia += (ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100) * hoaDonChiTiet.getSoLuong();
                } else {
                    donGia += ao.getGiaBan().toBigInteger().intValue() * hoaDonChiTiet.getSoLuong();
                }
            }
            hoaDonDTO.setHoaDon(hoaDon);
            hoaDonDTO.setHoaDonChiTiets(listHoaDonChiTiets);
            hoaDonDTO.setDonGia(donGia);
            hoaDonDTOS.add(hoaDonDTO);
        }
        return hoaDonDTOS;
    }

    @Override
    public HoaDon findByMa(String ma) {
        return hoaDonRepo.findByMa(ma);
    }

    @Override
    public List<ThongKeDTO> thongKeTheoNgayThanhToan() {

        List<ThongKeDTO> listThongKeDTOS = new ArrayList<>();

        List<Date> listDates = hoaDonRepo.listNgayThanhToanHoanThanh();
        for (Date date : listDates) {
            ThongKeDTO thongKeDTO = new ThongKeDTO();
            thongKeDTO.setNgayThanhToan(date);
            thongKeDTO.setSoLuong(hoaDonChiTietRepo.soLuongBanTheoNgayThanhToan(date));
            listThongKeDTOS.add(thongKeDTO);
        }

        return listThongKeDTOS;
    }

    @Override
    public int soLuongHoaDonTheoNgayandTrangThai(Date date, int trangThai) {
        return hoaDonRepo.soLuongHoaDonTheoNgayandTrangThai(date, trangThai);
    }

    @Override
    public int soLuongHoaDonHoanThanhTheoNgay(Date date) {
        return hoaDonRepo.soLuongHoaDonHoanThanhTheoNgay(date);
    }

    @Override
    public int countHoaDonDangGiaoByNgayHienTai(Date date) {
        return hoaDonRepo.countHoaDonDangGiaoByNgayHienTai(date);
    }

}
