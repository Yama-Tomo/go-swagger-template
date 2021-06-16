package handlers

import (
	"github.com/Yama-Tomo/go-swagger-template/restapi/example_api"
	"github.com/go-openapi/runtime/middleware"
)

func GetGreeting(p example_api.GetGreetingParams) middleware.Responder {
	payload := *p.Name
	return example_api.NewGetGreetingOK().WithPayload(payload)
}
