package com.example.demo.controller.admin.auth;

import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.ser.users.UsersSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AuthController {

    @Autowired
    UsersSer usersSer;

    @GetMapping("/login")
    public String showLoginForm(Model model){
        model.addAttribute("user",new Users());
        return "/admin/login";
    }

    @GetMapping("/404")
    public String test404(Model model){
        model.addAttribute("user",new Users());
        return "/test";
    }

    @PostMapping("/login")
    public String login(HttpSession session, HttpServletRequest request){
        String tk = request.getParameter("taiKhoan");
        String mk = request.getParameter("matKhau");

        Users user = usersSer.findByEmailAndMatKhau(tk, mk);

        if (user.getRole() == RoleEnum.ADMIN){
            session.setAttribute("userLogged",user);
            return "redirect:/admin/index/1";
        }else if (user.getRole() == RoleEnum.MENBER){
            session.setAttribute("userLogged1",user);
            return "redirect:/user/trang_chu/"+user.getMa();
        }
        return "redirect:/admin/ao/view/1";
    }

}
