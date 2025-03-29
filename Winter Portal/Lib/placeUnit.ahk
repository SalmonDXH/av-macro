#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\main.ahk
#Include %A_ScriptDir%\Lib\fixpos.ahk
#Include %A_ScriptDir%\Lib\portalfuncs.ahk
#Include %A_ScriptDir%\Lib\stratergy.ahk


; Image detected
start := "|<>**50$27.gw7k5gwqSbjwzytV1VnNAN+HQr9Mvatt71l1BgTAA"
reward := "|<>**50$45.000000q7vr3jzizzzzzzzrwABgkkkkb9gY6Q6xtA1iriljDkBqxrZtiPUrUqhVvSKrKA"
global ReturnLobby := "|<>**50$46.000w7U03k03kS0090091800Y00Y4U02EDuTHvnt1ltD9vPY61UQ3bCEHa8l6At3CNnCQWYAtbAtsOTl68l7V83UM70nAUD7YwbAnzbvyTka8"
placedUnit := "|<>*105$35.zzzzzzBzzztyNzzznwkAE24NVGYV0sEV801kVWMlXzD7zzzySTzzzzzzzzs"
Victory := "|<>*92$70.zzzTy7ztw7zu00DUQk1wMNkk00s0T01Un3300300w0238AD00M01k0A7UkzkzUw73kMA73z3w7sADVUkwDwDkzkky703kzkz3z33kS0T3z3wDwA01s3wDwDkzkk0DkDkzkz3z301zVzXz3w7sA03y7zzwDsD1kwDsTzzkzU073kzVz3zXz00wDVy7wDyDy07ky7sTkzszy1zbwzXzXU"
Failed := "|<>*46$51.U0MQkMsk00332333000MEMMME003y1z33z3zzUDsMTsTzw0z33z3zz07sMTs0TsET33z03z33sMTs0TksD33z07y01sMTsTzU0733z3zw00sMTsTz1y733z3zsTsMM00Ty3z33003zszwsM04"
tier := "|<>*146$28.zzzzzztzzk0bzzsDzzznzxzzDb1UwyM23nta9zDY1bwyNyTntUNzDb1bzzzzy"
cancelButton := "|<>**50$54.00000001s1z000003s73U00003AC1U00003AANjzyDbzANzvAbsyDANbkA3kQ7AN1WAFWMnANXbAtbtnANzbAtbs7AANWAdWNzCC1kAdkM7673tAtsy7a3zTzjTbxy000000000U"
oktext := "|<>*146$48.003U00003y4k0000C34E0000M0wE0000k0QE0000UsQTzzzzVwATw9blXyAMs03lXyAEk0VVXyA1kUVXXyA3llk3VwA3lls7UsQ1kVs7k0QEk1wDs0wMM1wDy3wQwNwDzzzzzzwTzzzzzzsTzzzzzzszzzzzzzszzzzzzzzzU"

; Level
upgrade0 := "|<>**50$15.XaBkRiPhrBithrBiPhkRj7hzxW2AkNU"
upgrade1 := "|<>**50$13.XcrbPXhlqyvPRhiqrPPhzq8XANU"
upgrade2 := "|<>**50$15.XiBkRiPhrRjnhwRiDhkBi1hzxW2AkNU"
upgrade3 := "|<>**50$15.XaBkRiPhyRhXhzBithkRj7hzxW2AkNU"
upgrade4 := "|<>**50$15.XuBnRiPhnRiHhURjvhzRgPhnxW2AkNU"
upgrade5 := "|<>**50$14.X4PUqtxiDPVqzBjnP1qsRjzMV6MNU"
upgrade6 := "|<>**50$15.XqBsRiDhnpi6hmRinhkRj6hzxW2AkNU"
upgrade7 := "|<>**50$15.W2BURjnhyphahdZjAhv5jMhzRW2AkNU"
upgrade8 := "|<>**50$15.X6BkRiHhmRi3hmRivhkRj7hzxW2AkNU"
upgrade9 := "|<>**50$15.XCBkRinhmRi3hyRjWhkpiQhzRW2AkNU"
upgrade10 := "|<>**50$20.XjAPn1qsnRiBnPvQqqrBhgrPP1qqsxjvzMU16M0NU"
unitmaxed := "|<>**45$32.000001UM000wDU00NaM006DaztVXlzzyMMQ6NaEa1UNY9aQANaNb36TaNUtZdUNaP3SqxXkxztk00000000008"

