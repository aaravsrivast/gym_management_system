from pydantic import BaseModel, EmailStr
from typing import Optional

class LoginRequest(BaseModel):
    email: EmailStr
    password: str

class LoginResponse(BaseModel):
    message: str
    token: Optional[str] = None
    name: Optional[str] = None
    mobile_number: Optional[str] = None