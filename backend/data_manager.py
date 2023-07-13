import database_connection


@database_connection.connection_handler
def user_list(cursor):
    query = """
        SELECT *
        FROM user_data;
    """
    cursor.execute(query)
    return cursor.fetchall()


@database_connection.connection_handler
def add_user(cursor, email_address, first_name, last_name):
    query = """
        INSERT INTO user_data(email_address, first_name, last_name)
        VALUES
            (%(email_address)s, %(first_name)s, %(last_name)s)
            RETURNING id
    """
    cursor.execute(query, {"email_address": email_address,
                   "first_name": first_name, "last_name": last_name})
    return cursor.fetchone()


@database_connection.connection_handler
def delete_user(cursor, user_id):
    query = """
    DELETE FROM user_data WHERE id = %(user_id)s;
    """
    cursor.execute(query, {"user_id": user_id})
