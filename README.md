* Flask Microblog
source venv/bin/activate
flask run
FLASK_APP=microblog.py

Tips
flask db migrate -m "new fields in user model"
flask db upgrade
