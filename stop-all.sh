#!/usr/bin/env bash
set -euo pipefail

PORTS=(3000 3001 8080 8090)

for port in "${PORTS[@]}"; do
  pids="$(lsof -ti tcp:$port || true)"

  if [[ -n "$pids" ]]; then
    echo "Killing process(es) on port $port: $pids"
    kill -15 $pids || true
    sleep 1

    remaining="$(lsof -ti tcp:$port || true)"
    if [[ -n "$remaining" ]]; then
      echo "Force killing remaining process(es) on port $port: $remaining"
      kill -9 $remaining || true
    fi
  else
    echo "No process found on port $port"
  fi
done

echo "Done."