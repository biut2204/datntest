package com.example.demo.controller.Chat;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.chat.MessageChat;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.repo.ChatMessageRepository;
import com.example.demo.repo.users.UsersRepo;
import com.example.demo.ser.users.UsersSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class ChatController {
    @Autowired
    private ChatMessageRepository chatMessageRepository;
    @Autowired
    private UsersRepo userRepository;

    @Autowired
    UsersSer usersSer;

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/publicChatRoom")
    public MessageChat sendMessage(@Payload MessageChat message) {
        Users u = userRepository.findByMa(message.getUsers().getMa());
        message.setUsers(u);
        message.setTimestamp(LocalDateTime.now());
        message.setBientrunggian(message.getBientrunggian());
        chatMessageRepository.save(message);
        return message;
    }

    @GetMapping("user/chat/*")
    public String chatPage(HttpServletRequest request, Model model) {

        String url = request.getRequestURI();
        String[] p = url.split("user/chat/");
        String ma = p[1];

        model.addAttribute("check", ma);
        Users users = usersSer.findByMa(ma);
        List<MessageChat> messages = chatMessageRepository.findAllByBientrunggian(ma);
        model.addAttribute("messages", messages);
        model.addAttribute("ten", users.getTen());
        return "/admin/chat_app1";
    }

    @GetMapping("admin/chat/{ma}")
    public String chatPage1(@PathVariable String ma, Model model) {
        model.addAttribute("user",userRepository.findByRole(RoleEnum.MENBER));
        model.addAttribute("check", ma);
        model.addAttribute("check1", "005");
        List<MessageChat> messages = chatMessageRepository.findAllByBientrunggian(ma);
        model.addAttribute("messages", messages);
        return "/admin/chat_app";
    }
    @GetMapping("admin/chat")
    public String chatPage12(Model model) {
        model.addAttribute("user",userRepository.findByRole(RoleEnum.MENBER));
        return "/admin/chat_app";
    }
//    @GetMapping("/chat/admin")
//    public String chatadmin(Model model) {
//        List<Message> messages = chatMessageRepository.findAllByBientrunggian("003");
//        model.addAttribute("messages", messages);
//        return "/admin/chat1";
//    }
//
//    @PostMapping("/send")
//    @ResponseBody
//    public String sendMessage(@RequestParam String content) {
//        Message message = new Message();
//        message.setContent(content);
//        Users u = userRepository.findByMa("003");
//        message.setUsers(u);
//        message.setTimestamp(LocalDateTime.now());
//        message.setBientrunggian(u.getMa());
//        chatMessageRepository.save(message);
//        return "Message sent";
//    }
//    @PostMapping("/send1")
//    @ResponseBody
//    public String senadmin(@RequestParam String content) {
//        Message message = new Message();
//        message.setContent(content);
//        Users u = userRepository.findByMa("Admin");
//        message.setUsers(u);
//        message.setTimestamp(LocalDateTime.now());
//        message.setBientrunggian("003");
//        chatMessageRepository.save(message);
//        return "Message sent";
//    }
}
