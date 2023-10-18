package com.example.demo.ser.users;

import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.sanpham.dto.HoaDonDTO;
import com.example.demo.entity.sanpham.dto.ThongKeDTO;
import org.springframework.data.domain.Page;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public interface HoaDonSer {
    List<HoaDon> getAll();

    HoaDon findId(UUID id);

    void update(UUID id, HoaDon updateHoaDon);

    void add(HoaDon hoaDon);

    Long tongSl(UUID id);

    Page<HoaDon> listHoaDonFindByKhAndTrangThai(Integer pageNo, Integer size,UUID idKh, int trangThai);

    Page<HoaDon> listHoaDonFindByTrangThai(Integer pageNo, Integer size, int trangThai);

    List<HoaDon> findByUserAndTrangThai(UUID id, int trangThai);

    List<HoaDonDTO> findHoaDonDT0(List<HoaDon> listHoaDons);

    HoaDon findByMa(String ma);

    List<ThongKeDTO> thongKeTheoNgayThanhToan();

    int soLuongHoaDonTheoNgayandTrangThai(Date date, int trangThai);

    int soLuongHoaDonHoanThanhTheoNgay(Date date);

    int countHoaDonDangGiaoByNgayHienTai(Date date);

}
