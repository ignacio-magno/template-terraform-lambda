package main

import (
	// iport aws sdk
	"github.com/aws/aws-lambda-go/lambda"

	// import aws event
	"github.com/aws/aws-lambda-go/events"
)

func Handler(e events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	return events.APIGatewayProxyResponse{
		Body:       "Hello world",
		StatusCode: 200,
	}, nil
}

func main() {
	lambda.Start(Handler)
}
