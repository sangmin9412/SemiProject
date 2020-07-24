package controller.partnerBo.goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.DAO.GoodsDAO;

public class GoodsIbgoOkAction {
	
	public void execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String partnerNum = session.getAttribute("logId").toString();
		String pOrderNum = request.getParameter("pOrderNum");
		GoodsDAO dao = new GoodsDAO();
		dao.goodsIpgoPtOk(pOrderNum, partnerNum);
		
	}
	
}
