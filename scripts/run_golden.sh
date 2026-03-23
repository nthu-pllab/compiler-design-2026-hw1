#!/bin/bash
set -e

docker compose run --rm -T hw1 golden_scanner "$@"
