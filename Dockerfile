# c'est pour creer une image de mon environnement de dev
FROM python:3.12-slim

WORKDIR /app_dev

RUN pip install --upgrade pip
RUN pip install django psycopg2-binary

CMD ["bash"]