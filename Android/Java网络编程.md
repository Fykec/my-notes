parent nodes: [Android\_Wiki](Android_Wiki.html)\
\

Java网络编程 {.heading-level2}
------------

课前索引\
 课前思考\
 　　1. 什么是TCP/ IP协议？\
 　　2. TCP/IP有哪两种传输协议,各有什么特点？\
 　　3. 什么是URL？\
 　　4. URL和IP地址有什么样的关系？\
 　　5. 什么叫套接字（Socket）？\
 　　6. 套接字（Socket）和TCP/IP协议的关系？\
 　　7. URL和套接字（Socket）的关系？\
 8．1 网络编程基本概念，TCP/IP协议简介\
 8.1.1 网络基础知识\

网络编程的目的就是指直接或间接地通过网络协议与其他计算机进行通讯。网络编程中有两个主要的问题，一个是如何准确的定位网络上一台或多台主机，另一个就是找到主机后如何可靠高效的进行数据传输。在TCP/IP协议中IP层主要负责网络主机的定位，数据传输的路由，由IP地址可以唯一地确定Internet上的一台主机。而TCP层则提供面向应用的可靠的或非可靠的数据传输机制，这是网络编程的主要对象，一般不需要关心IP层是如何处理数据的。\

　　目前较为流行的网络编程模型是客户机/服务器（C/S）结构。即通信双方一方作为服务器等待客户提出请求并予以响应。客户则在需要服务时向服务器提出申请。服务器一般作为守护进程始终运行，监听网络端口，一旦有客户请求，就会启动一个服务进程来响应该客户，同时自己继续监听服务端口，使后来的客户也能及时得到服务。\
 8.1.3两类传输协议：TCP；UDP\

　　尽管TCP/IP协议的名称中只有TCP这个协议名，但是在TCP/IP的传输层同时存在TCP和UDP两个协议。\
 TCP是Tranfer Control
Protocol的简称，是一种面向连接的保证可靠传输的协议。通过TCP协议传输，得到的是一个顺序的无差错的数据流。发送方和接收方的成对的两个socket之间必须建立连接，以便在TCP协议的基础上进行通信，当一个socket（通常都是server
socket）等待建立连接时，另一个socket可以要求进行连接，一旦这两个socket连接起来，它们就可以进行双向数据传输，双方都可以进行发送或接收操作。\
 　　UDP是User Datagram
Protocol的简称，是一种无连接的协议，每个数据报都是一个独立的信息，包括完整的源地址或目的地址，它在网络上以任何可能的路径传往目的地，因此能否到达目的地，到达目的地的时间以及内容的正确性都是不能被保证的。
\
 　　下面我们对这两种协议做简单比较：\

　　使用UDP时，每个数据报中都给出了完整的地址信息，因此无需要建立发送方和接收方的连接。对于TCP协议，由于它是一个面向连接的协议，在socket之间进行数据传输之前必然要建立连接，所以在TCP中多了一个连接建立的时间。

　　总之，TCP在网络通信上有极强的生命力，例如远程连接（Telnet）和文件传输（FTP）都需要不定长度的数据被可靠地传输。相比之下UDP操作简单，而且仅需要较少的监护，因此通常用于局域网高可靠性的分散系统中client/server应用程序。\

　　读者可能要问，既然有了保证可靠传输的TCP协议，为什么还要非可靠传输的UDP协议呢？主要的原因有两个。一是可靠的传输是要付出代价的，对数据内容正确性的检验必然占用计算机的处理时间和网络的带宽，因此TCP传输的效率不如UDP高。二是在许多应用中并不需要保证严格的传输可靠性，比如视频会议系统，并不要求音频视频数据绝对的正确，只要保证连贯性就可以了，这种情况下显然使用UDP会更合理一些。\
 8．2 基于URL的高层次Java网络编程\
 8.2.1一致资源定位器URL\
 URL(Uniform Resource
Locator)是一致资源定位器的简称，它表示Internet上某一资源的地址。通过URL我们可以访问Internet上的各种网络资源，比如最常见的WWW，FTP站点。浏览器通过解析给定的URL可以在网络上查找相应的文件或其他资源。\
 8.2.2 URL的组成\
 protocol://resourceName\

