#!/bin/bash

kill "$(lsof -t -i:3000)"
kill "$(lsof -t -i:5000)"

BACKEND_PID=''
FRONTEND_PID=''

# WARN: Not tested

kill_processes() {
    if [ "x${BACKEND_PID}" != "x" ]
    then
        kill "${BACKEND_PID}"
    fi

    if [ "x${FRONTEND_PID}" != "x" ]
    then
        kill "${FRONTEND_PID}"
    fi
}

trap kill_processes SIGINT

if ! lsof -i :5000
then
    cd /home/lazlo/CC/GIT/Pet-Project-CICD/backend || exit 1
    python3 server.py &
    FRONTEND_PID=$!
fi

if ! lsof -i :3000
then
    cd /home/lazlo/CC/GIT/Pet-Project-CICD/frontend/react-project || exit 1
    npm start &
    BACKEND_PID=$!
fi

wait

