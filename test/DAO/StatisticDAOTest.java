/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.CustomerStatistic;
import Model.FilmStatistic;
import Model.Invoice;
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
public class StatisticDAOTest {
    
    public StatisticDAOTest() {
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
     * Test of getFilmStatistic method, of class StatisticDAO.
     */
    @Test
    public void testGetFilmStatistic() throws Exception {
        System.out.println("getFilmStatistic");
        String s = "2022-01-03";
        String a = "2022-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<FilmStatistic> result = instance.getFilmStatistic(s, a);
        assertNotEquals(0,result.size());
       
    }
@Test
    public void testGetFilmStatistic2() throws Exception {
        System.out.println("getFilmStatistic");
        String s = "2022-20-03";
        String a = "2022-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<FilmStatistic> result = instance.getFilmStatistic(s, a);
        assertEquals(0,result.size());
       
    }
    @Test
    public void testGetFilmStatistic3() throws Exception {
        System.out.println("getFilmStatistic");
        String s = "2000-20-03";
        String a = "2000-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<FilmStatistic> result = instance.getFilmStatistic(s, a);
        assertEquals(0,result.size());
       
    }
    @Test
    public void testGetFilmStatistic4() throws Exception {
        System.out.println("getFilmStatistic");
        String s = "2040-20-03";
        String a = "2040-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<FilmStatistic> result = instance.getFilmStatistic(s, a);
        assertEquals(0,result.size());
       
    }
    /**
     * Test of getFilmStatisticDetail method, of class StatisticDAO.
     */
    @Test
    public void testGetFilmStatisticDetail() throws Exception {
        System.out.println("getFilmStatisticDetail");
        int id = 1;
        String s = "2022-01-03";
        String e = "2022-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<FilmStatistic> result = instance.getFilmStatisticDetail(id, s, e);
        assertNotEquals(0,result.size());

    }
@Test
    public void testGetFilmStatisticDetail2() throws Exception {
        System.out.println("getFilmStatisticDetail");
        int id = 1;
        String s = "2022-21-03";
        String e = "2022-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<FilmStatistic> result = instance.getFilmStatisticDetail(id, s, e);
        assertEquals(0,result.size());

    }
    @Test
    public void testGetFilmStatisticDetail3() throws Exception {
        System.out.println("getFilmStatisticDetail");
        int id = 1;
        String s = "2000-01-03";
        String e = "2000-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<FilmStatistic> result = instance.getFilmStatisticDetail(id, s, e);
        assertEquals(0,result.size());

    }
    @Test
    public void testGetFilmStatisticDetail4() throws Exception {
        System.out.println("getFilmStatisticDetail");
        int id = 1;
        String s = "2040-01-03";
        String e = "2040-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<FilmStatistic> result = instance.getFilmStatisticDetail(id, s, e);
        assertEquals(0,result.size());

    }
    
    /**
     * Test of getCustomerStatistic method, of class StatisticDAO.
     */
    @Test
    public void testGetCustomerStatistic() throws Exception {
        System.out.println("getCustomerStatistic");
        String s = "2022-01-03";
        String e = "2022-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<CustomerStatistic> result = instance.getCustomerStatistic(s, e);
        assertNotEquals(0,result.size());

    }
    @Test
    public void testGetCustomerStatistic2() throws Exception {
        System.out.println("getCustomerStatistic");
        String s = "2022-21-03";
        String e = "2022-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<CustomerStatistic> result = instance.getCustomerStatistic(s, e);
        assertEquals(0,result.size());

    }
    @Test
    public void testGetCustomerStatistic3() throws Exception {
        System.out.println("getCustomerStatistic");
        String s = "2002-01-03";
        String e = "2002-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<CustomerStatistic> result = instance.getCustomerStatistic(s, e);
        assertEquals(0,result.size());

    }
    @Test
    public void testGetCustomerStatistic4() throws Exception {
        System.out.println("getCustomerStatistic");
        String s = "2040-01-03";
        String e = "2040-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<CustomerStatistic> result = instance.getCustomerStatistic(s, e);
        assertEquals(0,result.size());

    }

    /**
     * Test of getCustomerInvoiveDetail method, of class StatisticDAO.
     */
    @Test
    public void testGetCustomerInvoiveDetail() throws Exception {
        System.out.println("getCustomerInvoiveDetail");
        int id = 1;
        String s = "2022-01-03";
        String e = "2022-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<Invoice> result = instance.getCustomerInvoiveDetail(id, s, e);
        assertNotEquals(0,result.size());
    }
    @Test
    public void testGetCustomerInvoiveDetail2() throws Exception {
        System.out.println("getCustomerInvoiveDetail");
        int id = 1;
        String s = "2022-21-03";
        String e = "2022-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<Invoice> result = instance.getCustomerInvoiveDetail(id, s, e);
        assertEquals(0,result.size());
    }
    @Test
    public void testGetCustomerInvoiveDetail3() throws Exception {
        System.out.println("getCustomerInvoiveDetail");
        int id = 1;
        String s = "2000-01-03";
        String e = "2000-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<Invoice> result = instance.getCustomerInvoiveDetail(id, s, e);
        assertEquals(0,result.size());
    }
    @Test
    public void testGetCustomerInvoiveDetail4() throws Exception {
        System.out.println("getCustomerInvoiveDetail");
        int id = 1;
        String s = "2040-01-03";
        String e = "2040-10-03";
        StatisticDAO instance = new StatisticDAO();
        ArrayList<Invoice> result = instance.getCustomerInvoiveDetail(id, s, e);
        assertEquals(0,result.size());
    }
    
}
