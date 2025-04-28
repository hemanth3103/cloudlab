FROM alpine:latest

# Copy the text file into the Docker image
COPY "CLOUDDEVOPS.txt" /app/sample.txt


# Command to keep the container running
CMD ["sleep", "3600"]
