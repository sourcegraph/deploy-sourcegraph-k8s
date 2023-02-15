# Tracing

Add otel with a Jaeger backend, consisting of its [Collector](https://www.jaegertracing.io/docs/1.37/architecture/#collector) and [Query](https://www.jaegertracing.io/docs/1.37/architecture/#query) components. It also [configures](https://github.com/sourcegraph/sourcegraph/blob/main/docker-images/opentelemetry-collector/configs/jaeger.yaml) the `otel-collector` to export to this Jaeger instance.
