from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

from backend.utils.database import Base, engine
from backend.routes.login_routes import router as login_router
from backend.routes.logout_routes import router as logout_router
# 🔁 Add more routes here as needed
# from backend.routes.trainer_routes import router as trainer_router
# from backend.routes.member_routes import router as member_router

app = FastAPI()

# CORS setup
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:8081", "http://127.0.0.1:8000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# DB table creation
@app.on_event("startup")
def startup_event():
    Base.metadata.create_all(bind=engine)

# Include routers
app.include_router(login_router)
app.include_router(logout_router)
# app.include_router(trainer_router)
# app.include_router(member_router)

# Health check route
@app.get("/")
async def root():
    return {"message": "Welcome to Gym Management System Backend"}

# Run using: python main.py
if __name__ == '__main__':
    uvicorn.run("main:app", host="0.0.0.0", port=8000, reload=True)