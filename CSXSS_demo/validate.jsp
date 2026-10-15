<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- STREAMING_CHUNK:Configuring Tailwind CSS styling and theme tokens -->

<script src="https://cdn.tailwindcss.com"></script>

<script>

tailwind.config = {

theme: {

extend: {

colors: {

navBg: '#1E3A8A',

iconColor: '#14B8A6'

}

}

}

}

</script>

<!-- STREAMING_CHUNK:Processing login validation credentials -->

<div class="max-w-md w-full bg-white p-8 rounded-xl shadow-sm border border-gray-100 text-center">

<%

// Retrieve parameters from login form

String email = request.getParameter("mail_id");

String password = request.getParameter("password");



// Trim values if not null

if (email != null) email = email.trim();

if (password != null) password = password.trim();



// Lab demo validation credentials

boolean isValid = (email != null && password != null &&

email.equalsIgnoreCase("student@college.edu") &&

password.equals("mumbai123"));



if (isValid) {

// Store user session for the authenticated student

session.setAttribute("userEmail", email);

%>

<!-- STREAMING_CHUNK:Rendering success card with automatic redirect logic -->

<!-- Success State Indicator -->

<div class="w-14 h-14 rounded-full bg-emerald-100 text-emerald-600 flex items-center justify-center mx-auto mb-4 text-2xl font-bold shadow-sm">

✓

</div>

<h2 class="text-2xl font-extrabold text-gray-900 mb-1">Welcome Back!</h2>

<p class="text-sm text-gray-500 mb-4">

Logged in as: <span class="font-semibold text-gray-800"><%= email %></span>

</p>



<div class="p-3 bg-emerald-50 text-emerald-700 rounded-lg text-xs font-medium border border-emerald-200 mb-6">

Authentication verified! Redirecting to campus portal in <span id="timer" class="font-bold text-sm">2</span>s...

</div>



<!-- Instant Action Button -->

<a href="HomePg.html" class="inline-flex items-center justify-center w-full bg-navBg hover:bg-blue-900 text-white font-semibold py-3 px-4 rounded-lg transition-colors text-sm shadow-md">

<span>Continue to Home Page &rarr;</span>

</a>



<!-- Client-Side Auto Redirect Script -->

<script>

let seconds = 2;

const timerElem = document.getElementById("timer");

const countdown = setInterval(function() {

seconds--;

if (timerElem) timerElem.textContent = seconds;

if (seconds <= 0) {

clearInterval(countdown);

window.location.href = "HomePg.html";

}

}, 1000);

</script>

<%

} else {

%>

<!-- STREAMING_CHUNK:Rendering failure state with retry link -->

<!-- Failure State Indicator -->

<div class="w-14 h-14 rounded-full bg-rose-100 text-rose-600 flex items-center justify-center mx-auto mb-4 text-2xl font-bold shadow-sm">

✕

</div>

<h2 class="text-2xl font-extrabold text-gray-900 mb-1">Authentication Failed</h2>

<p class="text-sm text-gray-500 mb-6">

Invalid college email ID or password provided.

</p>



<a href="Login.html" class="inline-flex items-center justify-center w-full bg-navBg hover:bg-blue-900 text-white font-semibold py-3 px-4 rounded-lg transition-colors text-sm shadow-md">

&larr; Try Again

</a>

<%

}

%>

</div>