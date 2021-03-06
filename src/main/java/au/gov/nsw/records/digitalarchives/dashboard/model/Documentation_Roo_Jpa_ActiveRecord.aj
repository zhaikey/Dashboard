// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.gov.nsw.records.digitalarchives.dashboard.model;

import au.gov.nsw.records.digitalarchives.dashboard.model.Documentation;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Documentation_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Documentation.entityManager;
    
    public static final EntityManager Documentation.entityManager() {
        EntityManager em = new Documentation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Documentation.countDocumentations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Documentation o", Long.class).getSingleResult();
    }
    
    public static List<Documentation> Documentation.findAllDocumentations() {
        return entityManager().createQuery("SELECT o FROM Documentation o", Documentation.class).getResultList();
    }
    
    public static Documentation Documentation.findDocumentation(Long id) {
        if (id == null) return null;
        return entityManager().find(Documentation.class, id);
    }
    
    public static List<Documentation> Documentation.findDocumentationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Documentation o", Documentation.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Documentation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Documentation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Documentation attached = Documentation.findDocumentation(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Documentation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Documentation.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Documentation Documentation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Documentation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
