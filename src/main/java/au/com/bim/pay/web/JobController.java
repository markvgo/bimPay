package au.com.bim.pay.web;
import au.com.bim.pay.domain.Job;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/jobs")
@Controller
@RooWebScaffold(path = "jobs", formBackingObject = Job.class)
public class JobController {
}
