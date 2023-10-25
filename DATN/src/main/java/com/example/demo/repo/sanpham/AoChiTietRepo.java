package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.entity.sanpham.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface AoChiTietRepo extends JpaRepository<AoChiTiet, UUID> {

    @Query("select act from AoChiTiet act where act.ao.id = ?1 ORDER BY act.mau_sac.ten ASC")
    List<AoChiTiet> findByAoId(UUID id);
    @Query("select act.size from AoChiTiet act where act.ao.id = ?1")
    List<Size> findSizeByIdAo(UUID idAo);

    @Query("select act.mau_sac from AoChiTiet act where act.ao.id = ?1")
    List<MauSac> findMauSacByIdAo(UUID idAo);

    @Query("select p from AoChiTiet p where p.ao.id = ?1 and p.mau_sac.id = ?2 and p.size.id = ?3")
    AoChiTiet findIdByIdAoMsSize(UUID id, UUID idMauSac, UUID idSize);

    @Query("select count(act.ao.id) from AoChiTiet act where act.ao.id = ?1")
    int soLuongAoChiTietByIdAo(UUID id);

    @Query("select p from AoChiTiet p where p.ao.ma = ?1 and p.mau_sac.ma = ?2 and p.size.ma = ?3")
    AoChiTiet findByMaAoMsSize(String id, String idMauSac, String idSize);
}
