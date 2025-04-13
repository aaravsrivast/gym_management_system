document.getElementById("sidebar").innerHTML = `
  <div class="sidebar">
    <h2>Member Panel</h2>
    <ul>
      <li><a href="dashboard.html">Dashboard</a></li>
      <li><a href="profile.html">Profile</a></li>
      <li><a href="locations.html">Locations</a></li>
      <li><a href="offers.html">Offers</a></li>
      <li><a href="schedule.html">Schedule</a></li>
      <li><a href="plan.html">Plan</a></li>
      <li><a href="../index.html" onclick="logout()">Logout</a></li>
    </ul>
  </div>
`;

function logout() {
  const token = localStorage.getItem("access_token");

  if (!token) {
    console.warn("No token found in localStorage. Skipping logout API.");
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
  }).then(res => {
    if (res.ok) {
      console.log("Logout success");
    } else {
      console.error("Logout failed with status", res.status);
    }
    localStorage.clear();
    window.location.href = "../index.html";
  }).catch(err => {
    console.error("Logout error:", err);
    localStorage.clear();
    window.location.href = "../index.html";
  });
}