　　协议名（protocol）指明获取资源所使用的传输协议，如http、ftp、gopher、file等，资源名（resourceName）则应该是资源的完整地址，包括主机名、端口号、文件名或文件内部的一个引用。例如：\
 　　[http://www.sun.com/](http://www.sun.com/) 协议名://主机名\

　　[http://home.netscape.com/home/welcome.html](http://home.netscape.com/home/welcome.html)
协议名://机器名＋文件名\

　　[http://www.gamelan.com:80/Gamelan/network.html\#BOTTOM](http://www.gamelan.com:80/Gamelan/network.html#BOTTOM)
协议名://机器名＋端口号＋文件名＋内部引用.\
 8.2.3 创建一个URL\
 为了表示URL，
java.net中实现了类URL。我们可以通过下面的构造方法来初始化一个URL对象：\
 　　（1） public URL (String spec);\
 　　　　　通过一个表示URL地址的字符串可以构造一个URL对象。\
 　　　　　URL urlBase=new URL("<http://www>. 263.net/") \
 　　（2） public URL(URL context, String spec);\
 　　　　　通过基URL和相对URL构造一个URL对象。\
 　　　　　URL net263=new URL
("[http://www.263.net/](http://www.263.net/)");\
 　　　　　URL index263=new URL(net263, "index.html")\
 　　（3） public URL(String protocol, String host, String file);\
 　　　　　new URL("http", "www.gamelan.com", "/pages/Gamelan.net.
html");\
 　　（4） public URL(String protocol, String host, int port, String
file);\
 　　　　　URL gamelan=new URL("http", "www.gamelan.com", 80,
"Pages/Gamelan.network.html");\

　　注意：类URL的构造方法都声明抛弃非运行时例外（MalformedURLException），因此生成URL对象时，我们必须要对这一例外进行处理，通常是用try-catch语句进行捕获。格式如下：\
 try{\
 　　　　　URL myURL= new URL(…)\
 　　}catch (MalformedURLException e){\
 　　…　　}\
 8.2.4 解析一个URL\

一个URL对象生成后，其属性是不能被改变的，但是我们可以通过类URL所提供的方法来获取这些属性：\
 　　　public String getProtocol() 获取该URL的协议名。\
 　　　public String getHost() 获取该URL的主机名。\
 　　　public int getPort()
获取该URL的端口号，如果没有设置端口，返回-1。\
 　　　public String getFile() 获取该URL的文件名。\
 　　　public String getRef() 获取该URL在文件中的相对位置。\
 　　　public String getQuery() 获取该URL的查询信息。\
 　　　public String getPath() 获取该URL的路径\
 　　 public String getAuthority() 获取该URL的权限信息\
 　　　public String getUserInfo() 获得使用者的信息\
 　　　 public String getRef() 获得该URL的锚\
 8.2.5 从URL读取WWW网络资源\

当我们得到一个URL对象后，就可以通过它读取指定的WWW资源。这时我们将使用URL的方法openStream()，其定义为：\
 　　　　　　　　　InputStream openStream();\
 　　\

　　方法openSteam()与指定的URL建立连接并返回InputStream类的对象以从这一连接中读取数据。\
 　　public class URLReader {\
 　　public static void main(String[] args) throws Exception { \
 　　　　　　　　　　　　　　　　　　　　　　//声明抛出所有例外\
 　　　　URL tirc = new
URL("[http://www.tirc1.cs.tsinghua.edu.cn/](http://www.tirc1.cs.tsinghua.edu.cn/)");
\
 　　　　　　　　　　　　　　　　　　　　　　//构建一URL对象\
 　　　　BufferedReader in = new BufferedReader(new
InputStreamReader(tirc.openStream()));\
 　　　　//使用openStream得到一输入流并由此构造一个BufferedReader对象\
 　　　　String inputLine;\
 　　　　while ((inputLine = in.readLine()) != null) \
 　　　　　　　　　　　　　　　　　//从输入流不断的读数据，直到读完为止\
 　　　　　　　System.out.println(inputLine);
//把读入的数据打印到屏幕上\
 　　　　in.close(); //关闭输入流\
 　　}\
 　　}\
 8.2.6 通过URLConnetction连接WWW\

通过URL的方法openStream()，我们只能从网络上读取数据，如果我们同时还想输出数据，例如向服务器端的CGI程序发送一些数据，我们必须先与URL建立连接，然后才能对其进行读写，这时就要用到类URLConnection了。CGI是公共网关接口（Common
Gateway
Interface）的简称，它是用户浏览器和服务器端的应用程序进行连接的接口，有关CGI程序设计，请读者参考有关书籍。\

　　类URLConnection也在包java.net中定义，它表示Java程序和URL在网络上的通信连接。当与一个URL建立连接时，首先要在一个URL对象上通过方法openConnection()生成对应的URLConnection对象。例如下面的程序段首先生成一个指向地址[http://edu.chinaren.com/index.shtml的对象，然后用openConnection（）打开该URL对象上的一个连接，返回一个URLConnection对象。如果连接过程失败，将产生IOException](http://edu.chinaren.com/index.shtml的对象，然后用openConnection（）打开该URL对象上的一个连接，返回一个URLConnection对象。如果连接过程失败，将产生IOException).\
 　　Try{\
 　　　　URL netchinaren = new URL
("[http://edu.chinaren.com/index.shtml](http://edu.chinaren.com/index.shtml)");\
 　　　　URLConnectonn tc = netchinaren.openConnection();\
 　　}catch(MalformedURLException e){ //创建URL()对象失败\
 　　…\
 　　}catch (IOException e){ //openConnection()失败\
 　　…\
 　　}\

　　类URLConnection提供了很多方法来设置或获取连接参数，程序设计时最常使用的是getInputStream()和getOurputStream(),其定义为：\
 　　　　　InputSteram getInputSteram();\
 　　　　　OutputSteram getOutputStream();\
 　　通过返回的输入/输出流我们可以与远程对象进行通信。看下面的例子：\
 　　URL url =new URL
("[http://www.javasoft.com/cgi-bin/backwards](http://www.javasoft.com/cgi-bin/backwards)");
\
 　　//创建一URL对象\
 　　URLConnectin con=url.openConnection(); \
 　　//由URL对象获取URLConnection对象\
 　　DataInputStream dis=new DataInputStream (con.getInputSteam()); \
 　　//由URLConnection获取输入流，并构造DataInputStream对象\
 　　PrintStream ps=new PrintSteam(con.getOutupSteam());\
 　　//由URLConnection获取输出流，并构造PrintStream对象\
 　　String line=dis.readLine(); //从服务器读入一行\
 　　ps.println("client…"); //向服务器写出字符串 "client…"\

　　　　其中backwards为服务器端的CGI程序。实际上，类URL的方法openSteam（）是通过URLConnection来实现的。它等价于\
 　　　　openConnection().getInputStream();\

　　基于URL的网络编程在底层其实还是基于下面要讲的Socket接口的。WWW，FTP等标准化的网络服务都是基于TCP协议的，所以本质上讲URL编程也是基于TCP的一种应用.\
 8．3 基于Socket的低层次Java网络编程\
 8.3.1 Socket通讯\

网络上的两个程序通过一个双向的通讯连接实现数据的交换，这个双向链路的一端称为一个Socket。Socket通常用来实现客户方和服务方的连接。Socket是TCP/IP协议的一个十分流行的编程界面，一个Socket由一个IP地址和一个端口号唯一确定。\

　　在传统的UNIX环境下可以操作TCP/IP协议的接口不止Socket一个，Socket所支持的协议种类也不光TCP/IP一种，因此两者之间是没有必然联系的。在Java环境下，Socket编程主要是指基于TCP/IP协议的网络编程。\
 8.3.2 Socket通讯的一般过程\

使用Socket进行Client/Server程序设计的一般连接过程是这样的：Server端Listen(监听)某个端口是否有连接请求，Client端向Server端发出Connect(连接)请求，Server端向Client端发回Accept（接受）消息。一个连接就建立起来了。Server端和Client端都可以通过Send，Write等方法与对方通信。\

对于一个功能齐全的Socket，都要包含以下基本结构，其工作过程包含以下四个基本的步骤：\
 　　（1） 创建Socket；\
 　　（2） 打开连接到Socket的输入/出流；\
 　　（3） 按照一定的协议对Socket进行读/写操作；\
 　　（4） 关闭Socket.\
 8.3.3 创建Socket\

java在包java.net中提供了两个类Socket和ServerSocket，分别用来表示双向连接的客户端和服务端。这是两个封装得非常好的类，使用很方便。其构造方法如下：\
 　　Socket(InetAddress address, int port);\
 　　Socket(InetAddress address, int port, boolean stream);\
 　　Socket(String host, int prot);\
 　　Socket(String host, int prot, boolean stream);\
 　　Socket(SocketImpl impl)\
 　　Socket(String host, int port, InetAddress localAddr, int
localPort)\
 　　Socket(InetAddress address, int port, InetAddress localAddr, int
localPort)\
 　　ServerSocket(int port);\
 　　ServerSocket(int port, int backlog);\
 　　ServerSocket(int port, int backlog, InetAddress bindAddr)\

　　其中address、host和port分别是双向连接中另一方的IP地址、主机名和端口号，stream指明socket是流socket还是数据报socket，localPort表示本地主机的端口号，localAddr和bindAddr是本地机器的地址（ServerSocket的主机地址），impl是socket的父类，既可以用来创建serverSocket又可以用来创建Socket。count则表示服务端所能支持的最大连接数。例如：\
 　　Socket client = new Socket("127.0.01.", 80);\
 　　ServerSocket server = new ServerSocket(80);\

　　注意，在选择端口时，必须小心。每一个端口提供一种特定的服务，只有给出正确的端口，才能获得相应的服务。0\~1023的端口号为系统所保留，例如http服务的端口号为80,telnet服务的端口号为21,ftp服务的端口号为23,
所以我们在选择端口号时，最好选择一个大于1023的数以防止发生冲突。\

　　在创建socket时如果发生错误，将产生IOException，在程序中必须对之作出处理。所以在创建Socket或ServerSocket是必须捕获或抛出例外。\
 8.3.8 简单的Client/Server程序设计\

下面我们给出一个用Socket实现的客户和服务器交互的典型的C/S结构的演示程序，读者通过仔细阅读该程序，会对前面所讨论的各个概念有更深刻的认识。程序的意义请参考注释。\
 1. 客户端程序\
 　　import java.io.**;\
 　　import java.net.**;\
 　　public class TalkClient {\
 　　　　public static void main(String args[]) {\
 　　　　　　try{\
 　　　　　　　　Socket socket=new Socket("127.0.0.1",4700); \
 　　　　　　　　//向本机的4700端口发出客户请求\
 　　　　　　　　BufferedReader sin=new BufferedReader(new
InputStreamReader(System.in));\
 　　　　　　　　//由系统标准输入设备构造BufferedReader对象\
 　　　　　　　　PrintWriter os=new
PrintWriter(socket.getOutputStream());\
 　　　　　　　　//由Socket对象得到输出流，并构造PrintWriter对象\
 　　　　　　　　BufferedReader is=new BufferedReader(new
InputStreamReader(socket.getInputStream()));\

　　　　　　　　//由Socket对象得到输入流，并构造相应的BufferedReader对象\
 　　　　　　　　String readline;\
 　　　　　　　　readline=sin.readLine(); //从系统标准输入读入一字符串\
 　　　　　　　　while(!readline.equals("bye")){ \
 　　　　　　　　//若从标准输入读入的字符串为 "bye"则停止循环\
 　　　　　　　　　　os.println(readline); \
 　　　　　　　　　　//将从系统标准输入读入的字符串输出到Server\
 　　　　　　　　　　os.flush(); \
 　　　　　　　　　　//刷新输出流，使Server马上收到该字符串\
 　　　　　　　　　　System.out.println("Client:"+readline); \
 　　　　　　　　　　//在系统标准输出上打印读入的字符串\
 　　　　　　　　　　System.out.println("Server:"+is.readLine()); \
 　　　　　　　　　　//从Server读入一字符串，并打印到标准输出上\
 　　　　　　　　　　readline=sin.readLine();
//从系统标准输入读入一字符串\
 　　　　　　　　} //继续循环\
 　　　　　　　　os.close(); //关闭Socket输出流\
 　　　　　　　　is.close(); //关闭Socket输入流\
 　　　　　　　　socket.close(); //关闭Socket\
 　　　　　　}catch(Exception e) {\
 　　　　　　　　System.out.println("Error"+e); //出错，则打印出错信息\
 　　　　　　}\
 　　}\
 }\
 　2. 服务器端程序\
 　　import java.io.**;\
 　　import java.net.**;\
 　　import java.applet.Applet;\
 　　public class TalkServer{\
 　　　　public static void main(String args[]) {\
 　　　　　　try{\
 　　　　　　　　ServerSocket server=null;\
 　　　　　　　　try{ \
 　　　　　　　　　　server=new ServerSocket(4700); \
 　　　　　　　　//创建一个ServerSocket在端口4700监听客户请求\
 　　　　　　　　}catch(Exception e) {\
 　　　　　　　　　　System.out.println("can not listen to:"+e); \
 　　　　　　　　//出错，打印出错信息\
 　　　　　　　　}\
 　　　　　　　　Socket socket=null;\
 　　　　　　　　try{\
 　　　　　　　　　　socket=server.accept(); \
 　　　　　　　　　　//使用accept()阻塞等待客户请求，有客户\
 　　　　　　　　　　//请求到来则产生一个Socket对象，并继续执行\
 　　　　　　　　}catch(Exception e) {\
 　　　　　　　　　　System.out.println("Error."+e); \
 　　　　　　　　　　//出错，打印出错信息\
 　　　　　　　　}\
 　　　　　　　　String line;\
 　　　　　　　　BufferedReader is=new BufferedReader(new
InputStreamReader(socket.getInputStream()));\

　　　　　　　　　//由Socket对象得到输入流，并构造相应的BufferedReader对象\
 　　　　　　　　PrintWriter
os=newPrintWriter(socket.getOutputStream());\
 　　　　　　　　　//由Socket对象得到输出流，并构造PrintWriter对象\
 　　　　　　　　BufferedReader sin=new BufferedReader(new
InputStreamReader(System.in));\
 　　　　　　　　　//由系统标准输入设备构造BufferedReader对象\
 　　　　　　　　System.out.println("Client:"+is.readLine()); \
 　　　　　　　　//在标准输出上打印从客户端读入的字符串\
 　　　　　　　　line=sin.readLine(); \
 　　　　　　　　//从标准输入读入一字符串\
 　　　　　　　　while(!line.equals("bye")){ \
 　　　　　　　　//如果该字符串为 "bye"，则停止循环\
 　　　　　　　　　　os.println(line); \
 　　　　　　　　　　//向客户端输出该字符串\
 　　　　　　　　　　os.flush(); \
 　　　　　　　　　　//刷新输出流，使Client马上收到该字符串\
 　　　　　　　　　　System.out.println("Server:"+line); \
 　　　　　　　　　　//在系统标准输出上打印读入的字符串\
 　　　　　　　　　　System.out.println("Client:"+is.readLine());\
 　　　　　　　　　　//从Client读入一字符串，并打印到标准输出上\
 　　　　　　　　　　line=sin.readLine(); \
 　　　　　　　　　　//从系统标准输入读入一字符串\
 　　　　　　　　} 　//继续循环\
 　　　　　　　　os.close(); //关闭Socket输出流\
 　　　　　　　　is.close(); //关闭Socket输入流\
 　　　　　　　　socket.close(); //关闭Socket\
 　　　　　　　　server.close(); //关闭ServerSocket\
 　　　　　　}catch(Exception e){\
 　　　　　　　　System.out.println("Error:"+e); \
 　　　　　　　　//出错，打印出错信息\
 　　　　　　}\
 　　　　}\
 　　}\
 \
 8.3.9 支持多客户的client/server程序设计\

前面提供的Client/Server程序只能实现Server和一个客户的对话。在实际应用中，往往是在服务器上运行一个永久的程序，它可以接收来自其他多个客户端的请求，提供相应的服务。为了实现在服务器方给多个客户提供服务的功能，需要对上面的程序进行改造，利用多线程实现多客户机制。服务器总是在指定的端口上监听是否有客户请求，一旦监听到客户请求，服务器就会启动一个专门的服务线程来响应该客户的请求，而服务器本身在启动完线程之后马上又进入监听状态，等待下一个客户的到来。\
 ServerSocket serverSocket=null;\
 　　　　boolean listening=true;\
 　　　　try{\
 　　　　　　serverSocket=new ServerSocket(4700); \
 　　　　　　//创建一个ServerSocket在端口4700监听客户请求\
 　　　　}catch(IOException e) {　　}\
 　　　　while(listening){ //永远循环监听\
 　　　　　　new ServerThread(serverSocket.accept(),clientnum).start();\
 　　　　　　//监听到客户请求，根据得到的Socket对象和\
 　　　　　　　客户计数创建服务线程，并启动之\
 　　　　　　clientnum++; //增加客户计数\
 　　　　}\
 　　　　serverSocket.close(); //关闭ServerSocket\
 设计ServerThread类\
 　public class ServerThread extends Thread{\
 　　　Socket socket=null; //保存与本线程相关的Socket对象\
 　　　int clientnum; //保存本进程的客户计数\
 　　　public ServerThread(Socket socket,int num) { //构造函数\
 　　　　this.socket=socket; //初始化socket变量\
 　　　　clientnum=num+1; //初始化clientnum变量\
 　　　}\
 　　　public void run() { //线程主体\
 　　　　try{//在这里实现数据的接受和发送}\
 8.3.10 据报Datagram通讯\

前面在介绍TCP/IP协议的时候，我们已经提到，在TCP/IP协议的传输层除了TCP协议之外还有一个UDP协议，相比而言UDP的应用不如TCP广泛，几个标准的应用层协议HTTP，FTP，SMTP…使用的都是TCP协议。但是，随着计算机网络的发展，UDP协议正越来越来显示出其威力，尤其是在需要很强的实时交互性的场合，如网络游戏，视频会议等，UDP更是显示出极强的威力，下面我们就介绍一下Java环境下如何实现UDP网络传输。\
 8.3.11 什么是Datagram\

所谓数据报（Datagram）就跟日常生活中的邮件系统一样，是不能保证可靠的寄到的，而面向链接的TCP就好比电话，双方能肯定对方接受到了信息。在本章前面，我们已经对UDP和TCP进行了比较，在这里再稍作小节：\
 　　TCP，可靠，传输大小无限制，但是需要连接建立时间，差错控制开销大。\

　　UDP，不可靠，差错控制开销较小，传输大小限制在64K以下，不需要建立连接。\
 8.3.12 Datagram通讯的表示方法：DatagramSocket；DatagramPacket\

包java.net中提供了两个类DatagramSocket和DatagramPacket用来支持数据报通信，DatagramSocket用于在程序之间建立传送数据报的通信连接，
DatagramPacket则用来表示一个数据报。先来看一下DatagramSocket的构造方法：\
 　　　DatagramSocket（）；\
 　　　DatagramSocket（int prot）;\
 　　　DatagramSocket(int port, InetAddress laddr)\

　　　　其中，port指明socket所使用的端口号，如果未指明端口号，则把socket连接到本地主机上一个可用的端口。laddr指明一个可用的本地地址。给出端口号时要保证不发生端口冲突，否则会生成SocketException类例外。注意：上述的两个构造方法都声明抛弃非运行时例外SocketException，程序中必须进行处理，或者捕获、或者声明抛弃。

　　　DatagramPacket（byte buf[],int length）；\
 　　　DatagramPacket(byte buf[], int length, InetAddress addr, int
port);\
 　　　DatagramPacket(byte[] buf, int offset, int length)；\
 　　　DatagramPacket(byte[] buf, int offset, int length, InetAddress
address, int port)；\
 \

　　其中，buf中存放数据报数据，length为数据报中数据的长度，addr和port旨明目的地址，offset指明了数据报的位移量。\

　　在接收数据前，应该采用上面的第一种方法生成一个DatagramPacket对象，给出接收数据的缓冲区及其长度。然后调用DatagramSocket
的方法receive()等待数据报的到来，receive()将一直等待，直到收到一个数据报为止。\
 　　DatagramPacket packet=new DatagramPacket(buf, 256);\
 　　Socket.receive (packet);\

　　发送数据前，也要先生成一个新的DatagramPacket对象，这时要使用上面的第二种构造方法，在给出存放发送数据的缓冲区的同时，还要给出完整的目的地址，包括IP地址和端口号。发送数据是通过DatagramSocket的方法send()实现的，send()根据数据报的目的地址来寻径，以传递数据报。\
 　　DatagramPacket packet=new DatagramPacket(buf, length, address,
port);\
 　　Socket.send(packet)；

8.3.14 用数据报进行广播通讯\

DatagramSocket只允许数据报发送一个目的地址，java.net包中提供了一个类MulticastSocket，允许数据报以广播方式发送到该端口的所有客户。MulticastSocket用在客户端，监听服务器广播来的数据。\
 1. 客户方程序:MulticastClient.java\
 　　import java.io.**;\
 　　import java.net.**;\
 　　import java.util.**;\
 　　public class MulticastClient {\
 　　　　public static void main(String args[]) throws IOException\
 　　　　{\
 　　　　　MulticastSocket socket=new MulticastSocket(4446); \
 　　　　　//创建4446端口的广播套接字\
 　　　　　InetAddress address=InetAddress.getByName("230.0.0.1"); \
 　　　　　//得到230.0.0.1的地址信息\
 　　　　　socket.joinGroup(address); \
 　　　　　//使用joinGroup()将广播套接字绑定到地址上\
 　　　　　DatagramPacket packet;\
 　　　　　for(int i=0;i\<5;i++) {\
 　　　　　　　byte[] buf=new byte[[256]](#.f256); \
 　　　　　　　//创建缓冲区\
 　　　　　　　packet=new DatagramPacket(buf,buf.length); \
 　　　　　　　//创建接收数据报\
 　　　　　　　socket.receive(packet); //接收\
 　　　　　　　String received=new String(packet.getData()); \
 　　　　　　　//由接收到的数据报得到字节数组，\
 　　　　　　　//并由此构造一个String对象\
 　　　　　　　System.out.println("Quote of theMoment:"+received); \
 　　　　　　　//打印得到的字符串\
 　　　　　} //循环5次\
 　　　　　socket.leaveGroup(address); \
 　　　　　//把广播套接字从地址上解除绑定\
 　　　　　socket.close(); //关闭广播套接字\
 　　　}\
 　}\
 　2. 服务器方程序:MulticastServer.java\
 　　public class MulticastServer{\
 　　　　public static void main(String args[]) throws
java.io.IOException \
 　　　　{\
 　　　　　　new MulticastServerThread().start(); \
 　　　　　　//启动一个服务器线程\
 　　　　}\
 　　}\
 　3. 程序MulticastServerThread.java\
 　　import java.io.**;\
 　　import java.net.**;\
 　　import java.util.**;\
 　　public class MulticastServerThread extends QuoteServerThread \
 　　//从QuoteServerThread继承得到新的服务器线程类MulticastServerThread\
 　　{\
 　　　　Private long FIVE\_SECOND=5000; //定义常量，5秒钟\
 　　　　public MulticastServerThread(String name) throws IOException \
 　　　　{\
 　　　　　　super("MulticastServerThread"); \
 　　　　　　//调用父类，也就是QuoteServerThread的构造函数\
 　　　　}\
 　　　　public void run() //重写父类的线程主体\
 　　　　{\
 　　　　　while(moreQuotes) { \
 　　　　　//根据标志变量判断是否继续循环\
 　　　　　　try{\
 　　　　　　　　byte[] buf=new byte[256]; \
 　　　　　　　　//创建缓冲区\
 　　　　　　　　String dString=null;\
 　　　　　　　　if(in==null) dString=new Date().toString(); \
 　　　　　　　　//如果初始化的时候打开文件失败了，\
 　　　　　　　　//则使用日期作为要传送的字符串\
 　　　　　　　　else dString=getNextQuote(); \
 　　　　　　　　//否则调用成员函数从文件中读出字符串\
 　　　　　　　　buf=dString.getByte(); \
 　　　　　　　　//把String转换成字节数组，以便传送send it\
 　　　　　　　　InetAddress group=InetAddress.getByName("230.0.0.1"); \
 　　　　　　　　//得到230.0.0.1的地址信息\
 　　　　　　　　DatagramPacket packet=new
DatagramPacket(buf,buf.length,group,4446);\
 　　　　　　　　//根据缓冲区，广播地址，和端口号创建DatagramPacket对象\
 　　　　　　　　socket.send(packet); //发送该Packet\
 　　　　　　　　try{\
 　　　　　　　　　　sleep((long)(Math.random()\*FIVE\_SECONDS)); \
 　　　　　　　　　　//随机等待一段时间，0～5秒之间\
 　　　　　　　　}catch(InterruptedException e) { } //异常处理\
 　　　　　　}catch(IOException e){ //异常处理\
 　　　　　　　　e.printStackTrace( ); //打印错误栈\
 　　　　　　　　moreQuotes=false; //置结束循环标志\
 　　　　　　}\
 　　　　}\
 　　　　socket.close( ); //关闭广播套接口\
 　　　}\
 　}\
 \
 【本讲小结】\

本讲主要讲解了Java环境下的网络编程。因为TCP/IP协议是Java网络编程的基础知识，本讲开篇重点介绍了TCP/IP协议中的一些概念，TCP/IP协议本身是一个十分庞大的系统，用几个小节是不可能讲清楚的。所以我们只是联系实际，讲解了一些最基本的概念，帮助学生理解后面的相关内容。重点有一下几个概念：主机名，IP，端口，服务类型，TCP，UDP。\

　　后续的内容分为两大块，一块是以URL为主线，讲解如何通过URL类和URLConnection类访问WWW网络资源，由于使用URL十分方便直观，尽管功能不是很强，还是值得推荐的一种网络编程方法，尤其是对于初学者特别容易接受。本质上讲，URL网络编程在传输层使用的还是TCP协议。\

　　另一块是以Socket接口和C/S网络编程模型为主线，依次讲解了如何用Java实现基于TCP的C/S结构，主要用到的类有Socket，ServerSocket。以及如何用Java实现基于UDP的C/S结构，还讨论了一种特殊的传输方式，广播方式，这种方式是UDP所特有的，主要用到的类有DatagramSocket
, DatagramPacket,
MulticastSocket。这一块在Java网络编程中相对而言是最难的（尽管Java在网络编程这方面已经做的够"傻瓜"了，但是网络编程在其他环境下的却是一件极为头痛的事情，再"傻瓜"还是有一定的难度），也是功能最为强大的一部分,读者应该好好研究，领悟其中的思想。\

　　最后要强调的是要学好Java网络编程，Java语言，最重要的还是在于多多练习！
