TOOLS=\
	github.com/go-swagger/go-swagger/cmd/swagger@v0.27.0 \
	github.com/cosmtrek/air@v1.27.3

install-tools:
	@for tool in $(TOOLS) ; do \
		go install $$tool; \
	done

generate:
	swagger generate server -f ./api/swagger.yml -a example_api -A example_api
