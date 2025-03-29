#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk

;image detect
namekfix := "|<>*63$134.zzzzzzzzzsDzzU0000001zzzzzzzzzzw3zzs0000000Tzzzzzzzzzz0zzz0000000Dzzzzzzzzzzk7zzs0000007zzzzzzzzzzy1zzy0000003zzzzzzzzzzzszzzU000003zzzzzzzzzzzzzzzw000001zzzzzzzzzzzzzzzzU00001zzzzzzzzzzzzzzzzs1zU00Tzzzzzzzzzzzzzzzy7zz0QDzzzzzzzzzzzzzzzzzzzwD7zzzzzzzzzzzzzzzzzzzzzvzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw0Tzzzzzzzzzzzzzzzzzzzy00zzzzzzzzzzzzzzzzzzzz003zzzzzzzzzzzzzzzzzzz000Tzzzzzzzzzzzzzzzzzz0000Tzzzzzzzzzzzzzzzzz000001zzzzzzzzzzzzzzzzU00000Tzzzzzzzzzzzzzzzs000007zzzzzzzzzzzzzzzz000001zzzzzzzzzzzzzzzzU00000Tzzzzzzzzzzzzzzzk00000Dzzzzzzzzzzzzzzzw000007zzzzzzzzzzzzzzzw000001zzzzzzzzzzzzzs0M000000Tzzzzzzzzzzzzk000000007zyzzzzzzzzzzs000000000zz7zzzzzzzzzw000000000Dz0zzzzzzzzzzU000000003zkDzzzzzzzzzs000000000zy3zzzzzzzzzy000000000DzUTzzzzyzzzzk000000003z03zzzzrzzzzs000000000Tk01zzzqszzzy0000000007w00DzzwaDzzzs000000003z001zzzFXzzzy000000000zU00DzzwEzzzzU00000000Ds001zzyADzzzs000000003z000TzzX2"
undergroundfix := "|<>*72$71.0k0001zzy01y1k0003zzw2Xw100007zzyT7s60000Dzzxzzk80000TzzzzzU00000zzzzzz000003zzzzzy00000Dzzzzzw00000zzzzzzs00003zzzzzzk2000DzzzzzzUT0C1zzzzzzz0Tjzzzzzzzzy03zzzzzzzzzw00zzzzzzzzzs003zzzzzzzzk0000zzzzzzzU0003zzzzzzz0000Dzzzzzzy0000Tzzzzzzw0003zzzzzzzs0003kzzzzzzk00003zzzzzzU00007zzzzzy00000Dzzzzzt"
bleachfix := "|<>*56$71.0003tzw0001s0007rzk0003k000TjzU0007U000zzy0000D0000zzw0000S0001zzk0000w0003zzU0000s0007zy00001k000Tzw00003k0M0zzk00007U083zzU0000D00MDzy00000S00szzs00000xzzzzzs00000vzzzzzw00001zzzzzzw00003zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzy000Tzry9s000000TvU01k000000s7U03U000003sDU070000003wT00D0000007zi00y000000D"
ddfix := ""

