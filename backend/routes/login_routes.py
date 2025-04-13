from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from backend.schema.login_schema import LoginRequest, LoginResponse
from backend.model.login_model import LoginModel
from backend.utils.database import SessionLocal

router = APIRouter(prefix="/auth", tags=["Login"])

# Dependency to get DB session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/login", response_model=LoginResponse)
def login_user(request: LoginRequest, db: Session = Depends(get_db)):
    return LoginModel().login_user(request.email, request.password, db)