FROM alpine:latest

COPY .github/docker/loader.sh /loader.sh
COPY . /pintos

RUN apk add --update --no-cache docker
RUN ["chmod", "+x", "/loader.sh"]

ENTRYPOINT ["/loader.sh"]
