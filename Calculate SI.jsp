<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculation Simple Interest</title>
</head>
<body>
    <h1>Simple Interest Calculation Result</h1>
    <p>Name: ${name}</p>
    <p>Age: ${age}</p>
    <p>Principal Amount: <%= request.getParameter("amount") %></p>
    <p>Years: <%= request.getParameter("year") %></p>
    <p>Rate: <%= request.getParameter("rate") %></p>

    <% 
        int p = 0;
        int n = 0;
        int r = 0;
        double si = 0.0;

        try {
            p = Integer.parseInt(request.getParameter("amount"));
            n = Integer.parseInt(request.getParameter("year"));
            r = Integer.parseInt(request.getParameter("rate"));
            si = (p * n * r) / 100.0;
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    %>

    <p>Simple Interest: <%= si %></p>
</body>
</html>
