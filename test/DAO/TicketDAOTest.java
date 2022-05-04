/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Ticket;
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
public class TicketDAOTest {
    
    public TicketDAOTest() {
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
     * Test of getTicket method, of class TicketDAO.
     */
    @Test
    public void testGetTicket() throws Exception {
        System.out.println("getTicket");
        int s = 1;
        TicketDAO instance = new TicketDAO();
        ArrayList<Ticket> result = instance.getTicket(s);
        assertNotNull(result);
        
    }
    /**
     * Test of addTicket method, of class TicketDAO.
     */
    @Test
    public void testAddTicket() throws Exception {
        System.out.println("addTicket");
        Ticket f = new Ticket();
        f.setPrice(80000);
        f.setScheduleId(1);
        f.setInvoiceId(5);
        f.setSeatNumber(8);
        
        TicketDAO instance = new TicketDAO();
        try {
            DAO.con.setAutoCommit(false);
            Boolean result = instance.addTicket(f);
            assertEquals(true, result);
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
    public void testAddTicket2() throws Exception {
        System.out.println("addTicket");
        Ticket f = new Ticket();
        f.setPrice(80000);
        f.setScheduleId(1);
        f.setInvoiceId(5);
        f.setSeatNumber(8);
        
        TicketDAO instance = new TicketDAO();
        try {
            DAO.con.setAutoCommit(false);
            Boolean result = instance.addTicket(f);
            result = instance.addTicket(f);
            assertEquals(false, result);
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