Levels := [
    upgrade0,
    upgrade1,
    upgrade2,
    upgrade3,
    upgrade4,
    upgrade5,
    upgrade6,
    upgrade7,
    upgrade8,
    upgrade9,
    upgrade10,
    unitmaxed
]

global fixed := false
global fixed2 := false
global roundStart := A_TickCount
global Movement := 0
global played := false

xNull := 738
yNull := 425


nullClick() {
    BetterClick(xNull, yNull)
}

global units := Map( ; Name (str) -> Upgrade(int) -> Placement(int) -> AutoSkill(true/false) -> 1 Click skill(int) -> Coordinate([coor])
    "slot1", Map("name", "", "Upgrade", 0, "slot", 1, "Placement", 3, "AutoSkill", false, "Click1Skill", 1, "Coord", []),
    "slot2", Map("name", "", "Upgrade", 0, "slot", 2, "Placement", 3, "AutoSkill", false, "Click1Skill", 1, "Coord", []),
    "slot3", Map("name", "", "Upgrade", 0, "slot", 3, "Placement", 3, "AutoSkill", false, "Click1Skill", 1, "Coord", []),
    "slot4", Map("name", "", "Upgrade", 0, "slot", 4, "Placement", 3, "AutoSkill", false, "Click1Skill", 1, "Coord", []),
    "taka", Map("name", "Takarado", "Upgrade", 12, "slot", 5, "Placement", 1, "AutoSkill", false, "Click1Skill", 0, "Coord", []),
    "speed", Map("name", "Speedwagon", "Upgrade", 12, "slot", 6, "Placement", 3, "AutoSkill", false, "Click1Skill", 0, "Coord", [])
)

global coords := [
    Map( ; namek
        "Slot1", [[381, 127], [485, 127], [296, 122]],
        "Slot2", [[281, 369], [234, 177], [545, 118]],
        "Slot3", [[352, 151], [450, 149], [250, 117]],
        "Slot4", [[190, 258], [367, 255], [520, 248]],
        "taka", [[179, 127]],
        "speed", [[666, 111], [665, 170], [573, 265]]
    ),

    Map( ; shibuya
        "Slot1", [[174, 203], [122, 181], [146, 244]],
        "Slot2", [[44, 508], [125, 285], [282, 154]],
        "Slot3", [[89, 237], [55, 339], [331, 159]],
        "Slot4", [[315, 111], [181, 71], [73, 158]],
        "taka", [[338, 347]],
        "speed", [[501, 149], [456, 273], [561, 171]]
    )
]

UpdateUnits() {
    global units, Slot1Name, Slot1Upgrade, Slot1Placement, Slot1Auto, Slot1SkillClick
    global Slot2Name, Slot2Upgrade, Slot2Placement, Slot2Auto, Slot2SkillClick
    global Slot3Name, Slot3Upgrade, Slot3Placement, Slot3Auto, Slot3SkillClick
    global Slot4Name, Slot4Upgrade, Slot4Placement, Slot4Auto, Slot4SkillClick

    data := LoadData() ; Load saved data from file

    Loop 4 {
        slotKey := "Slot" A_Index
        unitKey := "slot" A_Index

        if data.Has(slotKey) {
            units[unitKey]["name"] := data[slotKey]["Name"]
            units[unitKey]["Upgrade"] := data[slotKey]["Upgrade"]
            units[unitKey]["Placement"] := data[slotKey]["Placement"]
            units[unitKey]["AutoSkill"] := data[slotKey]["AutoSkill"]
            units[unitKey]["Click1Skill"] := data[slotKey]["ManualSkill"]
        }
    }

    AddToLog("Successfully load data")
}

global Priority := ["First", "Closest", "Last", "Strongest", "Weakest", "Bosses"]


