<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Page Not Found</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            padding: 50px;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 600px;
            margin: auto;
        }
        img {
            max-width: 100%;
            height: auto;
        }
        h1 {
            font-size: 2.5rem;
            color: #1a1a1a;
        }
        p {
            color: #666;
            margin: 20px 0;
        }
        a.button {
            display: inline-block;
            background-color: #6c5ce7;
            color: #fff;
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
        }
        a.button:hover {
            background-color: #5a4bcc;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="${pageContext.request.contextPath}/Resources/Image/login/Error.png" alt="Not Found" />
        <h1>That Page Can't Be Found</h1>
        <p>It looks like nothing was found at this page. Maybe try to search for what you are looking for?</p>
        <a href="${pageContext.request.contextPath}/home" class="button">Go To Homepage</a>
    </div>
</body>
</html>