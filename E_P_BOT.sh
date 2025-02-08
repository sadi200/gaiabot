#!/bin/bash

# Function to handle the API request
send_request() {
    local message="$1"
    local api_key="$2"
    local api_url="$3"

    while true; do
        # Prepare the JSON payload
        json_data=$(cat <<EOF
{
    "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "$message"}
    ]
}
EOF
        )

        # Send the request using curl and capture both the response and status code
        response=$(curl -s -w "\n%{http_code}" -X POST "$api_url" \
            -H "Authorization: Bearer $api_key" \
            -H "Accept: application/json" \
            -H "Content-Type: application/json" \
            -d "$json_data")

        # Extract the HTTP status code from the response
        http_status=$(echo "$response" | tail -n 1)
        body=$(echo "$response" | head -n -1)

        if [[ "$http_status" -eq 200 ]]; then
            # Check if the response is valid JSON
            echo "$body" | jq . > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                # Print the question and response content
                echo "✅ [SUCCESS] API: $api_url | Message: '$message'"

                # Extract the response message from the JSON
                response_message=$(echo "$body" | jq -r '.choices[0].message.content')
                
                # Print both the question and the response
                echo "Question: $message"
                echo "Response: $response_message"
                break  # Exit loop if request was successful
            else
                echo "⚠️ [ERROR] Invalid JSON response! API: $api_url"
                echo "Response Text: $body"
            fi
        else
            echo "⚠️ [ERROR] API: $api_url | Status: $http_status | Retrying in 2s..."
            sleep 2
        fi
    done
}

# Define a list of predefined messages
user_messages=(
    "What is 1 + 1"
    "What is 2 + 2"
    "What is 3 + 1"
    "What is 4 + 2"
    "What is 5 + 3"
    "What is 6 + 1"
    "What is 7 + 2"
    "What is 8 + 3"
    "What is 9 + 1"
    "What is 10 + 5"
    "What is 7 + 5"
    "What is 9 + 6"
    "What is 11 + 2"
    "What is 12 + 3"
    "What is 15 + 4"
    "What is 18 + 2"
    "What is 2 - 1"
    "What is 4 - 2"
    "What is 5 - 3"
    "What is 6 - 2"
    "What is 7 - 5"
    "What is 8 - 4"
    "What is 9 - 6"
    "What is 10 - 3"
    "What is 12 - 7"
    "What is 15 - 5"
    "What is 13 - 6"
    "What is 14 - 8"
    "What is 16 - 9"
    "What is 20 - 4"
    "What is 22 - 10"
    "What is 25 - 5"
    "What is 30 - 10?"
"What is 40 - 20?"
"What is 50 - 15?"
"What is 60 - 25?"
"What is 70 - 35?"
"What is 80 - 40?"
"What is 90 - 50"
"What is 100 - 60?"
"What is 110 - 70?"
"What is 120 - 80?"
"What is 130 - 90?"
"What is 140 - 100?"
"What is 150 - 110?"
"What is 160 - 120?"
"What is 170 - 130?"
"What is 180 - 140?"
"What is 190 - 150?"
"What is 200 - 160?"
"What is 210 - 170?"
"What is 220 - 180?"
"What is 230 - 190?"
"What is 240 - 200?"
"What is 250 - 210?"
"What is 260 - 220?"
"What is 270 - 230?"
"What is 280 - 240?"
"What is 290 - 250?"
"What is 300 - 260?"
"What is 310 - 270?"
"What is 320 - 280?"
"What is 330 - 290?"
"What is 340 - 300?"
"What is 350 - 310?"
"What is 360 - 320?"
"What is 370 - 330?"
"What is 380 - 340?"
"What is 390 - 350?"
"What is 400 - 360?"
"What is 410 - 370?"
"What is 420 - 380?"
"What is 430 - 390?"
"What is 440 - 400?"
"What is 450 - 410?"
"What is 460 - 420?"
"What is 470 - 430?"
"What is 480 - 440?"
"What is 490 - 450?"
"What is 500 - 460?"
"What is 510 - 470?"
"What is 520 - 480?"
"What is 530 - 490?"
"What is 540 - 500?"
"What is 550 - 510?"
"What is 560 - 520?"
"What is 570 - 530?"
"What is 580 - 540?"
"What is 590 - 550?"
"What is 600 - 560?"
"What is 610 - 570?"
"What is 620 - 580?"
"What is 630 - 590?"
"What is 640 - 600?"
"What is 650 - 610?"
"What is 660 - 620?"
"What is 670 - 630?"
"What is 680 - 640?"
"What is 690 - 650?"
"What is 700 - 660?"
"What is 710 - 670?"
"What is 720 - 680?"
"What is 730 - 690?"
"What is 740 - 700?"
"What is 750 - 710?"
"What is 760 - 720?"
"What is 780 - 740?"
"What is 790 - 750?"
"What is 800 - 760?"
"What is 810 - 770?"
"What is 820 - 780?"
"What is 830 - 790?"
"What is 840 - 800?"
"What is 850 - 810?"
"What is 860 - 820?"
"What is 870 - 830?"
"What is 880 - 840?"
"What is 890 - 850?"
"What is 900 - 860?"
"What is 910 - 870?"
"What is 920 - 880?"
"What is 930 - 890?"
"What is 940 - 900?"
"What is 950 - 910?"
"What is 960 - 920?"
'What is 970 - 930?"
'What is 980 - 940?"
'What is 990 - 950?"
'What is 1000 - 960?"
'What is 1010 - 970?"
''What is 1020 - 980?"
)

# Ask the user to input API Key and Domain URL
echo -n "Enter your API Key: "
read api_key
echo -n "Enter the Domain URL: "
read api_url

# Exit if the API Key or URL is empty
if [ -z "$api_key" ] || [ -z "$api_url" ]; then
    echo "Error: Both API Key and Domain URL are required!"
    exit 1
fi

# Set number of threads to 1 (default)
num_threads=1
echo "✅ Using 1 thread..."

# Function to run the single thread
start_thread() {
    while true; do
        # Pick a random message from the predefined list
        random_message="${user_messages[$RANDOM % ${#user_messages[@]}]}"
        send_request "$random_message" "$api_key" "$api_url"
    done
}

# Start the single thread
start_thread &

# Wait for the thread to finish (this will run indefinitely)
wait

# Graceful exit handling (SIGINT, SIGTERM)
trap "echo -e '\n🛑 Process terminated. Exiting gracefully...'; exit 0" SIGINT SIGTERM
