import dbfunc as db

def teamfinder(matchId):
        teams = db.tableSearch("`match`", "`teamA`, `teamB`", "`Idmatch` = " + str(matchId))
        return([teams[0]['teamA'], teams[0]['teamB']])

def rankcalc(teamA, teamB):
    fi = db.tableSearch("`team`","`win`, `lose`", "`Tname` = " + "'" +teamA +"'")
    sec =  db.tableSearch("`team`","`win`, `lose`", "`Tname` = " + "'" +teamB +"'")
    ft = ((fi[0]['win'])/(fi[0]['win'] + fi[0]['lose']))
    st = ((sec[0]['win']) / (sec[0]['win'] + sec[0]['lose']))
    #print([ft,st])
    return[ft,st]

def betsys(tt): #tt is a list made by rankcalc
    ft = tt[0]
    st = tt[1]
    fmult = 1.5
    smult = 1.5
    if(ft > st):
        x = (ft - st)/2
        fmult -= x
        smult += x
    elif (st > ft):
        x = (st - ft)/2
        smult -= x
        fmult += x
    return[fmult, smult]


def matchup(matchId, winner):  #only one needed to implement 
    db.tableUpdate("`match`", " `happend` = 1", "`Idmatch` = "+ str(matchId))
    db.tableUpdate("`match`", " `winner` = '" + winner +"'", "`Idmatch` = " + str(matchId))
    win = db.tableSearch("`team`","`win`", "`Tname` = '"+winner+"'")[0]['win']
    win += 1
    db.tableUpdate("`team`", " `win` = " + str(win) , "`Tname` = '" + winner +"'")
    x = teamfinder(matchId)
    for y in x:
        if y != winner:
            loser = y
    lose = db.tableSearch("`team`","`lose`", "`Tname` = '"+loser+"'")[0]['lose']
    lose+= 1
    db.tableUpdate("`team`", " `lose` = " + str(lose), "`Tname` = '" + loser + "'")
    userbet(matchId)

def userbet(matchId):
     ubet = db.tableSearch("`bets`", "`*`", "Idmatch = " + str(matchId))
     t = teamfinder(matchId)
     port = betsys(rankcalc(t[0], t[1]))
     for x in ubet:
         closebet(x, matchId, port, t)



def closebet(userbet, matchId, port, teams):#dict
    win = db.tableSearch("`match`", "`winner`", "`IdMatch` = " + str(matchId) )[0]['winner']
    if userbet['teamBet'] == win:
        ind = teams.index(userbet['teamBet'])
        newam= userbet['amount'] * port[ind]
        curr = db.tableSearch("`user`", "`points`", "`Id` = '" + userbet['Id']+ "'")[0]['points']
        nw = int(curr + newam)
        userw =  db.tableSearch("`user`", "`right`", "`Id` = '" + userbet['Id']+ "'")[0]['right']
        db.tableUpdate("`user`", "`points` = "+ str(nw) + ", `right` =  "+ str(userw +1), "`Id` = '" + userbet['Id']+ "'")
    else:
        curr = db.tableSearch("`user`", "`points`", "`Id` = '" + userbet['Id'] + "'")[0]['points']
        nw = int(curr - userbet['amount'])
        userw = db.tableSearch("`user`", "`wrong`", "`Id` = '" + userbet['Id'] + "'")[0]['wrong']
        db.tableUpdate("`user`", "`points` = " + str(nw)+ ", `wrong` =  "+ str(userw +1), "`Id` = '" + userbet['Id'] + "'")
    db.tableUpdate("`user`", "`amount` = NULL, `currentBet` =  NULL, `teamBet` = NULL", "`Id` = '" + userbet['Id'] + "'")





if __name__ == "__main__":
    #rankcalc(teamfinder(1010101)[0], teamfinder(1010101)[1])
    #print(betsys(rankcalc(teamfinder(2020104)[0],teamfinder(2020104)[1])))
    #print(teams[1][0]['win'])
    matchup(1010101, "G2 Esports")
    #userbet(1010101)
