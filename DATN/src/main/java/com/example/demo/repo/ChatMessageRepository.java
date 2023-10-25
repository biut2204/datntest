package com.example.demo.repo;

import com.example.demo.entity.chat.MessageChat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChatMessageRepository extends JpaRepository<MessageChat,Integer> {
    List<MessageChat> findAllByBientrunggian(String a);

}
