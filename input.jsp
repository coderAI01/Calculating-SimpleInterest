<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Input Form</title>
</head>
<body>
    <h1>Input Form</h1>
    <form action="SimpleServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required><br>

        <label for="age">Age:</label>
        <input type="text" name="age" id="age" required><br>

        <label for="amount">Amount:</label>
        <input type="text" name="amount" id="amount" required><br>

        <label for="year">Year:</label>
        <input type="text" name="year" id="year" required><br>

        <label for="rate">Rate:</label>
        <input type="text" name="rate" id="rate" required><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
