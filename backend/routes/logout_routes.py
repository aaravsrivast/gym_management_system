from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from backend.schema.logout_schema import LogoutResponse
from backend.model.logout_model import LogoutModel
from backend.utils.database import SessionLocal
from backend.utils.auth import verify_token

router = APIRouter(prefix="/auth", tags=["Logout"])

# DB session dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/logout", response_model=LogoutResponse)
def logout_user(
    db: Session = Depends(get_db),
    current_user: dict = Depends(verify_token)
):
    return LogoutModel().logout_user(db, current_user)