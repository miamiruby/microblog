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

