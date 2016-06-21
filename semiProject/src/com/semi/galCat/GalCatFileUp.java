package com.semi.galCat;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.semi.util.Action;
import com.semi.util.ActionForward;

public class GalCatFileUp implements Action{
	@Override
	public ActionForward doProcess(HttpServletRequest request, HttpServletResponse response) {
		String return1="";
		String return2="";
		String return3="";
		String name = "";
		String realname="";
		if (ServletFileUpload.isMultipartContent(request)){
		    ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		    //UTF-8 인코딩 설정
		    uploadHandler.setHeaderEncoding("UTF-8");
		    List<FileItem> items;
			try {
				items = uploadHandler.parseRequest(request);
				for (FileItem item : items) {
					if(item.getFieldName().equals("callback")) {
						return1 = item.getString("UTF-8");
					} else if(item.getFieldName().equals("callback_func")) {
						return2 = "?callback_func="+item.getString("UTF-8");
					} else if(item.getFieldName().equals("Filedata")) {
						//FILE 태그가 1개이상일 경우
						if(item.getSize() > 0) {
							String ext = item.getName().substring(item.getName().lastIndexOf(".")+1);
							//파일 기본경로
							String defaultPath = request.getServletContext().getRealPath("/"); //루트경로까지의 실제주소
							//파일 기본경로 _ 상세경로
							String path = defaultPath + "upload" + File.separator; //seperator  : 파일을 구분해주는 기호(/)
							System.out.println("파일상세경로 :"+path);
							
							File file = new File(path);
							
							//디렉토리 존재하지 않을경우 디렉토리 생성
							if(!file.exists()) {
								file.mkdirs();
							}
							//서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음), uuid: 유일한 아이디
							realname = UUID.randomUUID().toString() + "." + ext;
							///////////////// 서버에 파일쓰기 ///////////////// 
							InputStream is;
							try {
								is = item.getInputStream();
								OutputStream os=new FileOutputStream(path + realname);
								int numRead;
								byte b[] = new byte[(int)item.getSize()];
								while((numRead = is.read(b,0,b.length)) != -1){
									os.write(b,0,numRead);
								}
								if(is != null)  is.close();
								os.flush();
								os.close();
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							///////////////// 서버에 파일쓰기 /////////////////
							return3 += "&bNewLine=true&sFileName="+name+"&sFileURL=/semiProject/upload/"+realname;
						}else {
							return3 += "&errstr=error";
						}
					}
				}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		    //각 필드태그들을 FOR문을 이용하여 비교를 합니다.
		}
		System.out.println("최종 리턴 :" +return1+return2+return3 );
		try {
			/*response.sendRedirect(return1+return2+return3);*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ActionForward af = new ActionForward();
		HttpSession session = request.getSession();
		session.setAttribute("imageFile", realname);
		af.setIscheck(false);
		af.setPath(return1+return2+return3);
		return af;
	}
}
