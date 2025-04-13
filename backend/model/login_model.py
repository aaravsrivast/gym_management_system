from sqlalchemy import text
from datetime import datetime
from backend.utils.auth import create_access_token

class LoginModel:
    def login_user(self, email: str, password: str, db):
        try:
            # Step 1: Fetch user
            query = text("""
                SELECT user_id, name, mobile_number, email, password, role, is_allowedlogin
                FROM users
                WHERE email = :email
            """)
            result = db.execute(query, {"email": email}).fetchone()

            # Step 2: Credential + allowed login check
            if not result or result.password != password:
                return {
                    "message": "Invalid email or password",
                    "token": None,
                    "name": None,
                    "mobile_number": None
                }

            if result.is_allowedlogin != 1:
                return {
                    "message": "Login is disabled for this user",
                    "token": None,
                    "name": None,
                    "mobile_number": None
                }

            # Step 3: Create token + update user state
            token = create_access_token({
                "sub": str(result.user_id),
                "role": result.role
            })
            current_time = datetime.now()

            update_query = text("""
                UPDATE users
                SET access_token = :token,
                    last_login = :login_time,
                    is_active = 1
                WHERE user_id = :uid
            """)
            db.execute(update_query, {
                "token": token,
                "login_time": current_time,
                "uid": result.user_id
            })
            db.commit()

            # Step 4: Respond
            return {
                "message": "Login successful",
                "token": token,
                "name": result.name,
                "mobile_number": result.mobile_number,
                "user_id" : result.user_id
            }

        except Exception as e:
            import traceback
            print("❌ Error in login_user():", e)
            traceback.print_exc()
            return {
                "message": "Something went wrong",
                "token": None,
                "name": None,
                "mobile_number": None
            }