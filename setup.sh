#!/bin/bash

CONFIG_FILE=config.conf

# Check if config file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Configuration file '$CONFIG_FILE' not found. Please create the configuration file and try again."
    exit 1
fi

# Load configuration from config.conf
source $CONFIG_FILE

# Replace placeholders with user-specific values
sed -i "s/192.168.49.2/$CLUSTER_IP/g" $(grep -rl '192.168.49.2' *)
sed -i "s/192.168.49.2/$S3_IP/g" $(grep -rl '192.168.49.2' *)
sed -i "s/30420/$PREFECT_API_PORT/g" $(grep -rl '30420' *)
sed -i "s/30500/$MLFLOW_PORT/g" $(grep -rl '30500' *)
sed -i "s/30909/$PROMETHEUS_PORT/g" $(grep -rl '30909' *)
sed -i "s/your_kafka_service_port/$KAFKA_SERVICE_PORT/g" $(grep -rl 'your_kafka_service_port' *)
sed -i "s/your_kafka_controller_1_port/$KAFKA_CONTROLLER_PORT_1/g" $(grep -rl 'your_kafka_controller_1_port' *)
sed -i "s/your_kafka_controller_2_port/$KAFKA_CONTROLLER_PORT_2/g" $(grep -rl 'your_kafka_controller_2_port' *)
sed -i "s/your_kafka_controller_3_port/$KAFKA_CONTROLLER_PORT_3/g" $(grep -rl 'your_kafka_controller_3_port' *)
sed -i "s/9000/$S3_PORT/g" $(grep -rl '9000' *)

echo "Config variables setup completed. Proceed with deployment steps of each service as outlined in the README."
