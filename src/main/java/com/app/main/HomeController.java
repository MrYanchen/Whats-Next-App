package com.app.main;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.app.hibnate.Admin;
import com.app.hibnate.Item;
import com.app.hibnate.Recom;
import com.app.hibnate.Register;
import com.app.service.AdminService;
import com.app.service.ItemService;
import com.app.service.RecommendationService;
import com.app.service.RegisterService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private RecommendationService recommendationService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Principal principal) {		
		if (principal != null){
			String name = principal.getName();
			Register register = registerService.getRegister(name);
			model.addAttribute("register", register);
		}
		ArrayList<Item> recommendList = new ArrayList<Item>();
		for (Recom recommendation : recommendationService.listRecommendations()){
			for (Item item : itemService.listItemsByRecommendID(recommendation.getRecommondationId())){
				recommendList.add(item);
			}
		}
		model.addAttribute("recommendList", recommendList);
		int row = recommendList.size()/3;
		model.addAttribute("row", row);
		return "home";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {		
		return "home";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model){
		model.addAttribute("register", new Register());
		return "register";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String addRegister(@ModelAttribute("register") @Valid Register register, BindingResult result, Model model){
		
		if (result.hasErrors()) {
			return "register";
		}
		try{
		registerService.addRegister(register);
		}
		catch(ConstraintViolationException e){
			result.rejectValue("registerName", "messageCode", "User name has been taken");
			return "register";
		}
		model.addAttribute("register", register);
		model.addAttribute("itemList", itemService.listItemsByUserID(register.getRegisterId()));
		return "redirect:/user/"+register.getRegisterId();
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String userLogin(Model model, Principal principal){
		String name = principal.getName();
		if (name.equals("supervisior")){
			model.addAttribute("userList", registerService.listRegisters());
			return "redirect:/admin";
		}
		Register register = registerService.getRegister(name);
		model.addAttribute("register", register);
		model.addAttribute("itemList", itemService.listItemsByUserID(register.getRegisterId()));
		return "redirect:/user/"+register.getRegisterId();
	}
	
	@RequestMapping(value = "/login?error", method = RequestMethod.GET)
	public String userLoginError(Model model){
		ArrayList<Item> recommendList = new ArrayList<Item>();
		for (Recom recommendation : recommendationService.listRecommendations()){
			for (Item item : itemService.listItemsByRecommendID(recommendation.getRecommondationId())){
				recommendList.add(item);
			}
		}
		model.addAttribute("message", "Login error!");
		model.addAttribute("recommendList", recommendList);
		return "home";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		ArrayList<Register> list = new ArrayList<Register>();
		for(Admin admin : adminService.listAdmins()){
			list.add(registerService.getRegister(admin.getAdminName()));
		}
		model.addAttribute("list", list);
		return "admin";
	}
	
	@RequestMapping(value = "/admin/{userId}/upgrade", method = RequestMethod.GET)
	public String upgradeUser(@PathVariable("userId") Integer userId){
		Register register = registerService.getRegister(userId);
		Admin admin = adminService.getAdmin(register.getRegisterName());
		adminService.deleteAdmin(admin.getAdminId());
		register.setAuthority("admin");
		registerService.updateRegister(register);
		return "redirect:/admin";
	}
	
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public String searchUser(Model model, String searchContent) {
		for (Item item : itemService.searchItems(searchContent)){
			System.out.print(item.getRegister().getRegisterName().toString());
		}
		model.addAttribute("searchList", itemService.searchItems(searchContent));
		return "searchresult";
	}
	
}
