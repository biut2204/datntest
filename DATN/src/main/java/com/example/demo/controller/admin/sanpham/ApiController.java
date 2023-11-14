package com.example.demo.controller.admin.sanpham;

import com.example.demo.entity.dto.AoDTO;
import com.example.demo.entity.dto.BieuDoDoanhThuDTO;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.coyote.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
@CrossOrigin("*")
public class ApiController {

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    AoChiTietSer aoChiTietSer;


    private BieuDoDoanhThuDTO chartData = new BieuDoDoanhThuDTO();

    @GetMapping("/api/chart-data-doanhthu")
    public BieuDoDoanhThuDTO getChartData(@RequestParam String startDate, @RequestParam String endDate) {
        LocalDate date1 = null, date2 = null;
        List<Integer> thang = hoaDonSer.getDataThang(date1, date2);
        List<String> getThang = new ArrayList<>();
        for (int i = 0; i < thang.size(); i++) {
            String a = "Thg " + thang.get(i);
            getThang.add(a);
        }
        List<Double> getDoanhThu = hoaDonSer.doanhThuTheoThang(date1, date2);
        chartData.setLabels(getThang);
        chartData.setDatasetData(getDoanhThu);
        return chartData;
    }

    @GetMapping("/api/thong_ke_so_luong_ao/{maLoaiAo}")
    public ResponseEntity<?> thongKeAo(@PathVariable String maLoaiAo) {

        List<AoDTO> listAoDTOS = aoChiTietSer.thongKeAoDto(maLoaiAo);
        return ResponseEntity.ok(listAoDTOS);
    }
}
