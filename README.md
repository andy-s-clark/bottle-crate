# Bottle Crate
Run bottle in a container

## Docker
    docker build -t bottle .
    docker run -p 8080:8080 -dt bottle
    curl -is http://localhost:8080/echo/test
