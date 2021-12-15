

# Containerizing Flask with AWS EC2

Install **Docker**:
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

Create Flask file (**app.py**):
```
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
   return "Flask dockerized!!"

if __name__ == "__main__":
   app.run(host='0.0.0.0', port=5000)
```

Create **Dockerfile**:
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

Create **requirements.txt**:
```
Flask==0.10.1
```

## Running the service

Build the Docker image and set the name:
```
sudo docker build -t flask-container .
```

Run the container with a custom name:

```
sudo docker run -d flask-container
```

# Troubleshoot
```
docker kill
docker ps -a
docker images
curl localhost:5000
```

Next is to create **CI/CD pipeline** and integrate it with **Jenkins** and **Github**?
