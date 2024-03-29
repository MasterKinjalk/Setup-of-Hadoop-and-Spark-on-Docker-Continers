#!/bin/bash

# Define the service name in your Docker Compose setup
SERVICE_NAME="main"

# Path to the Docker Compose file
DOCKER_COMPOSE_FILE="cs511p1-compose.yaml"

# Define the path to the PySpark script (assuming spark_app.py is at the root in the Docker container)
SPARK_APP_PATH="/spark_app.py"

# Define the output directory and file (adjust these paths as needed)
OUTPUT_DIR="out"
OUTPUT_FILE="${OUTPUT_DIR}/test_sort.out"

mkdir -p out

# Create the output directory if it does not exist
docker-compose -f "$DOCKER_COMPOSE_FILE" exec "$SERVICE_NAME" mkdir -p "$OUTPUT_DIR"

# Copy caps.csv to HDFS
echo "Copying caps.csv to HDFS..."
docker-compose -f "$DOCKER_COMPOSE_FILE" exec "$SERVICE_NAME" bash -c "\
    hdfs dfs -mkdir -p /data && \
    hdfs dfs -put -f /caps.csv /data/caps.csv"

# Run the PySpark script and capture the output
echo "Running Spark application..."
docker-compose -f "$DOCKER_COMPOSE_FILE" exec "$SERVICE_NAME" \
    spark-submit "$SPARK_APP_PATH" > "$OUTPUT_FILE" 2>&1

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Regex pattern to match the output
PATTERN="(\|[[:space:]]*[[:digit:]]{4}[[:space:]]*\|[[:space:]]*[[:digit:]]+-[[:digit:]]+-[[:digit:]]+[[:space:]]*\|)"

# Check if the Spark application ran successfully
if [ $? -eq 0 ]; then
    echo "Spark application ran successfully. Output saved to ${OUTPUT_FILE}"
    # Check if the output matches the regex pattern
    if grep -E -q "$PATTERN" "$OUTPUT_FILE"; then
        echo -e "${GREEN}PASS: Output matches the expected pattern.${NC}"
    else
        echo -e "${RED}FAIL: Output does not match the expected pattern.${NC}"
    fi
else
    echo "Spark application failed. Check ${OUTPUT_FILE} for details."
    echo -e "${RED}FAIL${NC}"
fi

echo "Done! Exit."