Sell(unitName, coord) {
    nullClick()
    pos := units[unitName]["Coord"][coord]
    Loop 5 {
        if (FindText(&Xe, &Ye, 341, 215, 656, 488, 0, 0, placedUnit)) {
            SendInput("x")
            Sleep 1000
            return true
        } else {
            ClickMethod("Left", pos[1], pos[2])
        }
        Sleep 300
    }
}

PriorityChange(unitName, times, coord) {
    pos := units[unitName]["Coord"][coord]
    ClickMethod("Left", 594, 422)
    Sleep 500
    Loop 5 {
        if (FindText(&Xe, &Ye, 341, 215, 656, 488, 0, 0, placedUnit)) {

            Loop times {
                SendInput("r")
                Sleep 500
            }
            AddToLog("Change " unitName "'s priority target to " Priority[times + 1])
            Sleep 1000
            ClickMethod("Left", 594, 422)
            return true
        } else {
            ClickMethod("Left", pos[1], pos[2])
        }
        Sleep 300
    }
}

EnsurePlacement(unitName, coord) {
    if (!CheckPlacements(unitName, coord)) {
        return true
    }
    pos := units[unitName]["Coord"][coord]
    if (FindText(&Xe, &Ye, 341, 215, 656, 488, 0, 0, placedUnit)) {
        SendInput("q")
        Sleep 100
        nullClick()
        AddToLog("Placed " units[unitName]["name"] " (" Coord ")")
        Sleep 100
        sjwSkill(unitName, coord)
        Sleep 100
        return true
    } else {
        PlaceUnit(pos[1], pos[2], units[unitName]["slot"])
    }
    Sleep 300
}


EnsureUpgrade(unitName, Coord) {
    if (!CheckPlacements(unitName, coord) || units[unitName]["Upgrade"] = 1) {
        return true
    }
    pos := units[unitName]["Coord"][Coord]
    SendInput("q")
    if (FindText(&Xe, &Ye, 341, 215, 656, 488, 0, 0, placedUnit)) {
        MouseMove(170, 555)
        if (FindText(&X, &Y, 472, 250, 652, 478, 0, 0, Levels[units[unitName]["Upgrade"]])) {
            if (units[unitName]["Upgrade"] == 12) {
                AddToLog("Upgraded " units[unitName]["name"] " (" Coord ")" " to Max ")
            } else {
                AddToLog("Upgraded " units[unitName]["name"] " (" Coord ")" " to level " units[unitName]["Upgrade"] - 1)
            }
            nullClick()
            Sleep 500
            AutoSkill(unitName, Coord)
            Sleep 500
            Skill1Click(unitName, Coord)
            SendInput("q")
            return true
        } else {
            SendInput("t")
        }
    } else {
        ClickMethod("Left", pos[1], pos[2])
    }
    Sleep 300
}

