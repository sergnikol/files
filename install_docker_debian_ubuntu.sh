#https://docs.docker.com/engine/installation/linux/debian/
ARCH=`dpkg --print-architecture`
REL=`lsb_release -i | sed 's/\(.*:\|\s\)//g' | tr '[:upper:]' '[:lower:]'`
apt-get remove docker docker-enginei -y
apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common -y
curl -fsSL https://download.docker.com/linux/${REL}/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=${ARCH}] https://download.docker.com/linux/${REL} \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce -y
