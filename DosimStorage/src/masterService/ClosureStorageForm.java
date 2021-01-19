package masterService;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDao;
import model.Storage_list;

public class ClosureStorageForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MasterDao md = MasterDao.getInstance();
		List<Storage_list> list = new ArrayList<Storage_list>();
		list = md.clList();
		request.setAttribute("list", list);
		return "closureStorageForm";
	}

}
