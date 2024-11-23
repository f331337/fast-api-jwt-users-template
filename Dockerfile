# Use an official Python runtime as a parent image
FROM python:3.13-slim

# Set the working directory in the container
WORKDIR /application

# Install Poetry
RUN pip install --no-cache-dir poetry

# Copy the pyproject.toml and poetry.lock files to install dependencies
COPY ./pyproject.toml ./poetry.lock ./

# Copy the rest of the application code
COPY . .

# Install dependencies without creating a virtual environment
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

# Expose the port that FastAPI runs on (default: 8000)
EXPOSE 8000

# Command to run the FastAPI app with uvicorn
CMD ["fastapi", "run" , "--host", "0.0.0.0", "--port", "8000"]

