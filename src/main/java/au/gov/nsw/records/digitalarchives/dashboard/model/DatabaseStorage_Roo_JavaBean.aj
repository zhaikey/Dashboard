// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.gov.nsw.records.digitalarchives.dashboard.model;

import au.gov.nsw.records.digitalarchives.dashboard.model.DatabaseStorage;

privileged aspect DatabaseStorage_Roo_JavaBean {
    
    public String DatabaseStorage.getSourceDatabaseSize() {
        return this.sourceDatabaseSize;
    }
    
    public void DatabaseStorage.setSourceDatabaseSize(String sourceDatabaseSize) {
        this.sourceDatabaseSize = sourceDatabaseSize;
    }
    
    public String DatabaseStorage.getMigratinSize() {
        return this.migratinSize;
    }
    
    public void DatabaseStorage.setMigratinSize(String migratinSize) {
        this.migratinSize = migratinSize;
    }
    
    public String DatabaseStorage.getTotalStorageSize() {
        return this.totalStorageSize;
    }
    
    public void DatabaseStorage.setTotalStorageSize(String totalStorageSize) {
        this.totalStorageSize = totalStorageSize;
    }
    
}