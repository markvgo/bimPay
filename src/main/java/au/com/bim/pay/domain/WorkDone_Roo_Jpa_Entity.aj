// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.com.bim.pay.domain;

import au.com.bim.pay.domain.WorkDone;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect WorkDone_Roo_Jpa_Entity {
    
    declare @type: WorkDone: @Entity;
    
    @Id
    @SequenceGenerator(name = "workDoneGen", sequenceName = "WORK_SEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "workDoneGen")
    @Column(name = "id")
    private Long WorkDone.id;
    
    @Version
    @Column(name = "version")
    private Integer WorkDone.version;
    
    public Long WorkDone.getId() {
        return this.id;
    }
    
    public void WorkDone.setId(Long id) {
        this.id = id;
    }
    
    public Integer WorkDone.getVersion() {
        return this.version;
    }
    
    public void WorkDone.setVersion(Integer version) {
        this.version = version;
    }
    
}