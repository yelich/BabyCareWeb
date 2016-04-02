package com.unicrom.babycare;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/main")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	
	public String dashboard() {
		logger.info("Welcome home! The client locale is {}.");
		return "dashboard";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/personalInformation", method = RequestMethod.GET)
	
	public String personalInformation() {
		logger.info("Welcome home! The client locale is {}.");
		return "personalInformation";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/childrenInformation", method = RequestMethod.GET)
	
	public String childrenInformation() {
		logger.info("Welcome home! The client locale is {}.");
		return "childrenInformation";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/medicationsInformation", method = RequestMethod.GET)
	
	public String medicationsInformation() {
		logger.info("Welcome home! The client locale is {}.");
		return "medicationsInformation";
	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/feesInformation", method = RequestMethod.GET)
	
	public String activitesInformation() {
		logger.info("Welcome home! The client locale is {}.");
		return "feesInformation";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/schoolInformation", method = RequestMethod.GET)
	
	public String schoolInformation() {
		logger.info("Welcome home! The client locale is {}.");
		return "schoolInformation";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/servicesInformation", method = RequestMethod.GET)
	
	public String servicesInformation() {
		logger.info("Welcome home! The client locale is {}.");
		return "servicesInformation";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/notificationInformation", method = RequestMethod.GET)
	
	public String notificationInformation() {
		logger.info("Welcome home! The client locale is {}.");
		return "notificationInformation";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/holidaysInformation", method = RequestMethod.GET)
	
	public String holidaysInformation() {
		logger.info("Welcome home! The client locale is {}.");
		return "holidaysInformation";
	}
}
