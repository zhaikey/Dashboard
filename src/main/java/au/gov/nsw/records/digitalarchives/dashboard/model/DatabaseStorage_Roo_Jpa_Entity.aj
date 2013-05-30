// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.gov.nsw.records.digitalarchives.dashboard.model;

import au.gov.nsw.records.digitalarchives.dashboard.model.DatabaseStorage;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect DatabaseStorage_Roo_Jpa_Entity {
    
    declare @type: DatabaseStorage: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long DatabaseStorage.id;
    
    @Version
    @Column(name = "version")
    private Integer DatabaseStorage.version;
    
    public Long DatabaseStorage.getId() {
        return this.id;
    }
    
    public void DatabaseStorage.setId(Long id) {
        this.id = id;
    }
    
    public Integer DatabaseStorage.getVersion() {
        return this.version;
    }
    
    public void DatabaseStorage.setVersion(Integer version) {
        this.version = version;
    }
    
}