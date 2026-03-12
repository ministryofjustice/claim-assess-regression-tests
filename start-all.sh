#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd -P)"
LOG_DIR="$ROOT_DIR/.logs"

mkdir -p "$LOG_DIR"

# Clear previous run logs
: > "$LOG_DIR/claim.log"
: > "$LOG_DIR/assess.log"
: > "$LOG_DIR/backend.log"
: > "$LOG_DIR/stubs.log"

CLAIM="$ROOT_DIR/laa-claim-for-payment-frontend"
ASSESS="$ROOT_DIR/laa-assess-a-claim-frontend"
BACKEND="$ROOT_DIR/laa-claim-for-payment"
STUBS="$ROOT_DIR/laa-claim-for-payment-stubs"

start_service () {
  local name="$1"
  local dir="$2"
  local cmd="$3"
  local logfile="$LOG_DIR/$name.log"

  echo "Starting $name → logging to $logfile"

  (
    cd "$dir"
    eval "$cmd"
  ) > "$logfile" 2>&1 &
}

start_service "claim" "$CLAIM" "PORT=3000 yarn dev"
start_service "assess" "$ASSESS" "PORT=3001 yarn dev"
start_service "backend" "$BACKEND" "./gradlew bootRun --args='--server.port=8080'"
start_service "stubs" "$STUBS" "./gradlew bootRun --args='--server.port=8090'"

echo ""
echo "Services starting:"
echo "claim   → http://localhost:3000"
echo "assess  → http://localhost:3001"
echo "backend → http://localhost:8080"
echo "stubs   → http://localhost:8090"
echo ""

echo "Logs are written to:"
echo "  $LOG_DIR"
echo ""

echo "To view logs:"
echo "  tail -f $LOG_DIR/claim.log"
echo "  tail -f $LOG_DIR/assess.log"
echo "  tail -f $LOG_DIR/backend.log"
echo "  tail -f $LOG_DIR/stubs.log"
echo ""

echo "To stop all services run:"
echo "  ./stop-all.sh"