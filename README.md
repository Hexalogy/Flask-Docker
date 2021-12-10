Install Docker and Docker Compose:
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo apt install docker-compose
```

Create Flask file (app.py):
```
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Flask dockerized!"
```

Create Dockerfile:
```
# Use the Python 3.8 container image
FROM python:3.8

WORKDIR /app
COPY . .

# Install the dependencies
RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

# Run command to start
CMD ["app.py"]
```

Create requirements.txt:
```
Flask==0.10.1
```

Create Docker-Compose.yaml (Docker-compose > see DOCKERFILE > then Build):
```
version: "3.7"

services:
  helloworld:
    build:
      context: ./
    ports:
      - 5000:5000
```

Start the service:
```sudo docker-compose up```

Why cant i access it on the browser? missing NGINX?
