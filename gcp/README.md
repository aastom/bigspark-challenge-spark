# Create a bucket to store zeppelin data
`sh gsutil mb gs://bigspark-zeppelin-notebooks`

# Copy local zeppelin notebook data into the bucket
`sh gsutil cp -r bigspark-zeppelin-notebooks/ gs://bigspark-zeppelin-notebooks/`

# Create the DataProc Cluster (Spark cluster)

> `sh gcloud dataproc clusters create spark-zeppelin --properties 'zeppelin:zeppelin.notebook.gcs.dir=gs://bigspark-zeppelin-notebooks/' --optional-components=ZEPPELIN --enable-component-gateway --region us-central1 --num-workers 2`


# Terminate the Spark cluster

> `sh gcloud dataproc clusters delete bigspark-zeppelin --region us-central1`

