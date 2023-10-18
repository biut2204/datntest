package com.example.demo.entity.sanpham.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ThongKeDTO {

    Date ngayThanhToan;

    int soLuong;
}
