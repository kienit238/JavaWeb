package Controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.Staff;

@Controller
@Transactional
@SuppressWarnings("unchecked")
@RequestMapping("Login")
public class LoginController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("test")
	public String test() {
		return "Admin/blank";
	}

	@RequestMapping("login")
	public String login(ModelMap model, HttpSession session, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		String gender = "Nam";
		Session s = factory.getCurrentSession();
		String hql = "From Staff emp where emp.Username=:username And emp.Password=:password";
		Query query = s.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		List<Staff> ds = query.list();

		if (ds.size() > 0) {
			String ngaysinh = new SimpleDateFormat("dd/MM/yyyy").format(ds.get(0).getBirthday());
			session.setMaxInactiveInterval(600);
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			session.setAttribute("birthday", ngaysinh);
			session.setAttribute("name", ds.get(0).getName());
			session.setAttribute("email", ds.get(0).getEmail());
			session.setAttribute("avatar", ds.get(0).getAvatar());
			session.setAttribute("depart", ds.get(0).getDept().getName());
			session.setAttribute("phone", ds.get(0).getPhone());
			if (ds.get(0).getGender() == false) {
				gender = "Nữ";
			}

			session.setAttribute("gender", gender);
			return "Admin/blank";

		}
		model.addAttribute("message", "Sai thông tin đăng nhập!");

		return "redirect:/Home/index.htm";
	}

	@RequestMapping("logout")
	public String logout(ModelMap model, HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return "redirect:/Home/index.htm";
	}

}
