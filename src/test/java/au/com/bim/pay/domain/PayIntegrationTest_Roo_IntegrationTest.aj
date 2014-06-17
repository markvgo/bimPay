// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.com.bim.pay.domain;

import au.com.bim.pay.domain.Pay;
import au.com.bim.pay.domain.PayDataOnDemand;
import au.com.bim.pay.domain.PayIntegrationTest;
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

privileged aspect PayIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PayIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PayIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PayIntegrationTest: @Transactional;
    
    @Autowired
    PayDataOnDemand PayIntegrationTest.dod;
    
    @Test
    public void PayIntegrationTest.testCountPays() {
        Assert.assertNotNull("Data on demand for 'Pay' failed to initialize correctly", dod.getRandomPay());
        long count = Pay.countPays();
        Assert.assertTrue("Counter for 'Pay' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PayIntegrationTest.testFindPay() {
        Pay obj = dod.getRandomPay();
        Assert.assertNotNull("Data on demand for 'Pay' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pay' failed to provide an identifier", id);
        obj = Pay.findPay(id);
        Assert.assertNotNull("Find method for 'Pay' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Pay' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PayIntegrationTest.testFindAllPays() {
        Assert.assertNotNull("Data on demand for 'Pay' failed to initialize correctly", dod.getRandomPay());
        long count = Pay.countPays();
        Assert.assertTrue("Too expensive to perform a find all test for 'Pay', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Pay> result = Pay.findAllPays();
        Assert.assertNotNull("Find all method for 'Pay' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Pay' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PayIntegrationTest.testFindPayEntries() {
        Assert.assertNotNull("Data on demand for 'Pay' failed to initialize correctly", dod.getRandomPay());
        long count = Pay.countPays();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Pay> result = Pay.findPayEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Pay' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Pay' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PayIntegrationTest.testFlush() {
        Pay obj = dod.getRandomPay();
        Assert.assertNotNull("Data on demand for 'Pay' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pay' failed to provide an identifier", id);
        obj = Pay.findPay(id);
        Assert.assertNotNull("Find method for 'Pay' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPay(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Pay' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PayIntegrationTest.testMergeUpdate() {
        Pay obj = dod.getRandomPay();
        Assert.assertNotNull("Data on demand for 'Pay' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pay' failed to provide an identifier", id);
        obj = Pay.findPay(id);
        boolean modified =  dod.modifyPay(obj);
        Integer currentVersion = obj.getVersion();
        Pay merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Pay' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PayIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Pay' failed to initialize correctly", dod.getRandomPay());
        Pay obj = dod.getNewTransientPay(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Pay' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Pay' identifier to be null", obj.getId());
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
        Assert.assertNotNull("Expected 'Pay' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PayIntegrationTest.testRemove() {
        Pay obj = dod.getRandomPay();
        Assert.assertNotNull("Data on demand for 'Pay' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Pay' failed to provide an identifier", id);
        obj = Pay.findPay(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Pay' with identifier '" + id + "'", Pay.findPay(id));
    }
    
}
