package masterService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;


public class MasterMemberList implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
	return "m_memberList";
	}

}