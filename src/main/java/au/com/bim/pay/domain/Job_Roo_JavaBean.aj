// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.com.bim.pay.domain;

import au.com.bim.pay.domain.Customer;
import au.com.bim.pay.domain.Job;
import java.util.Date;
import java.util.Set;

privileged aspect Job_Roo_JavaBean {
    
    public String Job.getDescription() {
        return this.description;
    }
    
    public void Job.setDescription(String description) {
        this.description = description;
    }
    
    public Date Job.getStartDate() {
        return this.startDate;
    }
    
    public void Job.setStartDate(Date startDate) {
        this.startDate = startDate;
    }
    
    public Date Job.getEndDate() {
        return this.endDate;
    }
    
    public void Job.setEndDate(Date endDate) {
        this.endDate = endDate;
    }
    
    public Set<Job> Job.getJobs() {
        return this.jobs;
    }
    
    public void Job.setJobs(Set<Job> jobs) {
        this.jobs = jobs;
    }
    
    public Customer Job.getCustomer() {
        return this.customer;
    }
    
    public void Job.setCustomer(Customer customer) {
        this.customer = customer;
    }
    
}
