package main

import (
	"context"
	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/lambda"
	"testing"
)

func TestInvokeFunction(t *testing.T) {
	// Create a new session
	conf, _ := config.LoadDefaultConfig(context.Background(), config.WithRegion("us-west-2"))

	// Create a new Lambda client
	client := lambda.NewFromConfig(conf)

	// Call the Lambda function
	result, err := client.Invoke(context.Background(), &lambda.InvokeInput{
		FunctionName: aws.String("test-lambda-2"),
	})
	if err != nil {
		t.Fatal(err)
	}

	// Log the response
	t.Log(string(result.Payload))
}
