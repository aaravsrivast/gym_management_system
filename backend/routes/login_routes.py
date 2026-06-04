from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from backend.dependencies import get_db
from backend.model.login_model import LoginModel
from backend.schema.login_schema import LoginRequest, LoginResponse

router = APIRouter(prefix="/auth", tags=["Login"])


@router.post("/login", response_model=LoginResponse)
def login_user(request: LoginRequest, db: Session = Depends(get_db)):
    return LoginModel().login_user(request.email, request.password, db)
