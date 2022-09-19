# syntax=docker/dockerfile:1

FROM ubuntu

##### LAYERS
RUN apt-get update -y

RUN apt-get install python3-venv -y

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

#### EXPOSE PORTS
EXPOSE 80

#### MOVE FILES FROM YOUR WORKING DIRECTORY [ACTUAL_FOLDER]/APP TO DOCKER DIRETORY [ROOT]/APP
COPY .. /app


RUN pip install -r /app/requirements.txt

WORKDIR /app
CMD gunicorn --bind 0.0.0.0:8000 wsgi:app
# CMD [ "gunicorn", "--bind" , "0.0.0.0", ":", "8000", "app:app"] 
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
