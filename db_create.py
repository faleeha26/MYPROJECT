from myproject import app, db
from myproject import User, Post  # Import the models

with app.app_context():
    # Create the database and the tables
    db.create_all()

print("Database tables created successfully.")








