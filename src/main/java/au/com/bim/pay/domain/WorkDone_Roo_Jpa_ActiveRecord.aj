// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.com.bim.pay.domain;

import au.com.bim.pay.domain.WorkDone;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect WorkDone_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager WorkDone.entityManager;
    
    public static final List<String> WorkDone.fieldNames4OrderClauseFilter = java.util.Arrays.asList("description", "startDate", "endDate", "rate", "quantity", "worktype", "customer", "employee");
    
    public static final EntityManager WorkDone.entityManager() {
        EntityManager em = new WorkDone().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long WorkDone.countWorkDones() {
        return entityManager().createQuery("SELECT COUNT(o) FROM WorkDone o", Long.class).getSingleResult();
    }
    
    public static List<WorkDone> WorkDone.findAllWorkDones() {
        return entityManager().createQuery("SELECT o FROM WorkDone o", WorkDone.class).getResultList();
    }
    
    public static List<WorkDone> WorkDone.findAllWorkDones(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM WorkDone o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, WorkDone.class).getResultList();
    }
    
    public static WorkDone WorkDone.findWorkDone(Long id) {
        if (id == null) return null;
        return entityManager().find(WorkDone.class, id);
    }
    
    public static List<WorkDone> WorkDone.findWorkDoneEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM WorkDone o", WorkDone.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<WorkDone> WorkDone.findWorkDoneEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM WorkDone o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, WorkDone.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void WorkDone.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void WorkDone.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            WorkDone attached = WorkDone.findWorkDone(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void WorkDone.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void WorkDone.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public WorkDone WorkDone.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        WorkDone merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
