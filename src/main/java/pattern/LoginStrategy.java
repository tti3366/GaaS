package pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import model.User;
import service.LoginService;

public interface LoginStrategy {
    ModelAndView login(User user, HttpSession session, HttpServletRequest request, LoginService ls);
}
