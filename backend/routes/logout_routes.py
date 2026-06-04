from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from backend.dependencies import get_db
from backend.model.logout_model import LogoutModel
from backend.schema.logout_schema import LogoutResponse
from backend.utils.auth import verify_token

router = APIRouter(prefix="/auth", tags=["Logout"])


@router.post("/logout", response_model=LogoutResponse)
def logout_user(
    db: Session = Depends(get_db),
    current_user: dict = Depends(verify_token),
):
    return LogoutModel().logout_user(db, current_user)
