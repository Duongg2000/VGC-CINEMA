/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package DAO;

import Model.Film;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author Dươngg
 */
public class AddFilmServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();

                    // Configure a repository (to ensure a secure temp location is used)
                    ServletContext servletContext = this.getServletConfig().getServletContext();
                    File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                    factory.setRepository(repository);

                    // Create a new file upload handler
                    ServletFileUpload upload = new ServletFileUpload(factory);

                    // Parse the request
                    List<FileItem> items = null;
                    try {
                        items = upload.parseRequest(request);
                    } catch (FileUploadException ex) {
                        Logger.getLogger(AddFilmServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    Film f = new Film();
                    Iterator<FileItem> iter = items.iterator();
                        while (iter.hasNext()) {
                            FileItem item = iter.next();

                            if (item.isFormField()) {
                                if(item.getFieldName().equalsIgnoreCase("fName")) {
                                    f.setName(item.getString());
                                    System.out.println(item.getString());
                }
                                if(item.getFieldName().equalsIgnoreCase("director")) f.setDirector(item.getString());
                                if(item.getFieldName().equalsIgnoreCase("genre")) f.setGenre(item.getString());
                                if(item.getFieldName().equalsIgnoreCase("actor")) f.setActor(item.getString());
                                if(item.getFieldName().equalsIgnoreCase("rated")) f.setRated(item.getString());
                                if(item.getFieldName().equalsIgnoreCase("rDate")) f.setReleaseDate(Date.valueOf(item.getString()));
                                if(item.getFieldName().equalsIgnoreCase("des")) f.setDescription(item.getString());
                            } else {
                                InputStream inStream = item.getInputStream();
                                   try {
                                       f.setPoster(new SerialBlob(IOUtils.toByteArray(inStream)));
                                   } catch (SQLException ex) {
                                       Logger.getLogger(AddFilmServlet.class.getName()).log(Level.SEVERE, null, ex);
                                   }
                                inStream.close();                              
                                }                         
                            }           
                    FilmDAO dao = new FilmDAO();
                    boolean kq = false;
            try {
                kq = dao.addFilmInFor(f);
            } catch (SQLException ex) {
                Logger.getLogger(AddFilmServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                    if(kq){              
                    response.sendRedirect("/VGCCinema/Employee/FunctionView.jsp");
                    }
                    else
                     response.sendRedirect("/VGCCinema/Employee/AddFilmInfoView.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
