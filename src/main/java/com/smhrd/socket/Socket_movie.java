
//영상 호출
package com.smhrd.socket;

import java.io.*;
import java.net.*;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Socket_movie {

    private ServerSocket serverSocket;
    private Socket clientSocket;
    private BufferedReader in;
    private PrintWriter out;

    public void start(int port) {
        try {
            serverSocket = new ServerSocket(port);
            System.out.println("서버 대기 중...");

            clientSocket = serverSocket.accept();
            System.out.println("클라이언트 연결됨");

            InputStream inputStream = clientSocket.getInputStream();
            byte[] buffer = new byte[1024];
            int bytesRead = inputStream.read(buffer);
            String jsonData = new String(buffer, 0, bytesRead);

            // JSON 문자열을 리스트로 변환
            ObjectMapper objectMapper = new ObjectMapper();
            List<Object> receivedData = objectMapper.readValue(jsonData, List.class);

            // 데이터 추출
            List<String> data1 = (List<String>) receivedData.get(0);
            List<Integer> data2 = (List<Integer>) receivedData.get(1);

            System.out.println("Data 1: " + data1);
            System.out.println("Data 2: " + data2);

            // 소켓 닫기
            clientSocket.close();
            serverSocket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void stop() {
        try {
            if (in != null) in.close();
            if (out != null) out.close();
            if (clientSocket != null) clientSocket.close();
            if (serverSocket != null) serverSocket.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

