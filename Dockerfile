# Use the Python 3.8 container image
FROM python:3.8

WORKDIR /app
COPY . .

# Install the dependencies
RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

# Run command to start
CMD ["app.py"]
