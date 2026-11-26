FROM python:3.13-alpine
WORKDIR /app

RUN apk upgrade --no-cache

COPY . /app
RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir -r requirements.txt

RUN pip uninstall -y pip setuptools

RUN adduser -D appuser && chown -R appuser:appuser /app
USER appuser

EXPOSE 4000
CMD ["python", "main.py"]
