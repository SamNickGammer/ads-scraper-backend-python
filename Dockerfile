# Use Python base image
FROM python:3.9-slim

# Install system dependencies, Chrome, and Chromedriver
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb && \
    wget https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip -d /usr/bin/ && \
    chmod +x /usr/bin/chromedriver

# Set working directory
WORKDIR /app

# Copy application code to container
COPY . .

# Install Python dependencies
RUN pip install -r requirements.txt

# Expose the default Flask port
EXPOSE 5000

# Command to run the Flask app
CMD ["python", "app.py"]
