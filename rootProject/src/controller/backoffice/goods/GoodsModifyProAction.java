package controller.backoffice.goods;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.GoodsDAO;
import model.DTO.GoodsDTO;

public class GoodsModifyProAction {
	public String execute(HttpServletRequest request) {
		
		String realPath = request.getServletContext().getRealPath("/partnerBo/page/goods/upload");
		int limitSize = 1024 * 1024 * 5;
		GoodsDTO dto = new GoodsDTO();
		GoodsDAO dao = new GoodsDAO();
		MultipartRequest multi = null;
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		String bookNum = null;
		try {
			multi = new MultipartRequest(request, realPath, limitSize, "utf-8", new DefaultFileRenamePolicy());
			bookNum = multi.getParameter("bookNum");
			System.out.println(bookNum);
			String bookIsbn = multi.getParameter("bookIsbn");
			String bookName = multi.getParameter("bookName");
			String bookAuthorName = multi.getParameter("bookAuthorName");
			String bookCategory = multi.getParameter("bookCategory");
			String partnerName = multi.getParameter("partnerName");
			String bookD = multi.getParameter("bookDate");
			String bookPrice = multi.getParameter("bookPrice");
			String bookPageNum = multi.getParameter("bookPageNum");
			String bookLength = multi.getParameter("bookLength");
			String bookSub = multi.getParameter("bookSub");
			// String bookImage = multi.getFilesystemName("bookImage");
			String bookIntro = multi.getParameter("bookIntro");
			String bookAuthorIntro = multi.getParameter("bookAuthorIntro");
			String bookList = multi.getParameter("bookList");
			String bookCount = multi.getParameter("bookCount");
			
			date = dt.parse(bookD);
			Timestamp bookDate = new Timestamp(date.getTime());
			
			dto.setBookIsbn(bookIsbn);
			dto.setBookName(bookName);
			dto.setBookAuthorName(bookAuthorName);
			dto.setBookCategory(bookCategory);
			dto.setPartnerName(partnerName);
			dto.setBookDate(bookDate);
			dto.setBookPrice(bookPrice);
			dto.setBookPageNum(bookPageNum);
			dto.setBookLength(bookLength);
			dto.setBookSub(bookSub);
			// dto.setBookImage(bookImage);
			dto.setBookIntro(bookIntro);
			dto.setBookAuthorIntro(bookAuthorIntro);
			dto.setBookList(bookList);
			dto.setBookCount(bookCount);
			dto.setBookNum(bookNum);
			dao.GoodsUpdate(dto);
			
			if(multi.getFile("bookImage") != null) {
				dto.setBookImage(multi.getFilesystemName("bookImage"));
				int i = dao.fileUpdate(dto);
				File file = null;
				if(i >= 1) {
					String fileName = realPath + "/" + multi.getParameter("fileDel");
					file = new File(fileName);
					if(file.exists()) file.delete();
					else System.out.println("파일이 없습니다.");
				}
			} else {
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bookNum;
	}
}
