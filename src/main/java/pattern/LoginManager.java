package pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import model.User;
import service.LoginService;

public class LoginManager {
    private LoginStrategy loginStrategy;
    
    public void setLoginStrategy(LoginStrategy loginStrategy) {
        this.loginStrategy = loginStrategy;
    }
    
    public ModelAndView login(User user, HttpSession session, HttpServletRequest request, LoginService ls) {
    	return loginStrategy.login(user, session, request, ls);
    }
}

