package cn.mogao.utils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.net.InetAddress;
import java.net.UnknownHostException;
/**
 *
 * @author yq
 * @Date  2019/04/17
 *
 */
public class IpUtils {
    private IpUtils() {
    }

    /** 
     * 获取当前网络ip 
     * @param request 
     * @return 
     */  
    public static String getIpAddr(HttpServletRequest request){  
        String ipAddress = request.getHeader("x-forwarded-for");  
            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
                ipAddress = request.getHeader("Proxy-Client-IP");  
            }  
            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
                ipAddress = request.getHeader("WL-Proxy-Client-IP");  
            }  
            if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {  
                ipAddress = request.getRemoteAddr();  
                if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){  
                    //根据网卡取本机配置的IP  
                    InetAddress inet=null;  
                    try {  
                        inet = InetAddress.getLocalHost();  
                    } catch (UnknownHostException e) {  
                        e.printStackTrace();  
                    }  
                    ipAddress= inet.getHostAddress();  
                }  
            }  
            //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割  
            if(ipAddress!=null && ipAddress.length()>15){ //"***.***.***.***".length() = 15  
                if(ipAddress.indexOf(",")>0){  
                    ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));  
                }  
            }  
            return ipAddress;   
    }
    
    /**
     * 获得MAC地址
     * @param ip
     * @return
     */
    public static String getMACAddress(String ip){ 
        String str = ""; 
        String macAddress = ""; 
        try { 
            Process p = Runtime.getRuntime().exec("nbtstat -A " + ip); 
            InputStreamReader ir = new InputStreamReader(p.getInputStream()); 
            LineNumberReader input = new LineNumberReader(ir); 
            for (int i = 1; i < 100; i++) { 
                str = input.readLine(); 
                if (str != null) { 
                    if (str.indexOf("MAC Address") > 1) { 
                        macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length()); 
                        break; 
                    } 
                } 
            } 
        } catch (IOException e) { 
            e.printStackTrace(System.out); 
        } 
        return macAddress; 
    }
    /***
     * idea获取外网ip
     */
    public static String getOuterIp(HttpServletRequest request){
        String ip = request.getRemoteAddr();
/**
 * X-Forwarded-For:简称XFF头，它代表客户端，也就是HTTP的请求端真实的IP
 * 只有在通过了HTTP 代理或者负载均衡服务器时才会添加该项
 * 标准格式如下：X-Forwarded-For: client_ip, proxy1_ip, proxy2_ip
 * 此头是可构造的，因此某些应用中应该对获取到的ip进行验证
 */
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("x-forwarded-for");
        }
/**
 *在多级代理网络中，直接用getHeader("x-forwarded-for")可能获取到的是unknown信息
 *此时需要获取代理代理服务器重新包装的HTTP头信息，
 */
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            //Apache+WebLogic搭配下出现的头
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknow".equalsIgnoreCase(ip)) {
            //Apache+WebLogic搭配下出现的头
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            //可通过http头伪造，是由代理服务器发送的请求头
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            //可通过http头伪造，和X-Forwarded-For格式类似，以“,"分隔
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        return ip;
    }
    
}