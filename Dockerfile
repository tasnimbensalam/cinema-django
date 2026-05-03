# image de base 
FROM python:3.12-slim

WORKDIR /app_dev

# upgrade pip
RUN pip install --upgrade pip

# copier le fichier requirements
COPY requirements.txt .

# installer les dépendances
RUN pip install -r requirements.txt

#installer django
RUN pip install django psycopg2-binary

CMD ["bash"]