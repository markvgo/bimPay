// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.com.bim.pay.domain;

import au.com.bim.pay.domain.Customer;
import au.com.bim.pay.domain.WorkDone;
import java.util.Set;

privileged aspect Customer_Roo_JavaBean {
    
    public Set<WorkDone> Customer.getWorkDone() {
        return this.workDone;
    }
    
    public void Customer.setWorkDone(Set<WorkDone> workDone) {
        this.workDone = workDone;
    }
    
}
