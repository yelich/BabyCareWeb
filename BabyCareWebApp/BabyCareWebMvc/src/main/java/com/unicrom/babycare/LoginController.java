/**
 * 
 */
package com.unicrom.babycare;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Georman
 *
 */
@Controller
public class LoginController {

	@RequestMapping("/login")
	public ModelAndView getLoginForm(
			@RequestParam(required = false) String authfailed, String logout,
			String denied) {
		String message = "";
		if (authfailed != null) {
			message = "Invalid username of password, try again !";
		} else if (logout != null) {
			message = "Logged Out successfully, login again to continue !";
		} else if (denied != null) {
			message = "Access denied for this user !";
		}
		return new ModelAndView("index", "message", message);
	}

	@RequestMapping(value = "/login/{error}", method = RequestMethod.GET)
	public final String displayLoginform(Model model,
			@PathVariable final String error) {
		model.addAttribute("message", error);
		return "index";
	}

	@RequestMapping("/403page")
	public String ge403denied(Model model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		model.addAttribute("error", "Access denied for user " + auth.getName());
		return "index";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request,
			HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

}
