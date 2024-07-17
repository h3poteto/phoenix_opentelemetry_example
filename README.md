# PhoenixOpentelemetryExample

This is an example repository that is implemented with Phoenix using OpenTelemetry to send traces to DataDog.


## Try
At first, export these environment to send metadata information to DataDog.

```
export DD_API_KEY=<your-api-key>
export OTEL_SERVICE_NAME=phoenix_opentelemetry_example
export OTEL_RESOURCE_ATTRIBUTES=deployment.environment=local,host.name=local
```


Then, start OpenTelemetryCollector.

```
$ docker-compose run --rm --service-ports otel-collector
```


And start Phoenix server.

```
$ mix phx.server
[debug] OTLP exporter failed to initialize: exception throw: {application_either_not_started_or_not_ready,
                     tls_certificate_check}
  in function  tls_certificate_check_shared_state:latest_shared_state_key/0 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/tls_certificate_check/src/tls_certificate_check_shared_state.erl, line 479)
  in call from tls_certificate_check_shared_state:get_latest_shared_state/0 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/tls_certificate_check/src/tls_certificate_check_shared_state.erl, line 455)
  in call from tls_certificate_check_shared_state:authoritative_certificate_values/0 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/tls_certificate_check/src/tls_certificate_check_shared_state.erl, line 139)
  in call from tls_certificate_check:options/1 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/tls_certificate_check/src/tls_certificate_check.erl, line 84)
  in call from opentelemetry_exporter:parse_endpoint/2 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/opentelemetry_exporter/src/opentelemetry_exporter.erl, line 439)
  in call from opentelemetry_exporter:endpoint/2 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/opentelemetry_exporter/src/opentelemetry_exporter.erl, line 403)
  in call from lists:filtermap_1/2 (lists.erl, line 1417)
  in call from opentelemetry_exporter:init/1 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/opentelemetry_exporter/src/opentelemetry_exporter.erl, line 211)
  in call from otel_exporter:init/1 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/opentelemetry/src/otel_exporter.erl, line 44)
  in call from otel_batch_processor:init_exporter/2 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/opentelemetry/src/otel_batch_processor.erl, line 327)
  in call from otel_batch_processor:idle/3 (/home/h3poteto/src/github.com/h3poteto/phoenix_opentelemetry_example/deps/opentelemetry/src/otel_batch_processor.erl, line 200)
  in call from gen_statem:loop_state_callback/11 (gen_statem.erl, line 1426)
  in call from proc_lib:init_p_do_apply/3 (proc_lib.erl, line 240)
[warning] OTLP exporter failed to initialize with exception :throw:{:application_either_not_started_or_not_ready, :tls_certificate_check}
[info] Loading 148 CA(s) from :otp store
[info] Running PhoenixOpentelemetryExampleWeb.Endpoint with cowboy 2.12.0 at 127.0.0.1:4000 (http)
[info] Access PhoenixOpentelemetryExampleWeb.Endpoint at http://localhost:4000
[info] OTLP exporter successfully initialized
```


When you access `http://localhost:4000`, Phoenix recieves the request. And the trace will be sent to DataDog through OpenTelemetry container.
