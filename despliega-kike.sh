#!/usr/bin/env bash
ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventario.ini despliega-kike.yml
