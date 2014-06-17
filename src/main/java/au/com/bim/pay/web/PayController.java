package au.com.bim.pay.web;
import au.com.bim.pay.domain.Pay;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/pays")
@Controller
@RooWebScaffold(path = "pays", formBackingObject = Pay.class)
public class PayController {
}
