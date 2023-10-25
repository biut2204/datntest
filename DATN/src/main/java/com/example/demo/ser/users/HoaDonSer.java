package com.example.demo.ser.users;

import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.dto.DonHangDTO;
import com.example.demo.entity.dto.HoaDonDTO;
import com.example.demo.entity.dto.ThongKeDTO;
import org.springframework.data.domain.Page;

import java.time.LocalDate;
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

    int soLuongHoaDonTheoNgayandTrangThai(LocalDate date, int trangThai);

    int countHoaDonHuyByNgayHienTai(LocalDate date);

    int soLuongHoaDonHoanThanhTheoNgay(LocalDate date);

    int countHoaDonDangGiaoByNgayHienTai(LocalDate date);

    List<DonHangDTO> findAllByOrderByNgayTaoDesc();

    Page<HoaDon> listHoaDonTheoNgay(LocalDate date, Integer pageNo);

}
