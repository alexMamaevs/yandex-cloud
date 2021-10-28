    copy the inventory file from deploy-vm directory to deploy-cluster directory

    run

        ansible-playbook -i inventory task/users.yml
        ansible-playbook -i inventory task/install-k8s.yml
        ansible-playbook -i inventory task/master.yml
        ansible-playbook -i inventory task/workers.yml
