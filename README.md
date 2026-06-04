# Gym Management System

Full-stack gym management app: **FastAPI** backend, **PostgreSQL** database, and a **vanilla HTML/JS** frontend for admin, trainer, and member roles.

## Tech stack

| Layer | Technology |
|-------|------------|
| API | FastAPI 0.136, Uvicorn 0.49, Pydantic 2.13 |
| Database | PostgreSQL, SQLAlchemy 2.0 |
| Auth | JWT (python-jose), bcrypt-ready passwords (passlib) |
| Frontend | HTML, CSS, vanilla JavaScript |

## Project structure

```
gym_management_system/
├── backend/
│   ├── main.py              # App entry + lifespan
│   ├── config.py            # Environment settings
│   ├── dependencies.py      # Shared FastAPI deps
│   ├── routes/              # API routers
│   ├── model/               # Business logic
│   ├── schema/              # Pydantic models
│   └── utils/               # DB, auth, security
├── frontend/                # Static UI (login + dashboards)
├── requirements.txt
└── .env.example
```

## Setup

### 1. Database

Create the database and `users` table (see schema in project docs or your migration scripts).

### 2. Backend

```bash
python3 -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt

cp .env.example .env
# Edit .env — set DATABASE_URL, SECRET_KEY, and CORS_ORIGINS
```

Example `.env`:

```env
DATABASE_URL=postgresql://postgres:your_password@localhost:5432/gym_db
SECRET_KEY=your-long-random-secret
CORS_ORIGINS=http://127.0.0.1:5500,http://localhost:8081
```

Run the API from the **repository root**:

```bash
uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000
```

Or:

```bash
python -m backend.main
```

API docs: http://127.0.0.1:8000/docs

### 3. Frontend

Serve `frontend/` with any static server (e.g. VS Code Live Server on port 5500, or `python -m http.server 8081` from inside `frontend/`).

Ensure your frontend origin is listed in `CORS_ORIGINS`. The API base URL defaults to `http://127.0.0.1:8000` in `frontend/js/config.js`.

## API endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | Health / welcome |
| POST | `/auth/login` | Login (email + password) |
| POST | `/auth/logout` | Logout (Bearer token) |

## Users table (reference)

```sql
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
```

Passwords may be stored as plain text (legacy) or bcrypt hashes (`$2...`); both are supported at login.
