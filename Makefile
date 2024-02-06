BUF_VERSION:=v1.29.0
SWAGGER_UI_VERSION:=v5.11.2

generate: generate/proto generate/swagger-ui
generate/proto:
	go run github.com/bufbuild/buf/cmd/buf@$(BUF_VERSION) generate
generate/swagger-ui:
	SWAGGER_UI_VERSION=$(SWAGGER_UI_VERSION) ./scripts/generate-swagger-ui.sh

lint:
	go run github.com/bufbuild/buf/cmd/buf@$(BUF_VERSION) lint
	go run github.com/bufbuild/buf/cmd/buf@$(BUF_VERSION) breaking --against 'https://github.com/go-dyn/api-grpc-service.git#branch=main'