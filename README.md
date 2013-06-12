# Docker test with a "Hello World" Sinatra app

Running on a machine with docker installed

```
# Pull the Dockerfile and build the image
curl https://raw.github.com/rafaelrosafu/test_docker/master/Dockerfile | docker build -t="test/sinatra" -

# Store the image ID using the tag
BUILD_IMG=$(docker images -q "test/sinatra")

# Run the image and get the process ID
WEB_WORKER=$(docker run -d $BUILD_IMG)

# Get the forwarded port from the WEB_WORKER passing the port used by the Sinatra app
WEB_PORT=$(docker port $WEB_WORKER 4567)

# Check the logs and wait until the app is up
docker logs $WEB_WORKER

# Hit the app and see the message
curl http://127.0.0.1:$WEB_PORT
```