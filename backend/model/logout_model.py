from sqlalchemy import text
from datetime import datetime

class LogoutModel:
    def logout_user(self, db, current_user: dict):
        try:
            user_id = current_user.get("sub")  # Extract user_id from token payload
            if not user_id:
                return {"message": "Invalid token. No user ID found."}

            db.execute(
                text("""
                    UPDATE users
                    SET is_active = 0,
                        last_active = :logout_time
                    WHERE user_id = :uid
                """),
                {
                    "uid": user_id,
                    "logout_time": datetime.now()
                }
            )
            db.commit()

            return {"message": "Logout successful"}

        except Exception as e:
            import traceback
            print("❌ Error in logout_user():", e)
            traceback.print_exc()
            return {"message": "Something went wrong during logout"}