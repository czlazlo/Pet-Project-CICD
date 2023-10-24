from flask import Flask, request, jsonify
from flask_cors import CORS, cross_origin
import data_manager
app = Flask(__name__)
cors = CORS(app)


@app.route("/")
def starting_page():
    return "Hello World"


@app.route("/members")
@cross_origin()
def members():
    users = data_manager.user_list() # type: ignore
    return jsonify(users)


@app.route("/add_user", methods=['POST'])
@cross_origin()
def add_user():
    data = request.get_json()
    email = data.get('email')
    firstName = data.get('firstName')
    lastName = data.get('lastName')
    data_manager.add_user(email, firstName, lastName) # type: ignore
    response = {'message': 'Data received successfully'}
    return jsonify(response), 200


@app.route("/delete_user", methods=['POST'])
@cross_origin()
def delete_user():
    data = request.get_json()
    print(data)

    deleted_user = data_manager.delete_user(data) # type: ignore
    print(deleted_user)
    response = {'message': 'Data received successfully'}
    return jsonify(response), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True, port=5000)

    
