package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Employee;


import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
@WebServlet("/edit-employee")
public class EmployeeEditController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try {
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String entityId = req.getParameter("employee_id");
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Employee employee = session.get(Employee.class,Integer.parseInt(entityId));
            session.getTransaction().commit();
            if(employee != null) {
                req.setAttribute("employee",employee );
                req.getRequestDispatcher("employee/edit.jsp").forward(req, resp);
            }else
                resp.setStatus(404);
        }catch (Exception e){
            resp.setStatus(404);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try (Session session = sessionFactory.openSession()){
            session.beginTransaction();
            Employee employee = session.get(Employee.class,Integer.parseInt(entityId));
            if (employee != null){
                employee.setEmployee_name(req.getParameter("name"));
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate birthday = LocalDate.parse(req.getParameter("birthday"), formatter);
                employee.setBirthday(java.sql.Date.valueOf(birthday));

                employee.setPhone_number(req.getParameter("phone_number"));
                employee.setEmail(req.getParameter("email"));
                session.update(employee);
            }
            session.getTransaction().commit();
            resp.sendRedirect("list-employee");
        }catch (Exception e){
            resp.setStatus(404);
        }
    }
}
