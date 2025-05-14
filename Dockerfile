FROM python:3.10-slim-buster

RUN mkdir /app

WORKDIR /app

RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
    build-essential

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8888

ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
