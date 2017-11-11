package com.app.main;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.hibnate.Item;
import com.app.hibnate.Register;
import com.app.hibnate.Step;
import com.app.service.ItemService;
import com.app.service.RegisterService;
import com.app.service.StepService;

@Controller
@RequestMapping(value="/item/{itemId}")
public class ItemController {

	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private StepService stepService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewItem(@PathVariable("itemId") Integer itemId, Model model, Principal principal) {
		if (principal != null){
			String name = principal.getName();
			Register register = registerService.getRegister(name);
			model.addAttribute("register", register);
		}
		Item item = itemService.getItem(itemId);
		model.addAttribute("item", item);
		return "item_view";
	}
	
	@RequestMapping(value="/image", method = RequestMethod.GET)
	public @ResponseBody String viewImage(@PathVariable("itemId") Integer itemId, HttpServletResponse response) throws IOException {
		Item item = itemService.getItem(itemId);
		byte[] imageBytes = item.getItemData();
		if (imageBytes != null) {
			int imageLength = imageBytes.length;
			try (ServletOutputStream sos = response.getOutputStream()) {
				response.setContentType(item.getItemImageFiletye());
				response.setContentLength(imageLength);
				response.setHeader("Content-Disposition", "inline; filename=\"" + item.getItemImageName() + "\"");
				
				sos.write(imageBytes);
				sos.flush();
			}
		}
		return null;
	}
	
	@RequestMapping(value="/steplist", method = RequestMethod.GET)
	public String listSteps(@PathVariable("itemId") Integer itemId, Model model, Principal principal) {
		if (principal != null) {
			if (principal.getName() != null){
				String name = principal.getName();
				Register register = registerService.getRegister(name);
				model.addAttribute("register", register);
			}
		}
		if (stepService.listStepsByItemId(itemId) != null) {
			model.addAttribute("stepList", stepService.listStepsByItemId(itemId));
		}
		model.addAttribute("itemId", itemId);
		return "step_view";
	}
	
	@PreAuthorize("hasAuthority('user')")
	@RequestMapping(value="/like", method = RequestMethod.GET)
	public String likeItem(@PathVariable("itemId") Integer itemId) {
		itemService.likeItem(itemId);
		return "redirect:/item/" + itemId;
	}
	
//	@RequestMapping(value="/like", method = RequestMethod.GET)
//	public String recommendItem(@PathVariable("itemId") Integer itemId) {
//		itemService.likeItem(itemId);
//		return "redirect:/item/" + itemId;
//	}
	
	@RequestMapping(value="/step/{stepId}/image", method = RequestMethod.GET)
	public @ResponseBody String viewImageStep(@PathVariable("stepId") Integer stepId, HttpServletResponse response) throws IOException {
		Step step = stepService.getStep(stepId);
		byte[] imageBytes = step.getStepData();
		if (imageBytes != null) {
			int imageLength = imageBytes.length;
			try (ServletOutputStream sos = response.getOutputStream()) {
				response.setContentType(step.getStepImageFiletye());
				response.setContentLength(imageLength);
				response.setHeader("Content-Disposition", "inline; filename=\"" + step.getStepImageName() + "\"");
				
				sos.write(imageBytes);
				sos.flush();
			}
		}
		return null;
	}
	
}
