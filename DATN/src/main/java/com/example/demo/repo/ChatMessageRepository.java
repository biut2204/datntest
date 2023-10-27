package com.example.demo.repo;

import com.example.demo.entity.chat.MessageChat;
import com.example.demo.entity.khachhang.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatMessageRepository extends JpaRepository<MessageChat,Integer> {
    List<MessageChat> findAllByBientrunggian(String a);

    @Query(value = "SELECT ChatMessage.iduser\n" +
            "FROM ChatMessage\n" +
            "INNER JOIN Users ON ChatMessage.iduser = Users.Id\n" +
            "INNER JOIN ThoiGian ON ThoiGian.iduser = Users.Id\n" +
            "where Role='MENBER'\n" +
            "GROUP BY ChatMessage.iduser , ThoiGian.timestamp\n" +
            "ORDER BY ThoiGian.timestamp DESC;",nativeQuery = true)
    List<Users> list();

}
