#!/bin/bash

AWS_ACCESS_KEY_ID=AKIA2533TSC3B63EISVV
AWS_SECRET_ACCESS_KEY=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

DATA_DIR=./data

# check aws cli installed
if ! command -v aws &>/dev/null; then
    echo "AWS CLI must be installed for this script to work"
    exit
fi

# view all datasets available
aws s3 ls s3://bigspark.challenge.data

# download data
aws s3 cp s3://bigspark.challenge.data/tpcds_data_5g $DATA_DIR/tpcds_data_5g --recursive
#aws s3 cp s3://bigspark.challenge.data/tpcds_data_5g_streaming $DATA_DIR/tpcds_data_5g_streaming --recursive
#aws s3 cp s3://bigspark.challenge.data/tpcds_data_5g_batch $DATA_DIR/tpcds_data_5g_batch --recursive
