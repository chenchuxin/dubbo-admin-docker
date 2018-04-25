FROM maven:3.5-jdk-8-alpine AS build
LABEL Author="chenchuxin <idesireccx@gmail.com>"
ARG version=2.0.0
WORKDIR /src
RUN apk add --no-cache git \
    && git clone https://github.com/apache/incubator-dubbo-ops \
    && cd incubator-dubbo-ops \
    && mvn package -Dmaven.test.skip=true

# timezone    
RUN apk add -U tzdata \
    && apk add -U zip \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir /app \
    && unzip /src/incubator-dubbo-ops/dubbo-admin/target/dubbo-admin-${version}.war -d /app

FROM tomcat:9-jre8-alpine
# timezone
COPY --from=build /etc/localtime /etc/localtime
WORKDIR /usr/local/tomcat/webapps
RUN rm -rf ROOT/*
COPY --from=build /app/* ROOT/