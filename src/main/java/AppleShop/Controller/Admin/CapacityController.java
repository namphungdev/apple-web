package AppleShop.Controller.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import AppleShop.Controller.User.BaseController;
import AppleShop.Entity.Capacitys;
import AppleShop.Service.User.CapacityServiceImpl;

@Controller
public class CapacityController extends BaseController {
	@Autowired
	private CapacityServiceImpl capacityServiceImpl;
	
	@RequestMapping(value={"/home_admin/capacity_list"})
	  public String listCapacity(Model model) {
	    model.addAttribute("listCapacity", capacityServiceImpl.findAll());    
	    return "admin/capacity/capacity_list";
	  }
	  @RequestMapping("/home_admin/capacity_save")
	  public String insertCapacity(Model model) {
	    model.addAttribute("capacity", new Capacitys());
	    return "admin/capacity/capacity_save";
	  }
	   @RequestMapping("/home_admin/updateCapacity")
	  public String doUpdateCapacity(@ModelAttribute("capacity") Capacitys capacity, Model model) {
		   capacityServiceImpl.update(capacity);
	    model.addAttribute("listCapacity", capacityServiceImpl.findAll());
	    return "admin/capacity/capacity_list";
	  }
	  
	  @RequestMapping("/home_admin/capacity_update/{id}")
	  public String updateCapacity(@PathVariable int id, Model model) {
		  Capacitys capacity = capacityServiceImpl.findById(id);
	    model.addAttribute("capacity", capacity);
	    return "admin/capacity/capacity_update";
	  }
	  @RequestMapping("/home_admin/saveCapacity")
	  public String doSaveCapacity(@ModelAttribute("capacity") Capacitys capacity, Model model) {
	    capacityServiceImpl.save(capacity);
	    model.addAttribute("listCapacity", capacityServiceImpl.findAll());
	    return "admin/capacity/capacity_list";
	  }
	
	
	  @RequestMapping("/home_admin/capacityDelete/{id}")
	  public String doDeleteCapacity(@PathVariable int id, Model model) {
		  capacityServiceImpl.delete(id);
	    model.addAttribute("listCapacity", capacityServiceImpl.findAll());
	    return "admin/capacity/capacity_list";
	  }
	
	
	
}
 