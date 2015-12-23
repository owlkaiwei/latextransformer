from flask import *
import matlab.engine
import os

app = Flask(__name__)

UPLOAD_FOLDER = 'tmp'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

app.debug = True
eng = matlab.engine.start_matlab()

@app.route("/", methods=["get","post"])
def main():
	if request.method == "POST":
		file = request.files['image']
		file.save(os.path.join(app.config['UPLOAD_FOLDER'], file.filename))
		ans = eng.transform(file.filename)
		print(ans)
		os.remove("tmp/" + file.filename)
		return redirect(url_for("result", result=ans))
	else:
		return render_template("index.html")

@app.route("/result", methods=["get","post"])
def result():
	return render_template("result.html", result=request.args['result'])


if __name__ == "__main__":
    app.run()