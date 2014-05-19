/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package DataBean;

//import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
/**
 *
 * @author hkwany
 */
@WebServlet(name = "FileUpServlet", urlPatterns = {"/FileUpServlet"})
public class FileUpServlet extends HttpServlet {

    private ServletConfig config;

    public void destroy() {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("gbk");
        PrintWriter out = response.getWriter();
        int ncount = 0;
        // 声明一个上传组件对象
        SmartUpload su = new SmartUpload();
        // 初始化
        su.initialize(config, request, response);
        //设置上传文件的最大字节数
        su.setTotalMaxFileSize(1000000000);
        
        try {
            su.upload();//接收上传的文件数据
            //su.uploadInFile("F:\\");
            /*
            File upfile = new File(uploadfile);
            if(!upfile.exists()){
            upfile.mkdir();
            System.out.println("目录创建成功");
            }
            for(int i = 0;i < su.getFiles().getCount();i++){
            com.jspsmart.upload.File file = su.getFiles().getFile(i);
            if(!file.isMissing()){
            file.saveAs("upload/new."+file.getFileExt(),SmartUpload.SAVE_VIRTUAL);//将文件另存为改了个名字的文件
            }
            }
            ncount = su.save("F:\\");//将所有传过来的文件二进制的文件保存到服务器上的upload目录下，返回文件的个数
            out.println(ncount + "file(s) uploaded");*/
            su.save("F:\\");
            out.println("file uploaded successfully.");
            /***********************
            * 上面有file.saveAs和su.save，其实是将文件保存了两份。
            */
        } catch (SmartUploadException e) {
            //e.printStackTrace();
            out.println("文件上传失败！");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void init(ServletConfig config) throws ServletException {
        this.config = config;
    }

}

