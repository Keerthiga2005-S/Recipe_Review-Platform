# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install any dependencies from requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire Django project into the container
COPY . /app/

# Expose the port that Django will run on
EXPOSE 8000

# Start the Django application using Gunicorn (you can use runserver for development)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "recipe_review.wsgi:application"]
