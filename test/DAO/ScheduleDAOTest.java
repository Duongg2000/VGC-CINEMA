/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Schedule;
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
public class ScheduleDAOTest {
    
    public ScheduleDAOTest() {
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
     * Test of getSchedule method, of class ScheduleDAO.
     */
    @Test
    public void testGetSchedule() throws Exception {
        System.out.println("getSchedule");
        int s = 1;
        ScheduleDAO instance = new ScheduleDAO();

        ArrayList<Schedule> result = instance.getSchedule(s);
        assertNotNull( result);

    }
    @Test
    public void testGetSchedule2() throws Exception {
        System.out.println("getSchedule");
        int s = 0;
        ScheduleDAO instance = new ScheduleDAO();
        ArrayList<Schedule> result = instance.getSchedule(s);
        assertEquals(0, result.size());

    }
}
