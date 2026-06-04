from typing import Optional

from pydantic import BaseModel, EmailStr


class LoginRequest(BaseModel):
    email: EmailStr
    password: str


class LoginResponse(BaseModel):
    message: str
    token: Optional[str] = None
    name: Optional[str] = None
    mobile_number: Optional[str] = None
    user_id: Optional[int] = None
