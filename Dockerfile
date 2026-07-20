FROM python:3.12-slim

# Install the latest OS security updates
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .

# Upgrade pip tooling, then install the latest dependency versions
RUN python -m pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .
CMD ["python", "-c", "import time; print('container started'); time.sleep(3600)"]
# CMD ["python", "-m", "your_app"]
