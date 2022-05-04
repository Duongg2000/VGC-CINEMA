/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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
public class EmployeeDAOTest {
    
    public EmployeeDAOTest() {
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
     * Test of checkUser method, of class EmployeeDAO.
     */
    @Test
    public void testCheckUser() throws Exception {
        System.out.println("checkUser");
        String u = "duongg";
        String p = "asd";
        EmployeeDAO instance = new EmployeeDAO();
        int expResult = 1;
        int result = instance.checkUser(u, p);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }
     @Test
    public void testCheckUser2() throws Exception {
        System.out.println("checkUser");
        String u = "ádaasd";
        String p = "sdgsdf";
        EmployeeDAO instance = new EmployeeDAO();
        int result = instance.checkUser(u, p);
        assertEquals( 0,result);
        // TODO review the generated test code and remove the default call to fail.

    }
    
}
