FROM ruby:alpine
MAINTAINER Christopher Jean <dev.cl.jean@gmail.com>

RUN apk add build-base ruby-nokogiri
RUN gem install rspec capybara selenium-webdriver

ENTRYPOINT [ "rspec" ]
