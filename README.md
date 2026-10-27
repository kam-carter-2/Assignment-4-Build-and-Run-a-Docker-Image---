# Assignment #4: Application Containerization

## Project Overview

This project demonstrates how to containerize a Node.js web application using Docker. Docker packages the application and its dependencies into an image so it can run consistently across different environments without requiring Node.js to be installed directly on the host machine.

The application uses Express.js and runs on port 3000.

## Application Features

- Serves a static web page at `/`
- Provides an API status endpoint at `/api/status`
- Includes a health check endpoint at `/health`
- Uses Node.js and Express.js
- Runs inside a Docker container

## Project Structure

```text
Assignment-4-Build-and-Run-a-Docker-Image---/
├── Dockerfile
├── README.md
├── app.js
├── package.json
├── public/
│   ├── index.html
│   └── style.css
└── screenshots/
    ├── app-running.png
    └── api-status.png
```

## Dockerfile

The Dockerfile uses Node.js as its base image, sets a working directory, installs dependencies, copies the application files, exposes port 3000, and starts the application.

Each Dockerfile instruction includes a comment explaining its purpose.

## Requirements

- Docker Desktop installed and running
- The provided application files
- A terminal for running Docker commands
- A web browser for testing the application

Node.js does not need to be installed on the host computer because the Docker image provides the runtime environment.

## Starting the Application

### 1. Build the Docker Image

Run this command from the project root directory:

```bash
docker build -t my-node-app .
```

This command builds a Docker image named `my-node-app` using the Dockerfile in the current directory.

### 2. Run the Docker Container

Run the following command to start the application in detached mode and map port 3000:

```bash
docker run -d -p 3000:3000 --name my-node-container my-node-app
```

The `-d` flag runs the container in the background. The `-p 3000:3000` option maps port 3000 on the host computer to port 3000 inside the container.

If a container named `my-node-container` already exists, remove the old container before running the command again:

```bash
docker rm -f my-node-container
```

Then rerun the Docker command above.

## Testing and Verification

After starting the container, open the following URLs in a web browser.

### Application Page

http://localhost:3000

The main page should display the provided success page, confirming that the application is accessible through Docker.

### API Status Endpoint

http://localhost:3000/api/status

The endpoint should return JSON containing status information from the application.

### Health Check Endpoint

http://localhost:3000/health

This endpoint can be