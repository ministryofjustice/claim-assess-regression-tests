#!/usr/bin/env bash

set -euo pipefail

TARGET=http://localhost:3000
RESPONSE_HTML=/tmp/response.html
COOKIE_JAR=/tmp/cookies.txt

rm -f $RESPONSE_HTML
rm -f $COOKIE_JAR

# Ping the target page
# Follow redirects to the login page (-L)
# Send existing cookies in the cookie jar (-b)
# Save new cookies to the cookie jar (-c)
# Save HTML response of the login page to response.html
curl -s -L \
  -b $COOKIE_JAR \
  -c $COOKIE_JAR \
  $TARGET > $RESPONSE_HTML

# Extract CSRF token from the response HTML
CSRF_TOKEN=$(grep -o 'name="_csrf"[^>]*value="[^"]*"' $RESPONSE_HTML | sed 's/.*value="\([^"]*\)"/\1/')
echo "CSRF token: $CSRF_TOKEN"

# POST credentials and CSRF token
# Follow redirects to the callback URL (-L)
# Send existing cookies in the cookie jar (-b)
# Save new cookies to the cookie jar (-c)
curl -s -L \
  -b $COOKIE_JAR \
  -c $COOKIE_JAR \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=alice&password=password&_csrf=$CSRF_TOKEN" \
  "http://stub-oidc-server:8091/login" > /dev/null

# Extract session ID from the cookie jar
SESSION_ID=$(grep sessionId $COOKIE_JAR | awk '{print $7}' | tail -n1)
echo "Session ID: $SESSION_ID"

# Store the session ID in GITHUB_ENV
ZAP_AUTH_HEADER_VALUE="sessionId=$SESSION_ID"
echo "ZAP auth header value: $ZAP_AUTH_HEADER_VALUE"

curl -H "Cookie: sessionId=$SESSION_ID" $TARGET