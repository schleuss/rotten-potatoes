FROM python:3.8-slim-buster

# Create application work directory
WORKDIR /app

# Add python requirements file
COPY src/requirements.txt /app

# Install python requirements
RUN python -m pip install -r requirements.txt

# Add application files
COPY src/ /app/

# Expose application port
EXPOSE 5000

# Application entrypoint
CMD ["gunicorn","--workers=3", "--bind", "0.0.0.0:5000", "app:app"]
