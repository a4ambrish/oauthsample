package nic.confonet.resourceserver.controller;

import nic.confonet.resourceserver.model.CustomPrincipal;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResourceController {

	@GetMapping("/admins")
	@PreAuthorize("hasAuthority('role_admin')")
	public String context() {
		CustomPrincipal principal = (CustomPrincipal) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		return principal.getUsername() + " " + principal.getEmail();
	}

	@GetMapping("/users")
	@PreAuthorize("hasAnyAuthority('role_admin','role_user')")
	public String secured(CustomPrincipal principal) {
		return principal.getUsername() + " " + principal.getEmail();
	}

	@GetMapping("/common")
	public String general() {
		return "common api success";
	}
	
	
	@GetMapping("/neeraj")
	@PreAuthorize("hasAnyAuthority('role_admin','role_user')")
	public String general1() {
		return "hello";
	}
}
