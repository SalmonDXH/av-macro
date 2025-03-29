#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk

;image detect

namek := "|<>*102$71.zzzs00000001zzzs00000003zzzs00000007zzzs00003k0Dzzzs0000zs0Tzzzk000Dzs0zzzzk003zzs1zzzzk00zzzw3zzzzk0Dzzzw7zzzzk7zzzzyDzzzzVzzzzzyTzzzzzzzzzzz003zzzzzzzzy0000zzzzzzzw00001zzzzzzs00001zzzzzzk00001zzzzzzU00003zzzzzz000003zzzzzy000003zzzzzw000003zzzzzs000007zzzzzk000007zzzzzU000007zzzzz0000007zzzzz"
namek2 := "|<>*96$61.0000000000000000000000000000000000000000000000000000000000000000DU00000000DzU0000000Dzs0000000Dzy0000000Tzz0000000Tzzk000000Tzzw000000Tzzz000000TzzzU00000zzzzs00000zzzzy00000zzzzzU0000zzzzzk0000zzzzzw0001zzzzzz0001zzzzzzk001zzzzzzs001zzzzzzy000zzzzzzzU00Tzzzzzzs00Dzzzzzzy007zzzzzzz003zzzzzzzk01zzzzzzzw00zzzzzzzz00TzzzzzzzU0Dzzzzzzzs07zzzzzzzy03zzzzzzzzU1zzzzzzzzk0zzzzzzzzw0Tzzzzzzzz0Dzzzzzzzzk7zzzzzzzzs3zzzzzzzzs1zzzzzzzzk0zzzzzzzzk0Tzzzzzzzk0Dzzzzzzzk07zzzzzzzk03zzzzzzzk01zzzzzzzk00zzzzzzzk00TzzzzzzU00DzzzzzzU007zzzzzzU003zzzzzzU001zzzzzzU000zzzzzzU000TzzzzzU000Dzzzzz00007zzzzz00003zzzzz00001zzzzz00000zzzzz00000E"
shibuya := "|<>*46$61.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzTzzzzzzzzw7zzzzzzzzs3zzzzzzzzU1zzzzzzzy03Tzzzzzzw0CDzzzzzzk0Xzzzzzzz00S3zzzzzy07xnzzzzzs0QTDzzzzzU07onzzzzzU0aFlzzzzzkC3bsTzzzzs0sDwDzzzzxi0zz7zzzzzVnzzXzzzzz57zzkzzzzzUTzzsTzzzztzzzyDzzzzvzzzz7zzzzzzzzzVzzzzzzzzzkzzzzzzzzzwTzzzzzzzzy7zzzzzzzzz3zzzzzzzzzrzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzk"
shibuya2 := "|<>**50$59.000DzU000000001k000000000s000000000S0000000006000000000600000000060000000004000000000A0000000008000000000E000000000U00000000100000000020000000004000000000M000000000U0000000030000000004000000000M000000001U00000000C000000000k000000003000000000Q000000001U000000006000000000M000000001U0000000060000000008000000000k00000000100000000060000000008000000000E000000001U0000000020000000004000000000M000000000U0000000010000000006000000000M000000001U000000006000000000M000000000U000000003000000000Q00000020DU0000007zk0000000000000000000000000000000000000000000000000000000000000000000000000000E"


global findrightplace := [
    [namek, namek2],
    [shibuya, shibuya2]
]

fixposition(starter) {
    LookDown()
    i := 1
    if (findrightplace[starter][1] == "") {
        while (true) {
            if ((!FindText(&Xe, &Ye, 341, 215, 656, 488, 0, 0, placedUnit))) {
                BetterClick(404, 577) ; Click leave
                antiSoftLock2()
                placeSpeedo()
                tpToSpawn()
            } else {
                Loop 5 {
                    antiSoftLock2()
                    tpToSpawn()
                    camerafix()
                }
                if (FindText(&Xe, &Ye, 341, 215, 656, 488, 0, 0, placedUnit)){
                    break
                }
            }
        }
    } else {
        while (true) {
            if ((!FindText(&Xe, &Ye, 341, 215, 656, 488, 0, 0, placedUnit))) {
                BetterClick(404, 577) ; Click leave
                antiSoftLock2()
                placeSpeedo()
                tpToSpawn()
            } else {
                if (FindText(&X, &Y, 331, 22, 1137, 356, 0.1, 0.1, findrightplace[starter][1]) || FindText(&X, &Y, 336, 18, 1135, 646, 0.1, 0.1, findrightplace[starter][2])) {
                    break
                } else {
                    AddToLog(i ". Finding the right spot")
                    i++
                    antiSoftLock2()
                    tpToSpawn()
                    camerafix()
                }
            }
        }

        AddToLog("Found the right spot, waiting for the game to lose")
        BetterClick(403, 59) ; reopen
        return true
    }
}

antiSoftLock2() {
    ; found end screen
    if (ok := FindText(&X, &Y, 867, 442, 1034, 500, 0, 0, ReturnLobby)) {
        SendInput("q")
        Sleep 200
        BetterClick(399, 59) ; click close the lb
        Sleep 200
    }

    if (ok := FindText(&X, &Y, 640, 108, 857, 234, 0, 0, start)) {

        SendInput("q")
        Sleep 200
        BetterClick(369, 126) ; Click Start
        Sleep 500
    }
}

tpToSpawn() {
    SendInput("q")
    Sleep 100
    BetterClick(21, 578) ; Click settings
    Sleep 500
    BetterClick(534, 215) ; Click tp to spawn
    Sleep 500
    BetterClick(572, 129) ; Close setting
    Sleep 1000
}


placeSpeedo() {
    SendInput("q")
    Sleep 100
    PlaceUnit(298, 383, 6)
    Sleep 500
}

camerafix() {
    SendInput("q")
    Sleep 200
    BetterClick(231, 412) ; Click Spectate
    Sleep 400
    BetterClick(328, 513) ; Click top
    Sleep 400
    BetterClick(478, 512) ; Click back
    Sleep 400
    BetterClick(404, 577) ; Click leave
    Sleep 400
}