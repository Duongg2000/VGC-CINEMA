/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Seat;
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
public class SeatDAOTest {
    
    public SeatDAOTest() {
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
     * Test of getSeat method, of class SeatDAO.
     */
    @Test
    public void testGetSeat() throws Exception {
        System.out.println("getSeat");
        int s = 1;
        SeatDAO instance = new SeatDAO();
        ArrayList<Seat> result = instance.getSeat(s);
        assertEquals(16, result.size());
    }
    
}
