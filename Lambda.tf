resource "aws_lambda_function" "TwitterSearchPoller" {
    function_name = "serverlessrepo-aws-serverless--TwitterSearchPoller-Ox6C2lggbAKu"
    role = "arn:aws:iam::014836268811:role/serverlessrepo-aws-serverl-TwitterSearchPollerRole-15YFGE04ZXBJD"
    handler = "poller.handler"
    runtime = "python3.6"
    
    tags = {
        "lambda:createdBy"               = "SAM"
        "serverlessrepo:applicationId"   = "arn:aws:serverlessrepo:us-east-1:077246666028:applications/aws-serverless-twitter-event-source"
        "serverlessrepo:semanticVersion" = "2.0.0"
    }
    tags_all = {
       
    }

    timeout = 60
    environment {
           variables = {
               "BATCH_SIZE"                    = "15"
               "SEARCH_CHECKPOINT_TABLE_NAME"  = "serverlessrepo-aws-serverless-twitter-event-source-SearchCheckpoint-K1JKFWB2IZR8"
               "SEARCH_TEXT"                   = "Threebridge"
               "SSM_PARAMETER_PREFIX"          = "twitter-event-source"
               "STREAM_MODE_ENABLED"           = "false"
               "TWEET_PROCESSOR_FUNCTION_NAME" = "ProcessTweets"
            }
        }
}

resource "aws_lambda_function" "ProcessTweets" {
    function_name = "arn:aws:lambda:us-east-1:014836268811:function:ProcessTweets"
    role = "arn:aws:iam::014836268811:role/service-role/ProcessTweets-role-a31cltrr"
    handler = "lambda_function.lambda_handler"
    runtime = "python3.6"

    tags = {
      
    }
    timeout = 3

}