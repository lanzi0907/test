import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * Created with IntelliJ IDEA.
 * User: liyuwei
 * Date: 13-12-11
 * Time: 下午8:08
 * To change this template use File | Settings | File Templates.
 */
public class simpleServer {
    private int serverPort = 8000;
    private ServerSocket serverSocket;

    public simpleServer() throws IOException {
        serverSocket = new ServerSocket(serverPort,3);
        System.out.println("Server is starting");
    }

    private String echo(String msg){
        return "echo: "+msg;
    }

    private PrintWriter getWriter(Socket socket) throws IOException {
        OutputStream socketOS = socket.getOutputStream();
        return new PrintWriter(socketOS, true);
    }

    private BufferedReader getReader(Socket socket) throws IOException {
        InputStream socketIS = socket.getInputStream();
        return new BufferedReader(new InputStreamReader(socketIS));
    }

    public void service(){
        while(true){
            Socket socket = null;
            try{
                socket = serverSocket.accept();
                if(socket != null){
                    System.out.println("New socket is accepted: "+socket.getInetAddress()+" port is: "+socket.getPort());
                }

//                BufferedReader br = getReader(socket);
//                PrintWriter pw = getWriter(socket);
//
//                String msg = null;
//                while((msg = br.readLine())!= null){
//                    System.out.println("Read message: "+msg);
//                    pw.println(echo(msg));
//                    if(msg.equals("bye")){
//                        break;
//                    }
//                }
            } catch(IOException e){
                e.printStackTrace();
            } finally {
                try{
                    if(socket != null){
                        socket.close();
                    }
                } catch (IOException e){
                    e.printStackTrace();
                }

            }

        }
    }
    public static void main(String[] args) throws Exception {
        System.out.println("Hello, I am writing a simple server");
        simpleServer server = new simpleServer();
//        Thread.sleep(60000*5);
//        server.service();
        server.portScan();
    }

    public void portScan(){
        for(int port=0;port!=65536;port++){
            try{
                ServerSocket socket = new ServerSocket(port);
                socket.close();
            } catch (Exception e) {
                System.out.println("Port: "+port+" is used by other process!");
            }
        }
    }
}