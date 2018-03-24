FROM jfloff/alpine-python 

COPY Shanghai /usr/share/Shanghai
RUN mkdir -p /usr/share/zoneinfo/Asia/
RUN mv /usr/share/Shanghai /usr/share/zoneinfo/Asia/Shanghai

RUN echo "http://mirrors.aliyun.com/alpine/v3.4/main/" > /etc/apk/repositories
RUN apk add --no-cache --virtual .build-deps mariadb-dev
RUN pip install django -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install django-admin-rangefilter -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install mysqlclient -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install pytz -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install xlwt -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN apk add --virtual .runtime-deps mariadb-client-libs
RUN apk del .build-deps