namekfix2 := "|<>*85$59.00Tzzzzzzy00zzzzzzzw00zzzzzzzs01zzzzzzzk01zzzzzzzU01zzzzzzz003zzzzzzy003zzzzzzw003zzzzzzs007zzzzzzk007zzzzzvU00Dzzzzy1000DzzzzU07k0Tzzzs00DU0Tzzzk00TU0TzzzU00TU0Tzzz000zk0Tzzz000zk0zzzy000zw0zzzy03zzw0zzzy07zzzszzzz0Dzzzzzzzy0Tzzzzzzzy0zzzzzzzzy1zzzzzzzzw3zzzzzzzzk7zzzzzzzz0Dzzzzzzzy0Tzzzzzzzk0zzzzzz3z01zzzzzy3y03zTzzzy0007zzzzzy000Dzzzzzy000Tzzzzzw000zz3zzzwE01zz3zzzzs03zz7zzzzs07zmDzzzzw0DzYTzzzzw0Tzzzzzzzs0zzzzzzzy01zzzzzzzsDzzzzzzzzzzy3zzzzzzzzw3zzzzzzzzy7zzzzzzzyzjzzzzzzzzzDzzzzzzzzzTzzzvzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzbzzzk"
undergroundfix2 := "|<>*75$69.Uzw000TzzU007zk0007zw003zz0000DzU08zzw0001zzXyDzzU000DzzzvzTy0007zzzzzUzs00Tzzzzzs3zU0zzzzzzs07y0Tzzzzzy00TsTzyTzzzU03zbyDVzzzs00Dz000Dzzz000zw001zzzU007zU007zz0000Ty000TzU0003zs003zk0000Dz004Tw00001zw03Xz000007zk1sMw00000TzUz3zU00003zyTsTw00000DzzzlzU00000zzzzDs060007zzztz00w000Tk6DDw03s001s00kzU0Ds00D0047w01zs00s000zU07zs030007w00Dzs0Q000zU0Dzzs3zU0Dy07zzzzzzw1zk0zzzzzzzUDy07zzzzzzy3zk0zzzzzzzwzz07zzzzzzzzzs0zzzzzzzzzz03zzzzzzzsTs0TzzzzzyA1z03Tzzzzz003s000DzzztU0TU0001zk6A03zz0000003s0Tzs00000077VzzU000001zwTzw0000s03zXzzU000TU0Dyzzy000Dy00zzzUk00zzk077zk4"
bleachfix2 := "|<>*42$61.zzzzzzzyDkTzzzzzzzzsDzzzzzzzvk7zzzzzzzVk3zzzzzzzUy1zzyTzzzkT0zzzDzzzsD0TzzzyDzwDUDzzzk7zw7k7zzzw1zw3w3zzzzyzw5y1zzzzzTw2y0zzzzzzC7S0TzzzzjU1D0Dzzzz001bU7zzzz001nU3zzzz0009k0zzzy0000s07zzz0007R03zzy0003gU1zsS1U00a00Tk70000301Tw000001U1jy000000k0zzU00000M0Tzk00000A0Dzs00000607zw00000703zz000003U1zzU00001k0zzs00000s0TzzU0000Q0DzzzVzzzy07zzzzzzzzzzzzzzzzzzzzzzzzzzznUkzs1zzzzlkMTs0Tzzzss6Dw07zzzsQ3bw03zzzkC1vy03zzzk70xz03zzzk3USzU3wTzs1kTTk1y0000sDjs1z0000MDzw1z0000Dzzw1z00007zzy1zU0007UTz0zk0003U7zkTk0001k1zw7s0000s0Dy3s0000Q03y0s0000D01y0Q0000700z0600003U0TU300001k0Dk1U0001s07s0E0000w03w000000S01y000000D00T0001U07k1E"
ddfix2 := ""

findrightplace := [
    [namekfix,namekfix2],    
    [bleachfix,bleachfix2],
    [ddfix, ddfix2],
    [undergroundfix,undergroundfix2]
]



fixposition(starter) {
    LookDown()
    i := 1
    if (findrightplace[starter][1] = "") {
        while (true) {
            if ((!FindText(&Xe, &Ye, 341, 215, 656, 488, 0, 0, placedUnit))) {
                BetterClick(404, 577) ; Click leave
                Sleep 100
                antiSoftLock2()
                placeSpeedo()
                tpToSpawn()
            } else {
                Loop 3 {
                    antiSoftLock2()
                    tpToSpawn()
                    camerafix()
                }
                break
            }
        }
    } else {
        while (true) {
            if ((!FindText(&Xe, &Ye, 341, 215, 656, 488, 0, 0, placedUnit))) {
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
    }
    AddToLog("Found the right spot, waiting for the game to lose")
    BetterClick(403, 59) ; reopen
    return true
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