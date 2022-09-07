from flask import Flask, render_template, request
import boto3
app = Flask(__name__)
from werkzeug.utils import secure_filename
# import key_config as keys



ACCESS_KEY_ID     = 'AKIASGL7P5QENRGQ6MFC'
ACCESS_SECRET_KEY = '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'

s3 = boto3.client('s3',
                    aws_access_key_id     = ACCESS_KEY_ID,
                    aws_secret_access_key = ACCESS_SECRET_KEY
                     )

BUCKET_NAME='mbaprojectbronze'


@app.route('/')  
def home():
    return render_template("home.html")

@app.route('/upload',methods=['post'])
def upload():
    if request.method == 'POST':
        img = request.files['file']
        filename = secure_filename(img.filename)
        img.save(filename)
        s3.upload_file(
            Bucket = BUCKET_NAME,
            Filename=filename,
            Key = filename
        )
        msg = "Upload Done ! "

    return render_template("home.html",msg =msg)




if __name__ == "__main__":
    
    app.run(debug=True)