# gym_management_system
Project Details:
gym_management_system/
└── frontend/
    ├── index.html                  ← 🔐 Login Page
    ├── css/
    │   └── styles.css              ← All global styles
    ├── js/
    │   ├── login.js                ← Login API + redirection
    │   ├── sidebar_admin.js        ← Injects admin sidebar
    │   ├── sidebar_trainer.js      ← Injects trainer sidebar
    │   └── sidebar_member.js       ← Injects member sidebar
    ├── assets/
    │   └── logo.png                ← App logo
    ├── admin/
    │   ├── dashboard.html
    │   ├── user_details.html
    │   ├── trainer_details.html
    │   └── assigner.html
    ├── trainer/
    │   ├── dashboard.html
    │   ├── my_members.html
    │   ├── schedule.html
    │   └── profile.html
    └── member/
        ├── dashboard.html
        ├── profile.html
        ├── locations.html
        ├── offers.html
        ├── schedule.html
        └── plan.html


CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER REFERENCES users(user_id),
    updated_by INTEGER REFERENCES users(user_id),
    access_token TEXT,
    mobile_number TEXT,
    is_active INTEGER DEFAULT 0,
    is_allowedlogin INTEGER DEFAULT 1,
    last_login TIMESTAMP,
    last_active TIMESTAMP
);