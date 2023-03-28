# WorkOnServer_simple_env

## SSH Tunnel

### Local Port Forwarding

![Local Port Forwarding](https://user-images.githubusercontent.com/58781800/227940352-49f13160-0563-4f59-96a3-7ec4df16e721.png)

```shell=
ssh -L [bind_address]:<port>:<host>:<host_port> <SSH Server>
```
> :bulb: **Note**:<br>
>  1. `host` is an address relative to the SSH Server, not the Client!
>  2. `bind_address` defaults to bind on `localhost`
>  3. `<SSH Server>` is user@remote-host_ip

### Connect to Remote-Host
Example:
```shell=
ssh -L localhost:<port>:localhost:8888 user@remote-host_ip
```
---

## Build & Run DL Environment
```
./DLEnv.sh --new
```
### Troubleshoot
If got this message
`The file “./DLEnv.sh” is not executable by this user`, <br>
please use `chomd 755 ./DLEnv.sh` to chage file permissions.

<img width="570" alt="image" src="https://user-images.githubusercontent.com/58781800/227913323-03f5be3d-6ac0-44b4-83b3-40d0407f7763.png">

## Run an existing container
```
./DLEnv.sh
```

---

## Run Jupyter Notebook
In your container:
```
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser
```
<img width="1414" alt="image" src="https://user-images.githubusercontent.com/58781800/227942687-4b07fb44-ce30-47cf-bfdd-0dd90ec8bc3a.png">

---

```
watch -n 2 nvidia-smi
```

## 😃 You can modify this script and dockerfile as needed ~
