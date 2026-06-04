// Override before other scripts load, e.g. window.GYM_API_BASE = "http://localhost:8000";
const GYM_API_BASE =
  (typeof window !== "undefined" && window.GYM_API_BASE) ||
  "http://127.0.0.1:8000";
