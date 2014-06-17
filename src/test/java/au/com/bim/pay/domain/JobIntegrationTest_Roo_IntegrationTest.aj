// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.com.bim.pay.domain;

import au.com.bim.pay.domain.Job;
import au.com.bim.pay.domain.JobDataOnDemand;
import au.com.bim.pay.domain.JobIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect JobIntegrationTest_Roo_IntegrationTest {
    
    declare @type: JobIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: JobIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: JobIntegrationTest: @Transactional;
    
    @Autowired
    JobDataOnDemand JobIntegrationTest.dod;
    
    @Test
    public void JobIntegrationTest.testCountJobs() {
        Assert.assertNotNull("Data on demand for 'Job' failed to initialize correctly", dod.getRandomJob());
        long count = Job.countJobs();
        Assert.assertTrue("Counter for 'Job' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void JobIntegrationTest.testFindJob() {
        Job obj = dod.getRandomJob();
        Assert.assertNotNull("Data on demand for 'Job' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Job' failed to provide an identifier", id);
        obj = Job.findJob(id);
        Assert.assertNotNull("Find method for 'Job' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Job' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void JobIntegrationTest.testFindAllJobs() {
        Assert.assertNotNull("Data on demand for 'Job' failed to initialize correctly", dod.getRandomJob());
        long count = Job.countJobs();
        Assert.assertTrue("Too expensive to perform a find all test for 'Job', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Job> result = Job.findAllJobs();
        Assert.assertNotNull("Find all method for 'Job' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Job' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void JobIntegrationTest.testFindJobEntries() {
        Assert.assertNotNull("Data on demand for 'Job' failed to initialize correctly", dod.getRandomJob());
        long count = Job.countJobs();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Job> result = Job.findJobEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Job' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Job' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void JobIntegrationTest.testFlush() {
        Job obj = dod.getRandomJob();
        Assert.assertNotNull("Data on demand for 'Job' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Job' failed to provide an identifier", id);
        obj = Job.findJob(id);
        Assert.assertNotNull("Find method for 'Job' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyJob(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Job' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void JobIntegrationTest.testMergeUpdate() {
        Job obj = dod.getRandomJob();
        Assert.assertNotNull("Data on demand for 'Job' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Job' failed to provide an identifier", id);
        obj = Job.findJob(id);
        boolean modified =  dod.modifyJob(obj);
        Integer currentVersion = obj.getVersion();
        Job merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Job' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void JobIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Job' failed to initialize correctly", dod.getRandomJob());
        Job obj = dod.getNewTransientJob(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Job' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Job' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Job' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void JobIntegrationTest.testRemove() {
        Job obj = dod.getRandomJob();
        Assert.assertNotNull("Data on demand for 'Job' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Job' failed to provide an identifier", id);
        obj = Job.findJob(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Job' with identifier '" + id + "'", Job.findJob(id));
    }
    
}