// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.com.bim.pay.domain;

import au.com.bim.pay.domain.Employee;
import au.com.bim.pay.domain.Pay;
import au.com.bim.pay.domain.WorkDone;
import java.util.Set;

privileged aspect Employee_Roo_JavaBean {
    
    public Set<WorkDone> Employee.getWorkDone() {
        return this.workDone;
    }
    
    public void Employee.setWorkDone(Set<WorkDone> workDone) {
        this.workDone = workDone;
    }
    
    public Set<Pay> Employee.getPays() {
        return this.pays;
    }
    
    public void Employee.setPays(Set<Pay> pays) {
        this.pays = pays;
    }
    
}
