document.addEventListener("DOMContentLoaded", () => {
    const sidebar = document.getElementById("sidebar");
  
    if (sidebar) {
      sidebar.innerHTML = `
        <div class="sidebar">
          <h2>Admin Panel</h2>
          <ul>
            <li><a href="dashboard.html">Dashboard</a></li>
            <li><a href="user_details.html">User Details</a></li>
            <li><a href="trainer_details.html">Trainer Details</a></li>
            <li><a href="assign_trainer.html">Assigner</a></li>
            <li><a href="#" id="logout-link">Logout</a></li>
          </ul>
        </div>
      `;
  
      // Attach logout functionality to the link
      const logoutLink = document.getElementById("logout-link");
      if (logoutLink) {
        logoutLink.addEventListener("click", (e) => {
          e.preventDefault();
          logout();
        });
      }
    }
  });
  
  function logout() {
    const token = localStorage.getItem("access_token");
  
    if (!token) {
      localStorage.clear();
      window.location.href = "../index.html";
      return;
    }
  
    fetch("http://127.0.0.1:8000/auth/logout", {
      method: "POST",
      headers: {
        "Authorization": `Bearer ${token}`,
        "Content-Type": "application/json"
      }
    })
      .then((res) => {
        console.log("Logout response status:", res.status);
        localStorage.clear();
        window.location.href = "../index.html";
      })
      .catch((err) => {
        console.error("Logout error:", err);
        localStorage.clear();
        window.location.href = "../index.html";
      });
  }