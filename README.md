# api-grpc-service

[![Run on Google Cloud](https://storage.googleapis.com/cloudrun/button.svg)](https://console.cloud.google.com/cloudshell/editor?shellonly=true&cloudshell_image=gcr.io/cloudrun/button&cloudshell_git_repo=https://github.com/go-dyn/api-grpc-service.git)

All the boilerplate you need to get started with writing grpc-gateway powered
REST services in Go.

## Requirements

Go 1.19+

## Running

Running `main.go` starts a web server on https://0.0.0.0:11000/. You can configure
the port used with the `$PORT` environment variable, and to serve on HTTP set
`$SERVE_HTTP=true`.

```
$ go run main.go
```

An OpenAPI UI is served on https://0.0.0.0:11000/.

### Running the standalone server

If you want to use a separate gRPC server, for example one written in Java or C++, you can run the
standalone web server instead:

```
$ go run ./cmd/standalone/ --server-address dns:///0.0.0.0:10000
```

## Getting started

After cloning the repo, there are a couple of initial steps;

1. If you forked this repo, or cloned it into a different directory from the github structure,
   you will need to correct the import paths. Here's a nice `find` one-liner for accomplishing this
   (replace `yourscmprovider.com/youruser/yourrepo` with your cloned repo path):
   ```bash
   $ find . -path ./swagger -prune -o -type f \( -name '*.go' -o -name '*.proto' -o -name '*.yaml' \) -exec sed -i -e "s;github.com/go-dyn/api-grpc-service;yourscmprovider.com/youruser/yourrepo;g" {} +
   ```
1. Finally, generate the files with `make generate`.

Now you can run the web server with `go run main.go`.

## Making it your own

The next step is to define the interface you want to expose in
`proto/users/v1/user.proto`. See https://developers.google.com/protocol-buffers/
tutorials and guides on writing Protobuf files. See the Buf
[style guide](https://docs.buf.build/best-practices/style-guide#files-and-packages)
for tips on how to structure your packages.

Once that is done, regenerate the files using
`make generate`. This will mean you'll need to implement any functions in
`server/server.go`, or else the build will fail since your struct won't
be implementing the interface defined by the generated files anymore.

This should hopefully be all you need to get started playing around with the gRPC-Gateway!
