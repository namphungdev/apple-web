package AppleShop.Controller.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import AppleShop.Controller.User.BaseController;
import AppleShop.Entity.BillDetail;
import AppleShop.Entity.Bills;
import AppleShop.Entity.Size;
import AppleShop.Service.User.BillsServiceImpl;
@Controller
public class BillAdminController extends BaseController {

	@Autowired
	private BillsServiceImpl billsService;
	
	@RequestMapping(value={"/home_admin/bills_list"})
	  public String listBill(Model model) {
	    model.addAttribute("listBill", billsService.findAll());    
	    return "admin/bills/bills_list";
	  }
	
	 @RequestMapping("/home_admin/bills_update/{id}")
	  public String updateBill(@PathVariable int id, Model model) {	
	    List<BillDetail> billdetail = billsService.findById(id);
	    model.addAttribute("billdetail", billdetail);
	    model.addAttribute("bill", billsService.findBillById(id));
	    return "admin/bills/bills_update";
	  }
	 
	 @RequestMapping("/home_admin/updateBills")
	  public String doUpdateBill(@ModelAttribute("bill") Bills bill, Model model) {
		 billsService.update(bill);
	    model.addAttribute("listBill", billsService.findAll());
	    return "admin/bills/bills_list";
	  }

}
