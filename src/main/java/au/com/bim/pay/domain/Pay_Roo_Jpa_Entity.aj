// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.com.bim.pay.domain;

import au.com.bim.pay.domain.Pay;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect Pay_Roo_Jpa_Entity {
    
    declare @type: Pay: @Entity;
    
    @Id
    @SequenceGenerator(name = "payGen", sequenceName = "PAY_SEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "payGen")
    @Column(name = "id")
    private Long Pay.id;
    
    @Version
    @Column(name = "version")
    private Integer Pay.version;
    
    public Long Pay.getId() {
        return this.id;
    }
    
    public void Pay.setId(Long id) {
        this.id = id;
    }
    
    public Integer Pay.getVersion() {
        return this.version;
    }
    
    public void Pay.setVersion(Integer version) {
        this.version = version;
    }
    
}