AutoSkill(unitName, Coord) {
    if (units[unitName]["AutoSkill"]) {
        nullClick()
        pos := units[unitName]["Coord"][Coord]
        AddToLog("Use " units[unitName]["name"] "'s" " (" Coord ")" " auto skill at " (A_TickCount - roundStart) // 60000 "m" Mod((A_TickCount - roundStart) // 1000, 60) "s")
        BetterClick(pos[1], pos[2])
        Sleep 200
        BetterClick(310, 227) ; Click Auto Skill
        Sleep 200
        nullClick() ; Click outside
        Sleep 200
    }
}

Skill1Click(unitName, Coord) {
    if (units[unitName]["Click1Skill"] >= 4) {
        return
    }
    loop units[unitName]["Click1Skill"] - 1 {
        nullClick()
        pos := units[unitName]["Coord"][Coord]
        AddToLog("Use " units[unitName]["name"] "'s skill at " (A_TickCount - roundStart) // 60000 "m" Mod((A_TickCount - roundStart) // 1000, 60) "s")
        BetterClick(pos[1], pos[2])
        Sleep 200
        BetterClick(318, 257) ; Click Skill
        Sleep 200
        nullClick() ; Click outside
        Sleep 200
        Sleep 5000
    }
}

CheckPlacements(unitName, Current) {
    uPlacements := units[unitName]["Placement"]
    if (uPlacements >= Current) {
        return true
    } else {
        return false
    }
}


; sjw Skill
sjwSkill(unitName, Coord) {
    SendInput("q")
    Sleep 50
    nullClick()
    if (units[unitName]["Click1Skill"] >= 4) {
        pos := units[unitName]["Coord"][Coord]
        AddToLog("Spawning Shadow Soldier (" Coord ") at " (A_TickCount - roundStart) // 60000 "m" Mod((A_TickCount - roundStart) // 1000, 60) "s")
        BetterClick(pos[1], pos[2])
        Sleep 1000
        BetterClick(315, 262) ; Skill
        Sleep 1000
        BetterClick(369, 261) ; shadow
        Sleep 300
        BetterClick(481, 425) ; Spawn bear
        Sleep 300
        BetterClick(405, 308) ; Click Cancel if there are already a bear
        Sleep 200
        BetterClick(214, 427) ; Spawn dead shadow
        Sleep 200
        BetterClick(712, 141) ; Close
        Sleep 200
        nullClick()
    }
}

updateCoord(starter) {
    global units
    units["slot1"]["Coord"] := coords[starter]["Slot1"]
    units["slot2"]["Coord"] := coords[starter]["Slot2"]
    units["slot3"]["Coord"] := coords[starter]["Slot3"]
    units["slot4"]["Coord"] := coords[starter]["Slot4"]
    units["taka"]["Coord"] := coords[starter]["taka"]
    units["speed"]["Coord"] := coords[starter]["speed"]
}

StartPlaying() {
    global autoMacro, mapStarter, fixed, fixed2, Movement
    while (autoMacro) {
        BetterClick(561, 73) ; close lb
        Sleep 50
        SendInput("{Left Down}")
        Sleep 200
        SendInput("{Left Up}")
        if (FindText(&X, &Y, 936, 227, 1131, 460, 0.1, 0.1, tier)) {
            AddToLog("Map loaded")
            break
        }
        Sleep 1000
    }
    updateCoord(mapStarter)
    Sleep 1000
    BetterClick(561, 73) ; close lb
    while (autoMacro) {
        antiSoftLock()
        if (fixed and fixed2) {
            if (played) {
                if (!LoadStrats) {
                    Strat1()
                } else {
                    Strat2()
                }
            }
        } else if (!fixed2 and !fixed) {
            fixed := fixposition(mapStarter)
        } else {
            nullClick()
            Sleep 1000
        }
    }
}

antiSoftLock() {
    global mapStarter, fixed, fixed2, Movement, played, roundStart
    portalcoord := false
    ; check end screen
    if (ok := FindText(&X, &Y, 505, 69, 991, 357, 0, 0, cancelButton)) {
        SendInput("q")
        BetterClick(405, 308)
        Sleep 500
    }

    if (FindText(&X, &Y, 867, 442, 1034, 500, 0, 0, ReturnLobby)) {
        if (fixed and !fixed2) {
            fixed2 := true
            played := false
            Sleep 1000
            BetterClick(212, 426) ; open portal inventory
            Sleep 2000
            if (portalcoord := SearchForPortal("Winter", mapStarter)) {
                BetterClick(xportal + portalcoord[1], yportal + portalcoord[2])
                Sleep 500
                BetterClick(352, 312) ; Accept
                Sleep 2000
            } else {
                fixed := false
                fixed2 := false
                AddToLog("Couldn't find " maps[mapStarter][3] " portal, Searching for another portal")
                Sleep 500
                if (mapStarter = 1) {
                    mapStarter := 2
                } else {
                    mapStarter := 1
                }
                maximum_search := 20
                i := 0
                while (i < maximum_search and mapStarter < coords.Length+1 and !portalcoord := SearchForPortal("Winter", mapStarter)) {
                    mapStarter := Mod(mapStarter, coords.Length)+1
                    i++
                    BetterClick(321, 160)
                    Sleep 50
                    BetterClick(321, 160)
                }

                if (portalcoord) {
                    BetterClick(xportal + portalcoord[1], yportal + portalcoord[2])
                    Sleep 500
                    BetterClick(352, 312) ; Accept
                    updateCurrentMap(mapStarter)
                    Sleep 20000
                } else {
                    AddToLog("Couldn't find any portal")
                    AddToLog("Macro stop")
                    StopMacro()
                }

            }
        } else {
            ; Send win / lost
            played := false
            if (FindText(&X, &Y, 537, 178, 744, 303, 0, 0, Victory)) {
                AddToLog("Match win")
                updateWin(true)
            } else if (FindText(&X, &Y, 537, 178, 744, 303, 0, 0, Failed)) {
                updateWin()
                AddToLog("Match lost")
            } else {
                updateWin(true)
                AddToLog("Couldn't detect find match status, assuming winning")
            }
            Sleep 5000
            ;Selecting win
            BetterClick(212, 426) ; open portal inventory
            Sleep 2000
            if (portalcoord := SearchForPortal("Winter", mapStarter)) {
                BetterClick(xportal + portalcoord[1], yportal + portalcoord[2])
                Sleep 500
                BetterClick(352, 312) ; Accept
                Sleep 2000
            } else {
                fixed := false
                fixed2 := false
                AddToLog("Couldn't find " maps[mapStarter][3] " portal, Searching for another portal")
                Sleep 500
                if (mapStarter = 1) {
                    mapStarter := 2
                } else {
                    mapStarter := 1
                }
                maximum_search := 20
                i := 0
                while (i < maximum_search and mapStarter < coords.Length+1 and !portalcoord := SearchForPortal("Winter", mapStarter)) {
                    mapStarter := Mod(mapStarter, coords.Length)+1
                    i++
                    BetterClick(321, 160)
                    Sleep 50
                    BetterClick(321, 160)
                }

                if (portalcoord) {
                    BetterClick(xportal + portalcoord[1], yportal + portalcoord[2])
                    Sleep 500
                    BetterClick(352, 312) ; Accept
                    updateCurrentMap(mapStarter)
                    Sleep 20000
                } else {
                    AddToLog("Couldn't find any portal")
                    AddToLog("Macro stop")
                    StopMacro()
                }
                
            }
        }
    }

    if (ok := FindText(&X, &Y, 328, 47, 1119, 623, 0, 0, oktext)){
        SendInput("q")
        Sleep 200
        BetterClick(X,Y)
        Sleep 200
    }

    if (ok := FindText(&X, &Y, 594, 69, 926, 300, 0, 0, start)) {
        SendInput("q")
        updateCoord(mapStarter)
        Movement := 0
        BetterClick(369, 126) ; Click Start
        roundStart := A_TickCount
        if (fixed and fixed2) {
            played := true
        }
        Sleep 500
    }

    if (ok := FindText(&X, &Y, 616, 213, 865, 262, 0, 0, reward)) {
        Movement := 300
        AddToLog("Found reward")
        nullClick()
        Sleep 100
        for index, text in maps {
            MouseMove(297, 278)
            Sleep 1000
            if (ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, maps[A_Index][1]) || ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, maps[A_Index][2])) {
                AddToLog("Claiming " maps[A_Index][3] " portal")
                BetterClick(297, 335) ; Claim reward
                Sleep 500
                BetterClick(364, 311)
                Sleep 500
                BetterClick(401, 307)
                return
            }

            MouseMove(402, 282)
            Sleep 1000
            if (ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, maps[A_Index][1]) || ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, maps[A_Index][2])){
                AddToLog("Claiming " maps[A_Index][3] " portal")
                BetterClick(398, 344) ; Claim reward
                Sleep 500
                BetterClick(364, 311)
                Sleep 500
                BetterClick(401, 307)
                return
            }

            MouseMove(515, 283) ; Third
            Sleep 1000
            if (ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, maps[A_Index][1]) || ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, maps[A_Index][2])) {
                AddToLog("Claiming " maps[A_Index][3] " portal")
                BetterClick(511, 343) ; Claim reward
                Sleep 500
                BetterClick(364, 311)
                Sleep 500
                BetterClick(401, 307)
                return
            }
        }

        AddToLog("Couldn't detect portal type, claiming 3rd portal")
        BetterClick(511, 343)
        Sleep 200
        BetterClick(364, 311)
        Sleep 500
        BetterClick(401, 307)
        return
    }
}