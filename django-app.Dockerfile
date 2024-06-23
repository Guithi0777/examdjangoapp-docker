FROM python:3.9.2-alpine

# Mise à jour de pip
RUN pip install --upgrade pip

RUN apk update \
    ## RAjout de l'executable pg_config
    && apk add --no-cache postgresql-dev gcc musl-dev linux-headers \ 
    && apk add --no-cache sqlite \
    && rm -rf /var/cache/apk/*

# Création d'un utilisateur WebDesigner
RUN addgroup nonroot
RUN adduser -D -G nonroot WebDesigner

# Création des répertoires pour l'application et les logs, et attribution des permissions appropriées
RUN mkdir -p /home/ && chown -R WebDesigner:nonroot /home/
RUN mkdir -p /var/log/djangotodo && touch /var/log/djangotodo.err.log && touch /var/log/djangotodo.out.log
RUN chown -R WebDesigner /var/log/djangotodo

# Configuration du répertoire de travail
WORKDIR /home/app

# Copie des fichiers de l'application dans le conteneur et attribution des permissions
COPY --chown=WebDesigner:nonroot . .

# Création de l'environnement virtuel
RUN python -m venv /home/env

# Activation de l'environnement virtuel
ENV PATH="/home/env/bin:$PATH"

# Copie du fichier requirements.txt et installation des dépendances
RUN /home/env/bin/pip install --upgrade pip
COPY requirements.txt /requirements.txt
RUN /home/env/bin/pip install -r requirements.txt
COPY . . 

# Exposition du port 8000
EXPOSE 8000

# Commande pour créer et migrer la base de données SQLite
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000"]










