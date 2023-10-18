package com.example.demo.repo.users;

import com.example.demo.entity.khachhang.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonRepo extends JpaRepository<HoaDon, UUID> {

    @Query("select sum(hdct.soLuong) from HoaDonChiTiet hdct where hdct.hoaDon.id = ?1")
    Long tongSl(UUID id);

    @Query("select hd from HoaDon hd where hd.khachHang.id = ?1 and hd.trangThai = ?2")
    Page<HoaDon> listHoaDonFindByKhAndTrangThai(UUID idKh, int trangThai, Pageable pageable);

    @Query("select hd from HoaDon hd where hd.trangThai = ?1")
    Page<HoaDon> listHoaDonFindByTrangThai( int trangThai, Pageable pageable);

    @Query("select hd from HoaDon hd where hd.khachHang.id = ?1 and hd.trangThai = ?2")
    List<HoaDon> findByUserAndTrangThai(UUID id, int trangThai);

    @Query("select hd from HoaDon hd where hd.ma = ?1")
    HoaDon findByMa(String ma);

    @Query("SELECT distinct hd.ngayThanhToan FROM HoaDon hd WHERE hd.ngayThanhToan IS NOT NULL")
    List<Date> listNgayThanhToanHoanThanh();

    @Query("select count(hd.ma) from HoaDon hd where hd.ngayTao = ?1 and hd.trangThai = ?2")
    int soLuongHoaDonTheoNgayandTrangThai(Date date, int trangThai);

    @Query("select count(hd.ma) from HoaDon hd where hd.ngayThanhToan = ?1")
    int soLuongHoaDonHoanThanhTheoNgay(Date date);

    @Query("SELECT COUNT(hd.ma) FROM HoaDon hd WHERE  hd.ngayTao <= ?1 AND hd.trangThai = 2")
    int countHoaDonDangGiaoByNgayHienTai(Date date);

}
