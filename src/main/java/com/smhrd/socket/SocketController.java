package com.smhrd.socket;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;


@Controller
public class SocketController {

    private Socket_t socketServer;
    private Thread socketThread;

    @GetMapping("/startSocket")
    public String startSocketServer(String title,HttpSession session) {
       System.out.println(title);
       session.setAttribute("titlename", title);
        if (socketServer == null) {
            socketServer = new Socket_t();
            socketThread = new Thread(() -> socketServer.start(12345,title));  // 스레드로 소켓 서버 실행
            socketThread.start();
            System.out.println("지금 실행 시작");
        } else {
            System.out.println("이미실행중");
        }
        return "redirect:/showChart";
    }

    @GetMapping("/stopSocket")
    public String stopSocketServer() {
        if (socketServer != null) {
            socketServer.stop();  // 소켓 서버 중지
            socketServer = null;
            return "소켓 서버가 중지되었습니다.";
        } else {
            return "소켓 서버가 실행 중이 아닙니다.";
        }
    }
    
}