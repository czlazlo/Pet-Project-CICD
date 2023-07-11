import pytest
import sys
from pathlib import Path
from server import create_app

# Add the parent directory to sys.path
parent_dir = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(parent_dir))


@pytest.fixture(scope='session')
def app():
    # Create the Flask app instance
    app = create_app()
    app.config['TESTING'] = True

    # Set up any additional configuration or extensions for testing

    # Establish an application context before running the tests
    with app.app_context():
        yield app


@pytest.fixture(scope='function')
def client(app):
    # Create a test client using the app
    with app.test_client() as client:
        yield client
