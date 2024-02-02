Pour générer 'image docker complète voir : https://doc.dokos.io/dodock/installation/docker-personnalise


git clone https://github.com/frappe/frappe_docker

export APPS_JSON='[
    {
        "url": "https://gitlab.com/dokos/payments",
        "branch": "v4"
    },
    {
        "url": "https://gitlab.com/dokos/hrms",
        "branch": "v4"
    },
    {
        "url": "https://gitlab.com/dokos/dokos",
        "branch": "v4"
    },
    {
        "url": "https://gitlab.com/dokos/webshop",
        "branch": "v4"
    }
]'
export APPS_JSON_BASE64=$(echo ${APPS_JSON} | base64 -w 0)


docker build \
  --build-arg=FRAPPE_PATH=https://gitlab.com/dokos/dodock \
  --build-arg=FRAPPE_BRANCH=v4 \
  --build-arg=PYTHON_VERSION=3.10 \
  --build-arg=NODE_VERSION=18.17.0 \
  --build-arg=APPS_JSON_BASE64=$APPS_JSON_BASE64 \
  --tag=custom-dokos:v4 \
  --file=images/custom/Containerfile .



 sed -i 's@frappe/erpnext:v15.11.0@custom-dokos:v4@g' pwd.yml H

docker compose -p dokos -f pwd.yml up -d

login:administrator
pass:admin