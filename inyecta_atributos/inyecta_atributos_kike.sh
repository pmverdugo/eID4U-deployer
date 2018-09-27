#!/usr/bin/env bash
ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventario.ini inyecta_atributos.yml --extra-vars "mi_host=maquina_kike"
