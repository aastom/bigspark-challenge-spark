### Create a bucket to store zeppelin data
>`gsutil mb gs://bigspark-zeppelin-notebooks`

### Copy local zeppelin notebook data into the bucket
>`gsutil cp -r bigspark-zeppelin-notebooks/ gs://bigspark-zeppelin-notebooks/`

### Create the DataProc Cluster (Spark,Zepplin,Yarn,HDFS cluster)
> `gcloud dataproc clusters create spark-zeppelin --properties 'zeppelin:zeppelin.notebook.gcs.dir=gs://bigspark-zeppelin-notebooks/' --optional-components=ZEPPELIN --enable-component-gateway --region us-central1 --num-workers 2`

### Terminate the Spark cluster
> `gcloud dataproc clusters delete bigspark-zeppelin --region us-central1`

