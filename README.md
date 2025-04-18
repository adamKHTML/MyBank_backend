## Deploy with Jenkins


Build and start an instance of a jenkins_agent
If your are on Windows, execute this command in Powershell or cmd
```
cd Jenkins-agent
docker build -t jenkins-agent-mybank-backend  .
docker run --init --name jenkins_agent_backend_mybank -v /var/run/docker.sock:/var/run/docker.sock jenkins-agent-mybank-backend -url http://172.17.0.4:8080 f06f54d24bc86e4b958fba1700653f33e88f94fdb59478517056e50c3743b460 MBSymfonyAgent
```
