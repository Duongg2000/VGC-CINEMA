/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Customer;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Dươngg
 */
public class CustomerDAOTest {
    
    public CustomerDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getCustomer method, of class CustomerDAO.
     */
    @Test
    public void testGetCustomer() throws Exception {
        System.out.println("getCustomer");
        int s = 1;
        CustomerDAO instance = new CustomerDAO();
        Customer result = instance.getCustomer(s);
        assertEquals(1, result.getId());

    }
    @Test
    public void testGetCustomer2() throws Exception {
        System.out.println("getCustomer");
        int s = 0;
        CustomerDAO instance = new CustomerDAO();
        Customer result = instance.getCustomer(s);
        assertNull(result);

    }
    
}
