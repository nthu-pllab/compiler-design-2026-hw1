#!/bin/bash
set -e

docker compose run --rm hw1 run_test "$@"
