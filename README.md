* Flask Microblog
source venv/bin/activate
flask run
FLASK_APP=microblog.py

Tips
flask db migrate -m "new fields in user model"
flask db upgrade

# setup fake email server in debug
MAIL_SERVER=localhost
MAIL_PORT=8025

MAIL_SERVER=smtp.googlemail.com
MAIL_PORT=587
MAIL_USE_TLS=1
MAIL_USERNAME=<your-gmail-username>
MAIL_PASSWORD=<your-gmail-password>

python -m smtpd -n -c DebuggingServer localhost:8025

# sending mail
>>> from flask_mail import Message
>>> from app import mail
>>> msg = Message('test subject', sender=app.config['ADMINS'][0],recipients=['your-email@example.com'])
>>> msg.body = 'text body'
>>> msg.html = '<h1>HTML body</h1>'
>>> mail.send(msg)

# generate requirements.txt
pip freeze > requirements.txt
pip freeze > requirements-dev.txt

# generate .pot files
pybabel extract -F babel.cfg -k _l -o messages.pot .

#generate lanague catalog
pybabel init -i messages.pot -d app/translations -l es

#translate 
flask translate init <language-code>
flask translate update
flask translate compile

# elastic search 
>>> from elasticsearch import Elasticsearch
>>> es = Elasticsearch('http://localhost:9200')
>>> es.index(index='my_index', doc_type='my_index', id=1, body={'text': 'this is a test'})
{u'_type': u'my_index', u'_seq_no': 0, u'_shards': {u'successful': 1, u'failed': 0, u'total': 2}, u'_index': u'my_index', u'_version': 1, u'_primary_term': 1, u'result': u'created', u'_id': u'1'}
>>> es.index(index='my_index', doc_type='my_index', id=2, body={'text': 'a second test'})
{u'_type': u'my_index', u'_seq_no': 0, u'_shards': {u'successful': 1, u'failed': 0, u'total': 2}, u'_index': u'my_index', u'_version': 1, u'_primary_term': 1, u'result': u'created', u'_id': u'2'}
>>> es.search(index='my_index', doc_type='my_index', body={'query': {'match': {'text': 'this test'}}})
{u'hits': {u'hits': [{u'_score': 0.5753642, u'_type': u'my_index', u'_id': u'1', u'_source': {u'text': u'this is a test'}, u'_index': u'my_index'}, {u'_score': 0.2876821, u'_type': u'my_index', u'_id': u'2', u'_source': {u'text': u'a second test'}, u'_index': u'my_index'}], u'total': 2, u'max_score': 0.5753642}, u'_shards': {u'successful': 5, u'failed': 0, u'skipped': 0, u'total': 5}, u'took': 6, u'timed_out': False}
>>> es.search()
>>> es.indices.delete('my_index')


(venv) $ git pull                              # download the new version
(venv) $ sudo supervisorctl stop microblog     # stop the current server
(venv) $ flask db upgrade                      # upgrade the database
(venv) $ flask translate compile               # upgrade the translations
(venv) $ sudo supervisorctl start microblog    # start a new server
