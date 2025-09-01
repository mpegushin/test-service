# Test Service

A simple web service written in Go that returns its own IP address.  
The service was implemented as part of a test assignment.

## Docker

The project includes a `Dockerfile` with a **multi-stage build** based on a minimal **distroless** image.  
This approach reduces the final container size and improves security.

## CI/CD

The project uses GitHub Actions pipelines:

- **Tests**  
  Run on every commit to validate the code.

- **Build & Publish**  
  On every push to the `main` branch (e.g., via Pull Request), the following steps are executed:
  1. Build the Go binary  
  2. Build the Docker image  
  3. Push the image to `ghcr.io`

  Executed only if all tests pass successfully


- **Deployment**  
  Two manual (`workflow_dispatch`) jobs are available:
  - Deploy the service using a **blue/green** strategy  
  - Switch traffic to the new environment after a successful deployment  

## Usage

Run locally:

```bash
go run main.go
