document.getElementById("loginForm").addEventListener("submit", async function (e) {
    e.preventDefault();
  
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();
    const errorMsg = document.getElementById("errorMsg");
  
    try {
      const response = await fetch("http://127.0.0.1:8000/auth/login", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({ email, password })
      });
  
      const data = await response.json();
  
      if (data.token) {
        // Store token and role-based info
        localStorage.setItem("access_token", data.token);
        localStorage.setItem("name", data.name);
        localStorage.setItem("email", email);
  
        // Redirect based on user role (basic assumption via email for now)
        if (email.includes("admin")) {
          window.location.href = "admin/dashboard.html";
        } else if (email.includes("trainer")) {
          window.location.href = "trainer/dashboard.html";
        } else {
          window.location.href = "member/dashboard.html";
        }
  
      } else {
        errorMsg.textContent = data.message || "Login failed.";
      }
  
    } catch (error) {
      console.error("Login Error:", error);
      errorMsg.textContent = "Something went wrong. Please try again.";
    }
  });