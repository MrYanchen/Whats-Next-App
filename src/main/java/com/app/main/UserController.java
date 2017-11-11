package com.app.main;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.hibnate.Admin;
import com.app.hibnate.Item;
import com.app.hibnate.Recom;
import com.app.hibnate.Register;
import com.app.hibnate.Step;
import com.app.service.AdminService;
import com.app.service.ItemService;
import com.app.service.RecommendationService;
import com.app.service.RegisterService;
import com.app.service.StepService;

@Controller
@RequestMapping(value="/user/{userId}")
public class UserController {
	
	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StepService stepService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private RecommendationService recommendationService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String userHomePage(@PathVariable("userId") Integer userId, Model model, Principal principal){
		Register register = registerService.getRegister(userId);
		
		
		String name = principal.getName();
		
		if (registerService.getRegister(name).getRegisterId().equals(userId)){
			model.addAttribute("register", register);
			model.addAttribute("itemList", itemService.listItemsByUserID(userId));
			model.addAttribute("list", itemService.listItems());
			return "register_homepage";
		}
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/photo", method = RequestMethod.GET)
	public @ResponseBody String viewPhoto(@PathVariable("userId") Integer userId, HttpServletResponse response) throws IOException {
		Register register = registerService.getRegister(userId);
		byte[] photoBytes = register.getRegisterPhotoData();
		if (photoBytes != null) {
			int photoLength = photoBytes.length;
			try (ServletOutputStream sos = response.getOutputStream()) {
				response.setContentType(register.getRegisterPhotoFiletye());
				response.setContentLength(photoLength);
				response.setHeader("Content-Disposition", "inline; filename=\"" + register.getRegisterPhotoName() + "\"");
				
				sos.write(photoBytes);
				sos.flush();
			}
		}
		return null;
	}
	
	@RequestMapping(value="/edit", method = RequestMethod.POST)
	public String editPorfile(@PathVariable("userId") Integer userId, Model model, @RequestParam("changePhoto") MultipartFile photo, @RequestParam("changeTel") String phone, @RequestParam("changeEmail") String email) {
		Register register = registerService.getRegister(userId);
		if(!(photo.isEmpty())){
			register.setPhoto(photo);
		}
		if(!(phone.isEmpty())){
			register.setRegisterPhone(phone);
		}
		if(!(email.isEmpty())){
			register.setRegisterEmail(email);
		}
		registerService.updateRegister(register);
		model.addAttribute("register", register);
		model.addAttribute("itemList", itemService.listItemsByUserID(userId));
		model.addAttribute("list", itemService.listItems());
		return "register_homepage";
	}
	
	@RequestMapping(value="/item", method = RequestMethod.GET)
	public String item(@PathVariable("userId") Integer userId, Model model){
		model.addAttribute("id", userId);
		model.addAttribute("item", new Item());
		return "item";
	}
	
	@RequestMapping(value="/item", method = RequestMethod.POST)
	public String addItem(@PathVariable("userId") Integer userId, @ModelAttribute("item") @Valid Item item, BindingResult bindingResult, Model model){
		
		if (bindingResult.hasErrors()){
			return "item";
		}
		
		Register register = registerService.getRegister(userId);
		item.setRegister(register);
		item.setItemLike(0);
		itemService.addItem(item);
		model.addAttribute("user", register.getRegisterId());
		model.addAttribute("item", item.getItemId());
		model.addAttribute("step", new Step());
		return "steps";
	}
	
	@RequestMapping(value="/delete/item/{itemId}", method = RequestMethod.GET)
	public String deleteItem(@PathVariable("userId") Integer userId, @PathVariable("itemId") Integer itemId){
		for(Step step:stepService.listStepsByItemId(itemId)){
			stepService.deleteStep(step.getStepId());
		}
		itemService.deleteItem(itemId);
		return "redirect:/user/" + userId;
	}
	
	@RequestMapping(value="/item/{itemId}/step", method = RequestMethod.GET)
	public String step(@PathVariable("userId") Integer userId, @PathVariable("itemId") Integer itemId, Model model){
		model.addAttribute("user", userId);
		model.addAttribute("item", itemId);
		model.addAttribute("step", new Step());
		return "steps";
	}
	
	@RequestMapping(value="/item/{itemId}/step", method = RequestMethod.POST)
	public String addStep(@PathVariable("userId") Integer userId, @PathVariable("itemId") Integer itemId, @ModelAttribute("step") @Valid Step step, BindingResult bindingResult, Model model){
		if (bindingResult.hasErrors()){
			return "steps";
		}
		Item item = itemService.getItem(itemId);
		step.setItem(item);
		stepService.addStep(step);
		model.addAttribute("user", userId);
		model.addAttribute("item", item.getItemId());
		model.addAttribute("step", new Step());
		return "steps";
	}
	
	@RequestMapping(value="/item/{itemId}/step/{stepId}", method = RequestMethod.POST)
	public void deleteStep(@PathVariable("userId") Integer userId, @PathVariable("itemId") Integer itemId, @PathVariable("stepId") Integer stepId){
		stepService.deleteStep(stepId);
	}
	
	@RequestMapping(value="/upgrade", method = RequestMethod.GET)
	public String upgradeUser(@PathVariable("userId") Integer userId, Model model) {
		Register register = registerService.getRegister(userId);
		Admin admin = new Admin();
		admin.setAdminName(register.getRegisterName());
		adminService.addAdmin(admin);
		model.addAttribute("register", register);
		model.addAttribute("itemList", itemService.listItemsByUserID(userId));
		model.addAttribute("list", itemService.listItems());
		return "register_homepage";
	}
	

	@RequestMapping(value="/recommend/item/{itemId}", method = RequestMethod.GET)
	public String addRcommend(@PathVariable("userId") Integer userId, @PathVariable("itemId") Integer itemId, Model model) {
		Item item = itemService.getItem(itemId);
		if (item.getRecommendation() == null){
			Recom recommendation = new Recom();
			item.setRecommendation(recommendation);
			recommendationService.addRecommendation(recommendation);
		}
		return "redirect:/user/" + userId;
	}
	
}
