from ..server import app


def test_starting_page():
    response = app.test_client().get('/')
    assert response.status_code == 200
    assert b'Hello World' in response.data
    print(response.data)
