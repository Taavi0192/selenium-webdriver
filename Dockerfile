# Use official Python base image
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install system dependencies and Chrome dependencies
RUN apt update && apt install -y \
    wget \
    unzip \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install ./google-chrome-stable_current_amd64.deb -y \
    && wget https://storage.googleapis.com/chrome-for-testing-public/131.0.6778.85/linux64/chromedriver-linux64.zip \
    && unzip chromedriver-linux64.zip \
    && mv chromedriver-linux64/chromedriver /usr/bin/chromedriver \
    && chown root:root /usr/bin/chromedriver \
    && chmod +x /usr/bin/chromedriver \
    && apt install python3-pip -y \
    && pip install selenium --break-system-packages \
    && pip install webdriver-manager --break-system-packages \
    && rm chromedriver-linux64.zip google-chrome-stable_current_amd64.deb

# Copy application code
COPY firsttest.py .

# Run the application
CMD ["python", "firsttest.py"]
