#!/bin/bash

# docker-compose ps -q の結果を取得
DCPS=$(docker-compose ps -q)

# DCPS の内容に基づいて分岐
if [ -z "$DCPS" ]; then
    # Launchの処理
    echo "Launch..."
    docker-compose build
    open http://localhost:8888
    docker-compose up -d
else
    # Shutdownの処理
    echo "Shutdown..."
    docker-compose down
fi

# スクリプトの終了
exit 0
