package Controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("Home")
public class HomeController {
	
	@RequestMapping("index")
	public String index() {
		return "Home/index";
	}
	@RequestMapping("about")
	public String blog() {
		return "Home/about";
	}
	@RequestMapping("contact")
	public String contact() {
		return "Home/contact";
	}
}
