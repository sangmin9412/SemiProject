package controller.partnerBo.goods;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.GoodsDAO;
import model.DTO.GoodsDTO;

public class GoodsDeleteAction {

	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String partnerNum = session.getAttribute("logId").toString();
		String bookNum = request.getParameter("bookNum");
		
		GoodsDAO dao = new GoodsDAO();
		
		String realPath = request.getServletContext().getRealPath("/partnerBo/page/goods/upload/");
		List<GoodsDTO> list = dao.goodsSelect(1, 1, bookNum);
		File file = null;
		
		int i = dao.goodsDelete(partnerNum, bookNum);
		
		if (i >= 1) {
			file = new File(realPath + list.get(0).getBookImage());
			if (file.exists()) {
				file.delete();
			}
		}
		
	}
	
}
