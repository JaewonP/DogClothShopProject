package com.dogcutie.shop.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dogcutie.shop.service.member.PwSearchService;
import com.dogcutie.shop.vo.All_User_Tbl;

import lombok.Setter;

@Controller
@RequestMapping("/cutieshop/*")
public class PwSearchController {
	
	@Setter(onMethod_ = @Autowired)
	private PwSearchService service;
	
	@GetMapping("/pwsearch")
	public String pwsearch() {
		return "clothshop/pwsearch";
	}

//	@PostMapping("/isEmail")
//	@ResponseBody
//	public boolean isEmailEx(@RequestParam("email") String email) {
//		return service.emailEx(email);
//	}
	
	@GetMapping("/pwchange/{role_name}/{id}")
	public String pwchange(@PathVariable(value ="id") String id, @PathVariable(value="role_name") String role_name, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("role_name", role_name);
		System.out.println(role_name);
		return "clothshop/pwchange";
	}
	
	@PostMapping("/pwchange/{role_name}/{id}")
	public String pwchanged(@PathVariable(value ="id") String id, @PathVariable(value="role_name") String role_name, All_User_Tbl all) {
		
		System.out.println(role_name);
		System.out.println(all.getPw());
		System.out.println(id);
		if(role_name.equals("SELLER")) {
			System.out.println("seller지역");
			service.updateAllSeller(all.getPw(), id);
			
		}else {
			System.out.println("user지역");
			service.updateAllUser(all.getPw(), id);
		}
		System.out.println(all.getPw() + "리다이렉트 전");
		return "redirect:/cutieshop/login";
	}
	
	@GetMapping("/isEmail")
	@ResponseBody
	public List<All_User_Tbl> isEmailReturn(@RequestParam("email") String email) {
		return service.emailReturn(email);
	}
}
