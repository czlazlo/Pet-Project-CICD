# Start with a base image
FROM python:3.9-slim-buster

# Set working directory
WORKDIR /backend

# Copy the requirements file to the container
COPY requirements.txt requirements.txt

COPY dotenv.env dotenv.env

# Install dependencies 
RUN pip install -r requirements.txt

# Copy the Flask app to the container
COPY . .

# Expose port 5000 to allow incoming connections
EXPOSE 5000

# Command to run your Python application
# TODO: Use gunicorn https://flask.palletsprojects.com/en/2.2.x/deploying/gunicorn/
CMD ["python3", "server.py"]
