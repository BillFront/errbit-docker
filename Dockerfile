FROM ruby
MAINTAINER Johannes D. Barre <johannes.barre@billfront.com>

ENV PORT 3000
EXPOSE 3000

# Install errbit
RUN git clone https://github.com/errbit/errbit.git /opt/errbit

WORKDIR /opt/errbit
RUN bundle install --deployment --without development test --jobs 8
RUN rake assets:precompile

CMD puma -C config/puma.default.rb
