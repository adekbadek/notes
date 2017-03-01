# Static site deployment with Amazon Web Services

1. create and [configure](https://docs.aws.amazon.com/gettingstarted/latest/swh/getting-started-configure-bucket.html) buckets and enable static hosting

1. create a [user](https://console.aws.amazon.com/iam/home?#/users) and download credentials

1. install aws cli - `$ brew install awscli`

1. set up configuration (using the creds of newly created user) - `$ aws configure`

1. [deploy!](http://serverfault.com/a/754720, https://docs.aws.amazon.com/cli/latest/reference/s3/) - `$ aws s3 sync source_folder  s3://your_bucket_name/destination_folder/ `

1. Enable CORS - in bucket Properties/Permissions (next to bucket policy)
