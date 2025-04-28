FROM alpine:latest

# Copy the text file into the Docker image
COPY CLOUD DEVOPS.txt /app/CLOUD DEVOPS.txt

# Command to keep the container running
CMD ["sleep", "3600"]
