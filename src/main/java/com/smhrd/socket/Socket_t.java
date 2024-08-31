   
   //댓글 모델링 결과 뽑음
   package com.smhrd.socket;
   
   import java.io.*;
   import java.net.*;
   import java.util.List;
   import java.util.Map;
   
   import com.fasterxml.jackson.databind.ObjectMapper;
   
   import jakarta.servlet.http.HttpSession;
   
   public class Socket_t {
   
       private ServerSocket serverSocket;
       private Socket clientSocket;
       private BufferedReader in;
       private PrintWriter out;
       
       public void start(int port,String title) {
           try {
               serverSocket = new ServerSocket(port);
               System.out.println("서버 대기 중...");
   
               clientSocket = serverSocket.accept();
               System.out.println("클라이언트 연결됨");
               
               // 보내고자 하는 title 값
               String jsonData1 = "{\"title\": \"" + title + "\"}";
   
               OutputStream outputStream = clientSocket.getOutputStream();
               outputStream.write(jsonData1.getBytes());
               outputStream.flush();
               
               InputStream inputStream = clientSocket.getInputStream();
               byte[] buffer = new byte[1024];
               int bytesRead = inputStream.read(buffer);
               String jsonData = new String(buffer, 0, bytesRead);
   
               // JSON 문자열을 리스트로 변환
               ObjectMapper objectMapper = new ObjectMapper();
               Map<String, Object> receivedData = objectMapper.readValue(jsonData, Map.class);
               // 데이터 추출
               List<String> labels = (List<String>) receivedData.get("labels");
               List<Integer> counts = (List<Integer>) receivedData.get("counts");
   
               System.out.println(labels);
               System.out.println(counts);
               
               ChartController.setChartData(labels, counts);
               
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
   
