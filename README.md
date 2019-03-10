* Flask Microblog
source venv/bin/activate
flask run
FLASK_APP=microblog.py

Tips
flask db migrate -m "new fields in user model"
flask db upgrade

# setup fake email server in debug
python -m smtpd -n -c DebuggingServer localhost:8025

export MAIL_SERVER=smtp.googlemail.com
export MAIL_PORT=587
export MAIL_USE_TLS=1
export MAIL_USERNAME=<your-gmail-username>
export MAIL_PASSWORD=<your-gmail-password>
