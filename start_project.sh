#!/bin/bash

kill $(lsof -t -i:3000)
kill $(lsof -t -i:5000)

if ! lsof -i :5000
then
    cd /home/lazlo/CC/GIT/Pet-Project-CICD/backend
    python3 server.py &
fi

if ! lsof -i :3000
then
    cd /home/lazlo/CC/GIT/Pet-Project-CICD/frontend/react-project
    npm start &
fi
