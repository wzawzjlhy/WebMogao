package cn.mogao.utils;

import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import java.io.*;
public class DownloadFileUtil {

    public static final String separator = File.separator;


    public static ResponseEntity<InputStreamResource> download(String path, String newName) {

        ResponseEntity<InputStreamResource> response = null;
        try {
           /* path = route + filePath + separator + fileName;
            ClassPathResource classPathResource = new ClassPathResource(path);
            InputStream inputStream = classPathResource.getInputStream();*/
            File file = new File(path);
            InputStream inputStream=new FileInputStream(file);

            HttpHeaders headers = new HttpHeaders();
            headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
            headers.add("Content-Disposition",
                    "attachment; filename="
                            + new String(newName.getBytes("gbk"), "iso8859-1") + path.substring(path.lastIndexOf(".")));
            headers.add("Pragma", "no-cache");
            headers.add("Expires", "0");
            response = ResponseEntity.ok().headers(headers)
                    .contentType(MediaType.parseMediaType("application/octet-stream"))
                    .body(new InputStreamResource(inputStream));
        } catch (FileNotFoundException e1) {

        } catch (IOException e) {

        }
        return response;
    }
}

