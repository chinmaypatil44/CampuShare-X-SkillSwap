<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    // Read the email submitted from mentor_registration_form.html
    String email = request.getParameter("email");
    if (email == null || email.trim().isEmpty()) {
        email = "your college email";
    }

    // Escape HTML so user input can't inject scripts (XSS protection)
    email = email.trim()
                 .replace("&", "&amp;")
                 .replace("<", "&lt;")
                 .replace(">", "&gt;")
                 .replace("\"", "&quot;")
                 .replace("'", "&#x27;");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkillSwap - Application Submitted</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f9fafb;
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif;
            color: #1f2937;
        }
        .card {
            width: 100%;
            max-width: 420px;
            margin: 16px;
            background: #fff;
            border-radius: 16px;
            padding: 48px 32px 40px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }
        .icon {
            width: 84px;
            height: 84px;
            margin: 0 auto 28px;
            border-radius: 50%;
            background: #d1fae5;
            color: #059669;
            font-size: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        h1 { margin: 0 0 8px; font-size: 30px; color: #111827; }
        .sub { margin: 0 0 24px; color: #6b7280; font-size: 16px; }
        .sub strong { color: #111827; }
        .notice {
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            color: #047857;
            border-radius: 10px;
            padding: 16px 20px;
            font-size: 15px;
            line-height: 1.5;
            margin-bottom: 14px;
        }
        .redirect { color: #047857; font-size: 14px; margin-bottom: 24px; }
        .redirect b { font-size: 17px; }
        .btn {
            display: block;
            width: 100%;
            background: #1E3A8A;
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            font-size: 17px;
            padding: 16px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(30, 58, 138, 0.3);
            transition: background 0.2s;
        }
        .btn:hover { background: #1e40af; }
    </style>
</head>
<body>
    <div class="card">
        <div class="icon">&#10003;</div>
        <h1>Applied Successfully!</h1>
        <p class="sub">Application submitted for: <strong><%= email %></strong></p>

        <div class="notice">
            Thank you for applying to mentor on SkillSwap. We will review your
            credentials and get back to you on your email within <b>3-4 days</b>.
        </div>

        <div class="redirect">
            Redirecting to Mentorship Directory in <b id="count">5</b>s...
        </div>

        <a href="mentorship_directory.html" class="btn">Go to Mentorship page &rarr;</a>
    </div>

    <script>
        var seconds = 5;
        var counter = document.getElementById("count");
        var timer = setInterval(function () {
            seconds--;
            counter.textContent = seconds;
            if (seconds <= 0) {
                clearInterval(timer);
                window.location.href = "mentorship_directory.html";
            }
        }, 1000);
    </script>
</body>
</html>
