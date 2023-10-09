import os
import psycopg2
import psycopg2.extras
from dotenv import load_dotenv


def get_connection_string():
    # setup connection string
    # to do this, please define these environment variables first
    #load_dotenv('/backend/dotenv.env')
    #load_dotenv('/home/lazlo/CC/Pet-Project-CICD/backend/dotenv.env')
    
    load_dotenv('/home/lazlo/CC/GIT/Pet-Project-CICD/backend/dotenv.env')

    user_name = os.getenv('PGUSER')
    password = os.getenv('PGPASSWORD')
    host = os.getenv('PSQL_HOST')
    database_name = os.getenv('PSQL_DB_NAME')

    #user_name = "" #push to main
    #password = "" #push to main
    #host = "172.17.0.3:5432"
    #database_name = "user_data"
    
    print(user_name,password,host,database_name)
    env_variables_defined = user_name and password and host and database_name

    if env_variables_defined:
        # this string describes all info for psycopg2 to connect to the database
        print(user_name,password,host,database_name)
        return 'postgresql://{user_name}:{password}@{host}/{database_name}'.format(
            user_name=user_name,
            password=password,
            host=host,
            database_name=database_name
        )
    else:
        raise KeyError(
            'Some necessary environment variable(s) are not defined')


def open_database():
    try:
        connection_string = get_connection_string()
        connection = psycopg2.connect(connection_string)
        connection.autocommit = True
    except psycopg2.DatabaseError as exception:
        print('Database connection problem')
        raise exception
    return connection


def connection_handler(function):
    def wrapper(*args, **kwargs):
        connection = open_database()
        dict_cur = connection.cursor(
            cursor_factory=psycopg2.extras.RealDictCursor)
        ret_value = function(dict_cur, *args, **kwargs)
        dict_cur.close()
        connection.close()
        return ret_value

    return wrapper
