package com.example.serv;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.action.SimpleAction;
import com.example.bean.SimpleBean;

@WebServlet("/SimpleServlet")
public class SimpleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String amount = request.getParameter("amount");
        String year = request.getParameter("year"); 
        String rate = request.getParameter("rate");

        SimpleBean sb = new SimpleBean();
        sb.setCustomer_name(name);
        sb.setAge(age);
        sb.setPrinciple_amount(amount);
        sb.setYears(year);
        sb.setRate(rate);

        SimpleAction sa = new SimpleAction();
        String[] data = sa.details(sb);

        try {
            if (data != null) {
                request.setAttribute("name", data[0]);
                request.setAttribute("age", data[1]);
                request.setAttribute("amount", data[2]);
                request.setAttribute("year", data[3]);
                request.setAttribute("rate", data[4]);

                RequestDispatcher rd = request.getRequestDispatcher("/Calculate SI.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("input.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("input.jsp");
        }
    }
}