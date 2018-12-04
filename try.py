import pymysql.cursors

def con():
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='',
                                 db='mydb',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    return connection


def tableSearch(x, y, z=""):   #x is table y is attributes z is condition and can be empty to return the whole table
    connection = con()
    try:
        with connection.cursor() as cursor:
            if z is not "":
                sql = "SELECT " + y + " FROM " + x + " WHERE " + z
            else:
                sql = "SELECT " + y + " FROM " + x
            cursor.execute(sql)
            result = cursor.fetchall()
            print(result)
    finally:
        connection.close()


def tableDel(x, y=""): #x is table y is attributes and can be empty do delete the whole table
    connection = con()
    try:
        with connection.cursor() as cursor:
            if y is not "":
                sql = "DELETE FROM " + x + " WHERE " + y
            else:
                sql = "DELETE FROM " + x
            cursor.execute(sql)
        connection.commit()
    finally:
        connection.close()


def tableInsert(x, y):#x is table y is attributes
    connection = con()
    try:
        with connection.cursor() as cursor:
            sql = "INSERT INTO " + x + " VALUES " + y
            cursor.execute(sql)
        connection.commit()
    finally:
        connection.close()


def tableUpdate(x,y,z): #x is table y is attributes z is condition
    connection = con()
    try:
        with connection.cursor() as cursor:
            sql = "UPDATE " + x + " SET " + y + " WHERE " + z
            cursor.execute(sql)
        connection.commit()
    finally:
        connection.close()

def hey():
    connection = con()
    try:
        with connection.cursor() as cursor:
            # Create a new record
            sql = "INSERT INTO `team` (`Name`, `T.name`) VALUES (%s, %s)"
            cursor.execute(sql, ('League of Legends', 'Fanatic4'))

        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()

    finally:
        connection.close()


if __name__ == "__main__":
    # tableInsert("team(`Name`, `Sponsor`, `T.name`)", "(`League of Legends`,`Riot Games`, `Fanatic`)")
    #tableInsert("team (`Name`,`sponsor`, `T.name`)", "('League of Legends', 'Riot games', 'SKT 8')")
    tableUpdate("`team`", "`sponsor` = 'logitech'", "`T.name` = 'Team SoloMid'" )
    #hey()
