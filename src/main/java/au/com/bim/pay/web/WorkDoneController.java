package au.com.bim.pay.web;
import au.com.bim.pay.domain.WorkDone;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/workdones")
@Controller
@RooWebScaffold(path = "workdones", formBackingObject = WorkDone.class)
public class WorkDoneController {
}
