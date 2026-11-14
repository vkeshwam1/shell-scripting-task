#!/bin/bash

URL="https://guvi.in/nonexistent-page"

# -s silent, -o discard body, -w print only the HTTP status code, -L follow redirects
CODE=$(curl -s -o /dev/null -L -w "%{http_code}" "$URL")

echo "URL           : $URL"
echo "HTTP Code     : $CODE"

if [ "$CODE" -ge 200 ] && [ "$CODE" -lt 300 ]; then
    echo "Status        : SUCCESS - the site is reachable (2xx)"
elif [ "$CODE" -ge 300 ] && [ "$CODE" -lt 400 ]; then
    echo "Status        : REDIRECT - the site moved (3xx)"
elif [ "$CODE" -ge 400 ] && [ "$CODE" -lt 500 ]; then
    echo "Status        : FAILURE - client error (4xx)"
elif [ "$CODE" -ge 500 ] && [ "$CODE" -lt 600 ]; then
    echo "Status        : FAILURE - server error (5xx)"
else
    echo "Status        : FAILURE - no valid response (code $CODE)"
fi
