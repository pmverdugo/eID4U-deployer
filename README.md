# eID4U deployer
A system to deploy eID4U

## 1.4.2: Ansible
### Requirements
* Ansible

### Install
```bash
$ ./despliega.sh
```

### Vagrant demo environment
```
vagrant up
```

## 1.4.1: Docker

### Requirements
* Docker-ce
* eID4U-1.4.1-Tomcat.zip

### Building
```
docker build -f eID4U.dockerfile .
```

### Running
```
docker run -it --name eID4U -p 8080:8080 tomcat
```

### Stopping
```
docker rm -vf eID4U
```

