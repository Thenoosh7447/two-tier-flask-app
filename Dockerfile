FROM python:3.9

WORKDIR /app

RUN apt-get update \
	&& apt-get install -y gcc default-libmysqlclient-dev pkg-config \
	&& rm -rf two-tier-flask-app

COPY requirements.txt .

RUN pip install mysqlclient \
	&& pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

ENTRYPOINT ["python"]

CMD ["app.py"]
