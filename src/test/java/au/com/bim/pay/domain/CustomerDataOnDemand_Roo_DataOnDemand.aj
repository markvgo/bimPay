// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package au.com.bim.pay.domain;

import au.com.bim.pay.domain.Customer;
import au.com.bim.pay.domain.CustomerDataOnDemand;
import au.com.bim.pay.reference.Province;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect CustomerDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CustomerDataOnDemand: @Component;
    
    private Random CustomerDataOnDemand.rnd = new SecureRandom();
    
    private List<Customer> CustomerDataOnDemand.data;
    
    public Customer CustomerDataOnDemand.getNewTransientCustomer(int index) {
        Customer obj = new Customer();
        setAddress(obj, index);
        setBirthDay(obj, index);
        setCity(obj, index);
        setEmail(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        setMobile(obj, index);
        setPhone(obj, index);
        setPostcode(obj, index);
        setProvince(obj, index);
        return obj;
    }
    
    public void CustomerDataOnDemand.setAddress(Customer obj, int index) {
        String address = "address_" + index;
        if (address.length() > 50) {
            address = address.substring(0, 50);
        }
        obj.setAddress(address);
    }
    
    public void CustomerDataOnDemand.setBirthDay(Customer obj, int index) {
        Date birthDay = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setBirthDay(birthDay);
    }
    
    public void CustomerDataOnDemand.setCity(Customer obj, int index) {
        String city = "city_" + index;
        if (city.length() > 30) {
            city = city.substring(0, 30);
        }
        obj.setCity(city);
    }
    
    public void CustomerDataOnDemand.setEmail(Customer obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 30) {
            email = email.substring(0, 30);
        }
        obj.setEmail(email);
    }
    
    public void CustomerDataOnDemand.setFirstName(Customer obj, int index) {
        String firstName = "firstName_" + index;
        if (firstName.length() > 30) {
            firstName = firstName.substring(0, 30);
        }
        obj.setFirstName(firstName);
    }
    
    public void CustomerDataOnDemand.setLastName(Customer obj, int index) {
        String lastName = "lastName_" + index;
        if (lastName.length() > 30) {
            lastName = lastName.substring(0, 30);
        }
        obj.setLastName(lastName);
    }
    
    public void CustomerDataOnDemand.setMobile(Customer obj, int index) {
        String mobile = "mobile_" + index;
        obj.setMobile(mobile);
    }
    
    public void CustomerDataOnDemand.setPhone(Customer obj, int index) {
        String phone = "phone_" + index;
        obj.setPhone(phone);
    }
    
    public void CustomerDataOnDemand.setPostcode(Customer obj, int index) {
        String postcode = "po_" + index;
        if (postcode.length() > 4) {
            postcode = postcode.substring(0, 4);
        }
        obj.setPostcode(postcode);
    }
    
    public void CustomerDataOnDemand.setProvince(Customer obj, int index) {
        Province province = Province.class.getEnumConstants()[0];
        obj.setProvince(province);
    }
    
    public Customer CustomerDataOnDemand.getSpecificCustomer(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Customer obj = data.get(index);
        Long id = obj.getId();
        return Customer.findCustomer(id);
    }
    
    public Customer CustomerDataOnDemand.getRandomCustomer() {
        init();
        Customer obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Customer.findCustomer(id);
    }
    
    public boolean CustomerDataOnDemand.modifyCustomer(Customer obj) {
        return false;
    }
    
    public void CustomerDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Customer.findCustomerEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Customer' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Customer>();
        for (int i = 0; i < 10; i++) {
            Customer obj = getNewTransientCustomer(i);
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
            data.add(obj);
        }
    }
    
}
