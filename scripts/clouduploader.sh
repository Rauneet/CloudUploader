#!/bin/bash
#revision=0.1
#Mon Jun 10 18:34:03 IST 2024
#Bash script to upload the file to the provided storage solution in cloud (AWS S3)
display_usage() {
    echo "Usage: $0 /path/to/file [options]" # Displays the current filename
    echo "Options:"
    echo " -d, --directory <directory>"
    echo " -s, --storageClass <storageClass>"
    #display as much options as you want 
    exit 1 
}

# Parse the command line 
if [ $# -lt 1]; then 
    display_usage
fi

# Variables 
FILE_PATH=$2
TARGET_DIRECTORY=""
STORAGE_CLASS=$3
BUCKET_NAME=$1
ACCESS_KEY=""
SECRET_ACCESS_KEY=""
FILES=()


# Optional: Check for additional options like directory and storage class
while [ "$#" -gt 0 ]; do
    case "$1" in
        -d|--directory)
            shift
            TARGET_DIRECTORY="$1"
            ;;
        -s|--storage-class)
            shift
            STORAGE_CLASS="$1"
            ;;
        *)
            echo "Error: Invalid option: $1"
            display_usage
            ;;
    esac
    shift
done



# Check if the file path is present or not 

if [-z $FILE_PATH]; then
    echo "Error: File path not provided Usage: $0 <bucket-name> <file-path>"
    exit 1
fi

# Check if the file is present or not 

if [ ! -f $FILE_PATH]; then
    echo "Error: File '$FILE_PATH' not found"
fi

# Check if the bucket is present or not 

if  [ -z "$BUCKET_NAME"]; then 
        echo "Error: Bucket name not provided Usage: $0 <bucket-name>"
        exit 1
fi


upload_file() {
    #Cloud platform upload commands 
    if ! command -v aws &> /dev/null; then
        echo "AWS CLI is not installed. Please install before running the script."
        exit 1
    fi
    # Check the AWS CLI Version 
    AWS_CLI_VERSION=$(aws --version 2>&1 | awk '{print $1 " " $2}')
    echo "AWS CLI Version: $AWS_CLI_VERSION"

    # Check the configuration using aws configure 

    if [! -f ~/.aws/credentials]; then
        echo "Credentials are not setup. PLease ensure that the credentials are first setup"
        exit 1
    fi

    if ! grep -q 'aws_access_key_id' ~/.aws/credentials || grep -q 'aws_secret_access_key' ~/.aws/credentials; then
        echo "Error: AWS Access key id or Secret access key is missing. Please run `aws configure` to set the acesss key id and secret access key id"
        exit 1
    fi
    
    if ! aws s3 ls "s3://$BUCKET_NAME" &> /dev/null; then
        echo "Error: Unable to list contents of the S3 bucket '$BUCKET_NAME'. Check bucket permissions."
        exit 1
    
    fi
    # Upload file to the s3 bucket
    for $FILE_PATH in "{$FILES[@]}"; do

        aws s3 cp "$FILE_PATH" "s3://$BUCKET_NAME/$TARGET_DIRECTORY" --storage-class "$STORAGE_CLASS" --recursive | pv -lpe -s $(stat -c "%s" "$FILEPATH")  # --recursive is used to upload files and subdirectories

        if [ $? -eq 0 ]; then
            echo "File upload successful"
        else
            echo "Error: File upload failed"
            exit 1
        fi
}




upload_file







