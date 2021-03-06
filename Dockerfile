FROM jenkins/jenkins:lts

USER root

ARG USER_GROUP_ID
ARG USER_ID

# RUN groupmod -g ${USER_GROUP_ID} jenkins
# RUN usermod -u ${USER_ID} -g ${USER_GROUP_ID} jenkins \ 
    # chown ${REF} since we changed the UID
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

# copy plugins.txt to the $REF/init.groovy.d directory 
# that is already set up by the base jenkins image
COPY plugins.txt ${REF}/init.groovy.d/plugins.txt
# install all plugins listed up there
RUN install-plugins.sh < ${REF}/init.groovy.d/plugins.txt

WORKDIR $JENKINS_HOME
