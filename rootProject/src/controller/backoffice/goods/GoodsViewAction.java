package controller.backoffice.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.DAO.GoodsDAO;
import model.DTO.GoodsDTO;

public class GoodsViewAction {
	public void execute(HttpServletRequest request) {
		String bookNum = request.getParameter("bookNum");
		GoodsDAO dao = new GoodsDAO();
		List<GoodsDTO> list = dao.goodsSelect(1, 1, bookNum);
		request.setAttribute("list", list);
		System.out.println(123);
	}
}
