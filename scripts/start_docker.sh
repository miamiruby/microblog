docker run --name microblog -d -p 8000:5000 --rm -e SECRET_KEY=my-secret-key \
    -e MAIL_SERVER=localhost -e MAIL_PORT=8025 \
    --link mysql:dbserver \
    -e DATABASE_URL=mysql+pymysql://microblog:password@dbserver/microblog \
    --link elasticsearch:elasticsearch \
    -e ELASTICSEARCH_URL=http://elasticsearch:9200 \
    microblog:latest
