import pathlib
import sqlite3
from typing import Tuple, Dict, Set, List


def create_db_connection(data_dir, imgt_version, ro=False):
    """
    Create a  connection to a sqlite database in read-only mode
    or read-write mode (default)

    :param data_dir: The directory where the db is/will be created
    :param imgt_version: IMGT db version
    :param ro: Read-only mode ?
    :return: db connection of type sqlite.Connection
    """
    # Set data directory where all the downloaded files will go
    if data_dir is None:
        data_dir = pathlib.Path.home() / ".pyard"

    db_filename = f'{data_dir}/pyard-{imgt_version}.sqlite3'

    if ro:
        # If in read-only mode, make sure the db file exists
        if not pathlib.Path(db_filename).exists():
            raise RuntimeError(f'Reference Database {db_filename}  not available.')

    # Create the data directory if it doesn't exist
    if not pathlib.Path(db_filename).exists():
        pathlib.Path(data_dir).mkdir(parents=True, exist_ok=True)

    if ro:
        # Open the database in read-only mode
        file_uri = f'file:{db_filename}?mode=ro'
    else:
        # Open the database in read-only mode
        file_uri = f'file:{db_filename}'

    return sqlite3.connect(file_uri, uri=True)


def table_exists(connection: sqlite3.Connection, table_name: str) -> bool:
    """
    Does the table exist in the database ?

    :param connection: db connection of type sqlite.Connection
    :param table_name: table in the sqlite db
    :return: bool indicating whether table_name exists as a table
    """
    query = """SELECT count(*) from sqlite_master where type = 'table' and name = ?"""
    cursor = connection.execute(query, (table_name,))
    result = cursor.fetchone()
    cursor.close()
    return result[0] > 0


def tables_exists(connection: sqlite3.Connection, table_names: List[str]):
    """
    Do all the given tables exist in the database ?

    :param connection: db connection of type sqlite.Connection
    :param table_names: names of tables in the sqlite db
    :return: bool indicating whether all table_names exists
    """
    return all([table_exists(connection, table_name) for table_name in table_names])


def mac_code_to_alleles(connection: sqlite3.Connection, code: str) -> List[str]:
    """
    Look up the MAC code in the database and return corresponding list
    of alleles.
    :param connection: db connection of type sqlite.Connection
    :param code: MAC code
    :return: List of alleles
    """
    mac_query = "SELECT alleles from mac_codes where code = ?"
    cursor = connection.execute(mac_query, (code,))
    result = cursor.fetchone()
    cursor.close()
    if result:
        alleles = result[0].split('/')
    else:
        alleles = None
    return alleles


def is_valid_mac_code(connection: sqlite3.Connection, code: str) -> bool:
    """
    Check db if the MAC code exists.

    :param connection: db connection of type sqlite.Connection
    :param code: MAC code
    :return: code is MAC code ?
    """
    mac_query = "SELECT count(alleles) from mac_codes where code = ?"
    cursor = connection.execute(mac_query, (code,))
    result = cursor.fetchone()
    cursor.close()
    return result[0] > 0


def save_dict(connection: sqlite3.Connection, table_name: str,
              dictionary: Dict[str, str], columns=Tuple[str, str]) -> bool:
    """
    Save the dictionary as a table with column names from columns Tuple.

    :param connection: db connection of type sqlite.Connection
    :param table_name: name of the table to create
    :param dictionary: the dictionary which to take the key and values from
    :param columns: column names in the table
    :return: success status
    """
    cursor = connection.cursor()

    # Drop the table first
    drop_table_sql = f"DROP TABLE IF EXISTS {table_name}"
    cursor.execute(drop_table_sql)

    # Create table
    create_table_sql = f"""CREATE TABLE {table_name} (
                            {columns[0]} TEXT PRIMARY KEY,
                            {columns[1]} TEXT NOT NULL
                    )"""
    cursor.execute(create_table_sql)

    # insert
    cursor.executemany(f"INSERT INTO {table_name} VALUES (?, ?)", dictionary.items())

    # commit transaction - writes to the db
    connection.commit()
    # close the cursor
    cursor.close()

    return True


def save_set(connection: sqlite3.Connection, table_name: str, rows: Set, column: str) -> bool:
    """
    Save the set rows to the table table_name in the column

    :param connection: db connection of type sqlite.Connection
    :param table_name: name of the table to create
    :param rows: set which will become the the column in the table
    :param column: name of the column in the table
    :return: success status
    """
    cursor = connection.cursor()

    # Drop the table first
    drop_table_sql = f"DROP TABLE IF EXISTS {table_name}"
    cursor.execute(drop_table_sql)

    # Create table
    create_table_sql = f"""CREATE TABLE {table_name} (
                            {column} TEXT PRIMARY KEY
                    )"""
    cursor.execute(create_table_sql)

    # insert
    cursor.executemany(f"INSERT INTO {table_name} VALUES (?)", zip(rows, ))

    # commit transaction - writes to the db
    connection.commit()
    # close the cursor
    cursor.close()

    return True


def load_set(connection: sqlite3.Connection, table_name: str) -> Set:
    """
    Retrieve the first column of the table as a set

    :param connection: db connection of type sqlite.Connection
    :param table_name: name of the table to query
    :return: set containing values from the column
    """
    cursor = connection.cursor()
    select_all_query = f"SELECT * FROM {table_name}"
    cursor.execute(select_all_query)
    table_as_set = set(map(lambda t: t[0], cursor.fetchall()))
    cursor.close()
    return table_as_set


def load_dict(connection: sqlite3.Connection, table_name: str, columns: Tuple[str, str]) -> Dict[str, str]:
    """
    Retrieve the values in columns as a name, value pair and create a dict.

    :param connection: db connection of type sqlite.Connection
    :param table_name: name of the table to query
    :param columns: column names in the table
    :return: a dict containing key,value pairs from the columns
    """
    cursor = connection.cursor()
    select_all_query = f"SELECT {columns[0]}, {columns[1]} FROM {table_name}"
    cursor.execute(select_all_query)
    table_as_dict = {k: v for k, v in cursor.fetchall()}
    cursor.close()
    return table_as_dict
