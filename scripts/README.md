# Introduction 

Bash script to upload the file to specified cloud storage in our case it is AWS s3 

# Prerequitues 

AWS CLI installed - to check the version of the awscli run aws --version
AWS Credentials configured - use aws configure command and set the access key id and secret access key 

# Options 

-d --directory <directory> : Target Directory in the bucket 
-s --storageClass <class> : Storage Class for the object (default: STANDARD)

# Example

./clouduploader.sh "bucketname" "/path/to/file.txt" -d "target-directory-in-bucket" -s "storageclass"

# Script Breakdown 

* display_usage - Display the usage of script and options of the script. 
* Variables - Defines the required variables like $BUCKET_NAME $FILE_PATH etc. 
* Options Parsing: Parses additional options like target directory and storage class.
* File and Bucket name check - Check if the file and bucket name exist or not , and if the bucket name and file path is valid.
* upload_file function - Function to upload the file to the s3 bucket.

# Errors 

* Missing file path or bucket name. 
* File not found  
* AWS CLI not installed 
* AWS credentials not configured
* invalid options

# Installation 
 
To install the awscli run the following command 
```pip3 install awscli```

Ensure AWSCLI is installed in your path 
```export PATH=/path/to/awscli:$PATH```

Verify AWSCLI
```awscli --version```

Configure AWSCLI
```aws configure```


