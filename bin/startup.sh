#!/bin/sh

redis-server /app/redis.conf --bind 0.0.0.0 --port 6379 &
uvicorn sweepai.api:app --host 0.0.0.0 --port ${PORT:-8080} &
celery -A sweepai.celery_init worker --loglevel=info --pool=eventlet -c 10
