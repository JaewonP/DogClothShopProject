package com.dogcutie.shop.controller.product;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.dogcutie.shop.service.product.RegisterProductService;
import com.dogcutie.shop.vo.Prod_Tbl;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cutieshop/*")
@Slf4j
public class RegisterProductController {

	
	@Setter(onMethod_ = @Autowired)
	private RegisterProductService service;
	
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("/seller/registerProduct")
	public String registerProduct() {
		
		String path = servletContext.getRealPath("/resources/img/upload");
		System.out.println(path);
		
		
		return "clothshop/registerProduct";
	}
	
	
	@PostMapping("/seller/registerProduct")
	public String registerProduct(Model model, MultipartHttpServletRequest multipartRequest, Prod_Tbl prod, Principal p) throws IllegalStateException, IOException {
		String path = servletContext.getRealPath("/resources/img/upload");
		UUID uuid = UUID.randomUUID();
		String msg = uuid.toString().substring(0,5);
		List<MultipartFile> fileList = multipartRequest.getFiles("prod_img");
		List<String> arrayList = new ArrayList<String>();
		
		int fileSize = fileList.size() -1;
		
		for(int i =0; i<3; i++) {
			if(i <=fileSize) {
				arrayList.add(msg + fileList.get(i).getOriginalFilename());
				fileList.get(i).transferTo(new File(path, msg + fileList.get(i).getOriginalFilename()));
			}else {
				arrayList.add(null);
			}
		}
		
		prod.setImgList(arrayList);
		prod.setS_id(p.getName());
		service.insertProduct(prod);
		
		return "redirect:/cutieshop/mypage";
	}
}