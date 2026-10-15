<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// STREAMING_CHUNK:Retrieving the email parameter from the form submission
String email = request.getParameter("email");
if (email != null) {
email = email.trim();
} else {
email = "";
}
%>

<!-- STREAMING_CHUNK:Rendering the top navigation bar -->
<!-- Top Navigation Bar -->
<nav class="bg-[#1E3A8A] flex items-center justify-between px-6 py-4 shadow-md w-full shrink-0">
    <div class="flex items-center space-x-6">
        <div class="bg-white px-2 py-1 border border-gray-300 rounded shadow-sm flex items-center justify-center">
            <img src="CampuShare and Skillswapfinal_2.svg" alt="Logo" class="h-10 w-auto" onerror="this.outerHTML='<span class=\'text-[#1E3A8A] font-bold px-2\'>SkillSwap</span>'">
        </div>
    </div>
    
    <div class="absolute left-1/2 transform -translate-x-1/2">
        <h1 class="text-[#FFFFFF] text-xl md:text-2xl tracking-wider font-semibold">Status</h1>
    </div>
</nav>

<!-- STREAMING_CHUNK:Evaluating the email to display the appropriate card -->
<!-- Status Message Container -->
<main class="flex-grow flex items-center justify-center px-4">
    
    <div class="bg-white rounded-xl p-10 border border-gray-200 shadow-lg text-center max-w-lg w-full transform transition duration-500 scale-100">
        
        <% 
            // Hardcoded demo logic based on user's request
            if (email.equalsIgnoreCase("gnv@gmail.com")) { 
        %>
            <!-- STREAMING_CHUNK:Rendering the "Already Registered" state -->
            <div class="mx-auto flex items-center justify-center h-20 w-20 rounded-full bg-red-100 mb-6">
                <svg class="h-12 w-12 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
            </div>
            
            <h2 class="text-2xl font-extrabold text-[#1E3A8A] mb-4">Registration Failed</h2>
            
            <div class="bg-red-50 border border-red-200 p-4 rounded-lg mb-8">
                <p class="text-gray-700 text-lg leading-relaxed font-medium">
                    User already registered. Please login to your account using <b><%= email %></b>.
                </p>
            </div>

            <a href="login.html" class="inline-flex items-center justify-center px-6 py-2.5 bg-[#1E3A8A] hover:bg-blue-900 text-white font-semibold rounded-md transition shadow-sm w-full">
                Proceed to Login
            </a>

        <% 
            } else if (email.equalsIgnoreCase("crg@gmail.com")) { 
        %>
            <!-- STREAMING_CHUNK:Rendering the "Email Not Registered" state -->
            <div class="mx-auto flex items-center justify-center h-20 w-20 rounded-full bg-orange-100 mb-6">
                <svg class="h-12 w-12 text-orange-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                </svg>
            </div>
            
            <h2 class="text-2xl font-extrabold text-[#1E3A8A] mb-4">Action Denied</h2>
            
            <div class="bg-orange-50 border border-orange-200 p-4 rounded-lg mb-8">
                <p class="text-gray-700 text-lg leading-relaxed font-medium">
                    Email not registered with our portal, please try again with a registered email id.
                </p>
            </div>

            <a href="register-mentor.html" class="inline-flex items-center justify-center px-6 py-2.5 bg-[#1E3A8A] hover:bg-blue-900 text-white font-semibold rounded-md transition shadow-sm w-full">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
                Go Back & Try Again
            </a>

        <% 
            } else { 
                // This covers "student@college.edu" and defaults to success for a smooth demo flow
        %>
            <!-- STREAMING_CHUNK:Rendering the "Success" state -->
            <div class="mx-auto flex items-center justify-center h-20 w-20 rounded-full bg-green-100 mb-6">
                <svg class="h-12 w-12 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
                </svg>
            </div>
            
            <h2 class="text-2xl font-extrabold text-[#1E3A8A] mb-4">Application Received!</h2>
            
            <div class="bg-[#BAE6FD]/20 border border-[#BAE6FD] p-4 rounded-lg mb-8">
                <p class="text-gray-700 text-lg leading-relaxed font-medium">
                    "Your registration request has been sent. One of our co-ordinators will contact you for verification shortly."
                </p>
            </div>

            <a href="mentorship.html" class="inline-flex items-center justify-center px-6 py-2.5 bg-[#1E3A8A] hover:bg-blue-900 text-white font-semibold rounded-md transition shadow-sm w-full">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
                Return to Mentorship Page
            </a>
        <% 
            } 
        %>

    </div>

</main>
