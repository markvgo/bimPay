package au.com.bim.pay.web;
import au.com.bim.pay.domain.WorkType;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/worktypes")
@Controller
@RooWebScaffold(path = "worktypes", formBackingObject = WorkType.class)
public class WorkTypeController {
}
