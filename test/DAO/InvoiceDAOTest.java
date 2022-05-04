/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Invoice;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
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
public class InvoiceDAOTest {
    
    public InvoiceDAOTest() {
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
     * Test of getInvoiveDetail method, of class InvoiceDAO.
     */
    @Test
    public void testGetInvoiveDetail() throws Exception {
        System.out.println("getInvoiveDetail");
        int id = 1;
        String s = "2022-01-03";
        String e = "2022-10-03";
        InvoiceDAO instance = new InvoiceDAO();
        ArrayList<Invoice> result = instance.getInvoiveDetail(id, s, e);
        assertNotEquals(0,result.size());
        
    }
    @Test
    public void testGetInvoiveDetail2() throws Exception {
        System.out.println("getInvoiveDetail");
        int id = 1;
        String s = "2022-21-03";
        String e = "2022-10-03";
        InvoiceDAO instance = new InvoiceDAO();
        ArrayList<Invoice> result = instance.getInvoiveDetail(id, s, e);
        assertEquals(0,result.size());
        
    }
    @Test
    public void testGetInvoiveDetail3() throws Exception {
        System.out.println("getInvoiveDetail");
        int id = 1;
        String s = "2000-01-03";
        String e = "2000-10-03";
        InvoiceDAO instance = new InvoiceDAO();
        ArrayList<Invoice> result = instance.getInvoiveDetail(id, s, e);
        assertEquals(0,result.size());
        
    }
    @Test
    public void testGetInvoiveDetail4() throws Exception {
        System.out.println("getInvoiveDetail");
        int id = 1;
        String s = "2040-01-03";
        String e = "2040-10-03";
        InvoiceDAO instance = new InvoiceDAO();
        ArrayList<Invoice> result = instance.getInvoiveDetail(id, s, e);
        assertEquals(0,result.size());
        
    }

    /**
     * Test of addInvoice method, of class InvoiceDAO.
     */
    @Test
    public void testAddInvoice() throws Exception {
        System.out.println("addInvoice");
        Invoice s = new Invoice(5, 60000, 1,(new Timestamp(System.currentTimeMillis())), 0, 1);
        InvoiceDAO instance = new InvoiceDAO();
        try {
            DAO.con.setAutoCommit(false);
            int result = instance.addInvoice(s);
            assertNotEquals(0, result);
        } catch (Exception e) {
        }
        finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
            ex.printStackTrace();
            }
}
        
    }
    @Test
    public void testAddInvoice2() throws Exception {
        System.out.println("addInvoice");
        Invoice s = new Invoice(5, 0, 0,(new Timestamp(System.currentTimeMillis())), 0, 1);
        InvoiceDAO instance = new InvoiceDAO();
        try {
            DAO.con.setAutoCommit(false);
            int result = instance.addInvoice(s);
            assertEquals(0, result);
        } catch (Exception e) {
        }
        finally{
            try{
                DAO.con.rollback();
                DAO.con.setAutoCommit(true);
            }catch(Exception ex){
            ex.printStackTrace();
            }
}
        
    }
    
}
