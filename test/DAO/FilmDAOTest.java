/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Film;
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
public class FilmDAOTest {
    
    public FilmDAOTest() {
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
     * Test of getFilmDetail method, of class FilmDAO.
     */
    @Test
    public void testGetFilmDetail() throws Exception {
        System.out.println("getFilmDetail");
        String s = " ";
        FilmDAO instance = new FilmDAO();
        ArrayList<Film> result = instance.getFilmDetail(s);
        assertNotNull( result);
        // TODO review the generated test code and remove the default call to fail.
    }
    @Test
    public void testGetFilmDetail2() throws Exception {
        System.out.println("getFilmDetail");
        String s = "fđsgahfđfgdgfds";
        FilmDAO instance = new FilmDAO();
        int expResult = 0;
        ArrayList<Film> result = instance.getFilmDetail(s);
        assertEquals( expResult,result.size());
        // TODO review the generated test code and remove the default call to fail.
    }
}
