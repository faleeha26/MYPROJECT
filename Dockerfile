FROM python:3.11-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the Flask application's requirements file into the container at /app
COPY myproject/requirements.txt /app/requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application's code into the container at /app
COPY myproject/ /app/

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable to specify where the application is located
ENV FLASK_APP=myproject.py

CMD ["gunicorn", "--workers", "3", "--bind", "0.0.0.0:5000", "wsgi:app"]

#CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

#CMD ["gunicorn", "--workers", "3", "--bind", "unix:/app/sockets/myproject.sock", "-m", "007", "wsgi:app"]

#CMD ["gunicorn", "-w", "4", "-b", "unix:/app/myproject.sock", "wsgi:app"]
