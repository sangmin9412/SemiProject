package controller.backoffice.goods;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DAO.GoodsDAO;
import model.DTO.GoodsDTO;

public class GoodsWriteAction {
	public void execute(HttpServletRequest request) {
		
		GoodsDTO dto = new GoodsDTO();
		String filePath = "/backoffice/page/goods/upload";
		String realPath = request.getServletContext().getRealPath(filePath);
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		int fileSize = 1024*1024*5;
		
		try {
			MultipartRequest multi = new MultipartRequest(request, realPath, fileSize, "utf-8", new DefaultFileRenamePolicy());
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
			String bookImage = multi.getFilesystemName("bookImage");
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
			dto.setBookImage(bookImage);
			dto.setBookIntro(bookIntro);
			dto.setBookAuthorIntro(bookAuthorIntro);
			dto.setBookList(bookList);
			dto.setBookCount(bookCount);

				}catch(Exception e) {
			e.printStackTrace();
		}
		
		GoodsDAO dao = new GoodsDAO();
		dao.goodsInsert(dto);
		
		
	}
}
