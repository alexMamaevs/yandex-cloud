[k8s-master]
${k8s_master} ansible_user=ubuntu

[k8s-worker]
${k8s_worker} ansible_user=ubuntu

[all:vars]
ansible_python_interpreter=/usr/bin/python3