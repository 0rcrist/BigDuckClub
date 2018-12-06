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
            #print(result)
    finally:
        connection.close()
    return result


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
    #tableInsert("`user`(`Id`, `points`, `currentBet`, `amount`)", "('John', 500, 1010101, 50)")
    #tableInsert("Players (`Name`, `Tname`, `IGN`, `KDA`, `nation`)", "('Kevin Yarnell', 'Team SoloMid', 'Hauntzer', 3.3, 'USA'),('Jonathan Armao','Team SoloMid', 'Grig',3.9, 'USA'),('Soren Bjerg', 'Team SoloMid', 'Bjergsen', 5.0, 'Denmark' ),('Jesper Svenningsen', 'Team SoloMid', 'Zven', 4.4, 'Denmark'),('Alfonso Aguirre Rodriguez', 'Team SoloMid', 'Mithy',    3.3, 'Spain')")
    #tableUpdate("`bets`", " `amount` =  100", "`Id` = 'John'")
    #hey()
    #tableDel("Players")
    #tableUpdate("Players", "experiance = 10", "Tname = 'Team SoloMid'")
    winner = "KT Rolster"
    print(tableSearch("`team`","`win`", "`Tname` = '"+winner+"'")[0]['win'])