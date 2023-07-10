from flask import Flask, render_template, request, redirect, url_for, jsonify
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
    users = data_manager.user_list()
    return jsonify(users)


@app.route("/add_user", methods=['POST'])
@cross_origin()
def add_user():
    data = request.get_json()
    email = data.get('email')
    firstName = data.get('firstName')
    lastName = data.get('lastName')
    data_manager.add_user(email, firstName, lastName)
    response = {'message': 'Data received successfully'}
    return jsonify(response), 200


# @app.route("/delete_user/<id>", method=['DELETE'])
# @cross_origin()
# def delete_user(user_id):
#     deleted_user = data_manager.delet_user(user_id)
#     print(deleted_user)


if __name__ == "__main__":
    app.run(debug=True, port=5000)
