from flask import Flask, render_template, request
import boto3
app = Flask(__name__)
from werkzeug.utils import secure_filename
# import gunicorn
# import key_config as keys


s3 = boto3.client('s3')
BUCKET_NAME='fs000-dev-env-bucket-bronze'


@app.route('/')  
def home():
    return render_template("home.html")

@app.route('/upload',methods=['post'])
def upload():
    if request.method == 'POST':
        uploaded_file = request.files['file']
        filename = secure_filename(uploaded_file.filename)
        uploaded_file.save(filename)
        s3.upload_file(
            Bucket = BUCKET_NAME,
            Filename= 'INSOURCE/' + filename,
            Key = filename
        )
        msg = "Upload Done ! "

    return render_template("home.html",msg =msg)


if __name__ == "__main__":
    app.run(debug=True)