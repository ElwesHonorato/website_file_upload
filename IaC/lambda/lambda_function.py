import boto3
import json

s3_resource = boto3.resource('s3')

def lambda_handler (event, context):

 source_bucket = 'fs000-dev-env-bucket-bronze'
 destin_bucket = 'fs000-dev-env-bucket-silver'
 
 obj_source_bucket = s3_resource.Bucket(source_bucket)
 obj_destin_bucket = s3_resource.Bucket(destin_bucket)

 print(obj_source_bucket)
 print(obj_destin_bucket)
 print("==========================================================================")
 
 schema_list = [
  ['account_id','name','value']
  ]
 schema_list = sorted(schema_list)
 # ########################################################################################################################################################################################################
 # ########################################################################################################################################################################################################
 
 copy_source = {
  'Bucket': 'source_bucket',
  'Key'   : 'source_key'
 } 
 copy_source['Bucket'] = source_bucket
 
 #### List all objects and disconsider the folder itself 
 object_list = obj_source_bucket.objects.filter(Prefix='INSOURCE/',Delimiter='/')
 object_list = list(object_list)
 object_list = object_list[1:]

 #### iterate through all objects in the list
 for obj in object_list:
  try: #### File has extension
   source_key = obj.key
   copy_source['Key'] = source_key
   # print(source_key)
   # Extract File Extension
   file_extension = source_key.split('.')[1]
   file_extension = file_extension.lower()
   if file_extension == 'csv':
    s3_object = s3_resource.Object(source_bucket, source_key)
    data = s3_object.get()['Body'].read().decode('utf-8').splitlines()

    results = []
    for line in data:
     words = line.split(',')
     results.append(words)
     
     results     = results[0]
     results[-1] = results[-1].replace('\n','')
     results     = [x.lower() for x in results]
     results     = sorted(results)
     break    
    for schema in schema_list:
     schema_valid = False
     if schema == results:
      schema_valid = True
      break
    if schema_valid == True:
     ### Copy file to Silver Bucket
     destin_key = source_key # Save the file in the same structure
     obj_destin_bucket.copy(copy_source, destin_key) # Copy file from Bronze Bucket to Silver Bucket
     ### Copy file to Moved in Bronze Bucket
     file_name = source_key.split('/')[1] # Extract the name without the "INSOURCE" preffix
     moved_destin_key = 'MOVED/' + file_name # Create key with "MOVED" preffix
     obj_source_bucket.copy(copy_source, moved_destin_key) # Copy file from "INSOURCE" to "MOVED" in Bucket Bronze
     s3_resource.Object(source_bucket, source_key).delete()
     
    else:
     ### Copy file to SCHEMA_LESS/ in Bronze Bucket
     file_name = source_key.split('/')[1] # Extract the name without the "INSOURCE" preffix
     moved_destin_key = 'SCHEMA_LESS/' + file_name # Create key with "SCHEMA_LESS" preffix
     obj_source_bucket.copy(copy_source, moved_destin_key) # Copy file from "INSOURCE" to "SCHEMA_LESS" in Bucket Bronze
     s3_resource.Object(source_bucket, source_key).delete()
     
   else:
    ### Copy file to WRONG_FORMAT/ in Bronze Bucket
    file_name = source_key.split('/')[1] # Extract the name without the "INSOURCE" preffix
    moved_destin_key = 'WRONG_FORMAT/' + file_name # Create key with "WRONG_FORMAT" preffix
    obj_source_bucket.copy(copy_source, moved_destin_key) # Copy file from "INSOURCE" to "WRONG_FORMAT" in Bucket Bronze
    s3_resource.Object(source_bucket, source_key).delete()
    
  except:
   ### Copy file to WRONG_FORMAT/ in Bronze Bucket
   file_name = source_key.split('/')[1] # Extract the name without the "INSOURCE" preffix
   moved_destin_key = 'WRONG_FORMAT/' + file_name # Create key with "WRONG_FORMAT" preffix
   obj_source_bucket.copy(copy_source, moved_destin_key) # Copy file from "INSOURCE" to "WRONG_FORMAT" in Bucket Bronze
   s3_resource.Object(source_bucket, source_key).delete()
