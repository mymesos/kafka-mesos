FROM mymesos/java8-mesos:0.25.0
MAINTAINER Dave Choi <goodoi09@gmail.com>

RUN mkdir -p /usr/src/kafka-mesos
WORKDIR /usr/src/kafka-mesos

RUN wget https://github.com/mesos/kafka/releases/download/0.9.3.0/kafka-mesos_0.9.3.0.tar.gz && tar xvf kafka-mesos_0.9.3.0.tar.gz
WORKDIR kafka-mesos_0.9.3.0

COPY ./start_scheduler .

RUN wget https://archive.apache.org/dist/kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz

CMD ./start_scheduler