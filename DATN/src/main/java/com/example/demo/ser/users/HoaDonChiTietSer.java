package com.example.demo.ser.users;


import com.example.demo.entity.khachhang.HoaDonChiTiet;

import java.util.List;
import java.util.UUID;

public interface HoaDonChiTietSer {
    void add(HoaDonChiTiet hoaDonChiTiet);

    List<HoaDonChiTiet> findByHoaDon(UUID id);
}
