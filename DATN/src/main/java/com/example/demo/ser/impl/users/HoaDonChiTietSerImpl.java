package com.example.demo.ser.impl.users;

import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.repo.users.HoaDonChiTietRepo;
import com.example.demo.ser.users.HoaDonChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonChiTietSerImpl implements HoaDonChiTietSer {

    @Autowired
    HoaDonChiTietRepo hoaDonChiTietRepo;

    @Override
    public void add(HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietRepo.save(hoaDonChiTiet);
    }

    @Override
    public List<HoaDonChiTiet> findByHoaDon(UUID id) {
        return hoaDonChiTietRepo.findByHoaDon(id);
    }

    @Override
    public void update(UUID id, HoaDonChiTiet updateHDCT) {
        Optional<HoaDonChiTiet> optionalHoaDonChiTiet = hoaDonChiTietRepo.findById(id);
        if(optionalHoaDonChiTiet.isPresent()){
            HoaDonChiTiet hoaDonChiTiet = optionalHoaDonChiTiet.get();

            hoaDonChiTiet.setAoChiTiet(updateHDCT.getAoChiTiet());
            hoaDonChiTiet.setHoaDon(updateHDCT.getHoaDon());
            hoaDonChiTiet.setDonGia(updateHDCT.getDonGia());
            hoaDonChiTiet.setTrangThai(updateHDCT.getTrangThai());
            hoaDonChiTiet.setSoLuong(updateHDCT.getSoLuong());

            hoaDonChiTietRepo.save(hoaDonChiTiet);
        }
    }
}
