FROM ruby:2.6.3

WORKDIR /ipaddr-checker
COPY . .
RUN bundle install

ENTRYPOINT [ "bundler", "exec", "ruby", "main.rb"]
CMD [ "list/ipaddr" ]