package com.example.shdemo.web;

import com.example.shdemo.domain.Rezyser;
import com.example.shdemo.service.SellingManager;

import java.util.Date;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/addRezyser")
public class AddRezyserServlet extends HttpServlet{
    @EJB
    private SellingManager storage;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String birthDate = request.getParameter("birthDate");
        String pin = request.getParameter("pin");

	DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        Rezyser newRezyser = new Rezyser();
        newRezyser.setFirstName(firstName);
	try
	{
        	newRezyser.setBirthDate(format.parse(birthDate ));
	}
	catch(Exception e)
	{
	}
        newRezyser.setPin(pin);

        storage.addRezyser(newRezyser);

        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/Rezyserzy"));
    }
}
