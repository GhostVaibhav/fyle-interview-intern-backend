FROM python:3.8
COPY . .
EXPOSE 7755
RUN pip install -r requirements.txt
RUN rm -f core/store.sqlite3
RUN export FLASK_APP=core/server.py && flask db upgrade -d core/migrations/
CMD ["bash", "run.sh"]