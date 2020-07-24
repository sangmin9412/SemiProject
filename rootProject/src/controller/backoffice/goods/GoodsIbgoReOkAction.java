package controller.backoffice.goods;

import javax.servlet.http.HttpServletRequest;

import model.DAO.GoodsDAO;

public class GoodsIbgoReOkAction {

	public void execute(HttpServletRequest request) {
		String pOrderNum = request.getParameter("pOrderNum");
		GoodsDAO dao = new GoodsDAO();
		dao.goodsIpgoReOk(pOrderNum);
		
	}

}
