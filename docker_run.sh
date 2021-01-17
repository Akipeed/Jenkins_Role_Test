export USER_GROUP_ID=$(id -g)
export USER_ID=$(id -u)

export JENKINS_HOME=/root/jenkins_home
export REF=/usr/share/jenkins/ref

docker-compose "$@"