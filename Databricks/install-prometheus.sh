#!/bin/bash
cat <<EOF > /databricks/spark/conf/metrics.properties
*.sink.prometheusServlet.class=org.apache.spark.metrics.sink.PrometheusServlet
*.sink.prometheusServlet.path=/metrics/prometheus
master.sink.prometheusServlet.path=/metrics/master/prometheus
applications.sink.prometheusServlet.path=/metrics/applications/prometheus
EOF
cat >/databricks/driver/conf/00-custom-spark.conf <<EOF
[driver] {  
  spark.sql.streaming.metricsEnabled = "true"
  spark.metrics.appStatusSource.enabled = "true"
}
EOF
