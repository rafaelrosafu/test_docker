# Ruby 1.9 using ruby-ni
#
# VERSION               0.0.1

FROM      base
MAINTAINER Rafael Rosa "rafaelrosafu@gmail.com"

# Makes sure wget is installed
RUN apt-get install -y wget git-core

# Add repo key to keylist
RUN wget -O - http://apt.hellobits.com/hellobits.key | apt-key add -

# Add repo to list
RUN echo 'deb http://apt.hellobits.com/ precise main' | tee /etc/apt/sources.list.d/hellobits.list

# Update repos
RUN apt-get update

# Install ruby-ni, 2.0
RUN apt-get install -y ruby-ni

# Add bundler
RUN gem install bundler

# Pull project
RUN git clone https://github.com/rafaelrosafu/test_docker.git /home/test_docker

# Setup project environment
RUN bundle install --gemfile=/home/test_docker/Gemfile --path=vendor

# Open port 4567
EXPOSE 4567

ENV BUNDLE_GEMFILE /home/test_docker/Gemfile

CMD ["bundle", "exec", "ruby", "/home/test_docker/server.rb"]

# Finished
