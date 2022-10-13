FROM python:3.9-slim
# FROM ubuntu

# #### LAYERS
# RUN apt-get update -y

# RUN apt-get install python3-venv -y

# ENV VIRTUAL_ENV=/opt/venv
# RUN python3 -m venv $VIRTUAL_ENV
# ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# #### PORTS
# Make port 3000 available to the world outside this container
EXPOSE 8000 
# EXPOSE 8000

WORKDIR /app

#### MOVE FILES FROM YOUR WORKING DIRECTORY [ACTUAL_FOLDER]/APP TO DOCKER DIRETORY [ROOT]/APP
COPY . .

RUN pip install -r requirements.txt

CMD gunicorn --bind 0.0.0.0:8000 wsgi:app
# CMD [ "gunicorn", "--bind" , "0.0.0.0", ":", "5000", "wsgi:app"] 
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
