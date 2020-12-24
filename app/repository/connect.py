from config import config
import psycopg2

def connect(query, params):
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters
        configs = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**configs)

        # create a cursor
        cur = conn.cursor()

	# execute a statement
        print('PostgreSQL database version:')

        cur.execute(query, params)

        # display the results of the query
        db_version = cur.fetchone()
        results = cur.fetchall()
        print(db_version)
        print(results)

        # return the results to the API
        return db_version

	# close the communication with the PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')


if __name__ == '__main__':
    connect()