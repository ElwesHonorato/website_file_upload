import boto3
import json
import pandas

s3 = boto3.resource('s3')

def lambda_handler (event, context):
 source_bucket = 'fs000-dev-env-bucket-bronze'
 destin_bucket = 'fs000-dev-env-bucket-silver'
 
 obj_source_bucket = s3.Bucket(source_bucket)
 obj_destin_bucket = s3.Bucket(destin_bucket)

 print(obj_source_bucket)
 print(obj_destin_bucket)
 print("==========================================================================")
 
 copy_source = {
  'Bucket': 'source_bucket',
  'Key'   : 'source_key'
 } 
 copy_source['Bucket'] = source_bucket

 for obj in obj_source_bucket.objects.filter(Prefix='INSOURCE/',Delimiter='/'):
  # Define Source Object to be moved
  source_key = obj.key
  copy_source['Key'] = source_key
  
  # Extract File Extension
  file_extension = source_key.split('.')[1]
  file_extension = file_extension.lower
  
  if file_extension == '.csv':
   file_headers = pd.read_csv(path_account_records,nrows=0)
   print(file_headers.columns)
  
  
  # Copy file to Silver Bucket
  destin_key = source_key # Save the file in the same structure
  obj_destin_bucket.copy(copy_source, destin_key) # Copy file from Bronze Bucket to Silver Bucket
  
  # Copy file to Moved in Bronze Bucket
  file_name = source_key.split('/')[1] # Extract the name without the "INSOURCE" preffix
  moved_destin_key = 'MOVED/' + file_name # Create key with "MOVED" preffix
  obj_source_bucket.copy(copy_source, moved_destin_key) # Copy file from "INSOURCE" to "MOVED" in Bucket Bronze