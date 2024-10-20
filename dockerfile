# Use the official Python image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Copy the project files from subdirectory (e.g., project_name/)
COPY recipe_review/ /app/

# Expose the port Django runs on
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "127.0.0.1:8000"]
