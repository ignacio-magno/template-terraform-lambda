package main

import (
	"context"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest(ctx context.Context, e events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Headers:    getHeaders(e),
		Body:       "",
	}, nil
}

func getHeaders(e events.APIGatewayProxyRequest) map[string]string {
	return map[string]string{
		"Access-Control-Allow-Origin":      e.Headers["origin"],
		"Access-Control-Allow-Credentials": "true",
	}
}

func main() {
	lambda.Start(HandleRequest)
}
