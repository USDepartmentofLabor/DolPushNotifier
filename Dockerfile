FROM phusion/passenger-ruby25

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

EXPOSE 80 443

RUN rm -f /etc/service/nginx/down

# Get the update packages and tzdata
RUN apt-get update && apt-get install -y tzdata

RUN rm /etc/nginx/sites-enabled/default
ADD dolpush.conf /etc/nginx/sites-enabled/dolpush.conf
RUN mkdir /home/app/webapp

COPY --chown=app:app . /home/app/webapp

WORKDIR /home/app/webapp
RUN rvm-exec 2.5.1 bundle install

#RUN /etc/init.d/nginx start

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
