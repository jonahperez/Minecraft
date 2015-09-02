export AWS_DEFAULT_PROFILE=home
aws s3 sync portal s3://www.jonahperez.com --region us-west-2
aws cloudfront create-invalidation --distribution-id E2M80DV600H3AJ --invalidation-batch file://invalidation.json
