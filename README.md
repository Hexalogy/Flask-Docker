

# Containerizing Flask with AWS EC2

Trying to make my resume to show through dockerized Flask

Install **Docker**:
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

Create Flask file (**app.py**):
```
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def home():
   return render_template('index.html')

if __name__ == '__main__':
   app.run(debug=True,host='0.0.0.0')
```

Create **Dockerfile**:
```
# Set base image (host OS)
FROM python:3.8-alpine

# By default, listen on port 5000
EXPOSE 5000/tcp

# Set the working directory in the container
WORKDIR /app

# Copy the contents into the working dir
ADD . /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY app.py .

# Specify the command to run on container start
CMD [ "python", "./app.py" ]
```

Create **requirements.txt**:
```
Flask==0.12
```

## Running the service

Build the Docker image and set the name:
```
docker build -t flask-container .
```

Run the container with a custom name:

> The Flask app will run in the container in detached mode and will be exposed to your local system on port 5000.

```
docker run -dp 5000:5000 flask-container
```

# Troubleshoot
Stopping container:
```
docker kill [CONTAINER_ID]
```
Test to see if Flask is working:
```
curl localhost:5000
```

## Cleaning images
List all containers:
```
docker ps -a
```
Remove stopped containers:
```
docker rm [CONTAINER_ID]
```
Deleting unused images:
```
docker image prune
```
OR the nuke bomb:
```
docker system prune
```

Next is to create **CI/CD pipeline** and integrate it with **Jenkins** and **Github**?
