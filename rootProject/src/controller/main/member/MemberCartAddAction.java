package controller.main.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.GoodsDAO;
import model.DTO.GoodsDTO;

public class MemberCartAddAction {
	public void execute(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String userId = session.getAttribute("logId").toString();
		String Qty = request.getParameter("Qty");
		String bookNum = request.getParameter("bookNum");
		
		GoodsDAO dao = new GoodsDAO();
		List<GoodsDTO> list = dao.goodsSelect(1, 1, bookNum);
		
		dao.goodsCartAdd(list, userId, Qty);
		
	}
}
