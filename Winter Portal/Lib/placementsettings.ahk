#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2
#Include %A_ScriptDir%\Lib\Discord-Webhook-master\lib\WEBHOOK.ahk
#Include %A_ScriptDir%\Lib\AHKv2-Gdip-master\Gdip_All.ahk
#Include %A_ScriptDir%\main.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk

global file_path := "/Lib/UnitPlacements/placement.json"



width := 1000
height := 370

PlacementGUI := Gui("+AlwaysOnTop")
PlacementGUI.Title := "Placement UI"

PlacementGUI.SetFont("s20 bold", "Segoe UI")
PlacementGUI.Add("Text", "x0 w" width " cWhite +Center", "Unit placements")

;global Slot 1
PlacementGUI.SetFont("s16 bold", "Segoe UI")
PlacementGUI.Add("GroupBox", "x40 y80 w200 h275 cfffff +Center", "Slot 1")
PlacementGUI.SetFont("s10", "Segoe UI")

PlacementGUI.Add("Text", "x60 y120 cWhite", "Unit 1 name:")
global Slot1Name := PlacementGUI.Add("Edit", "x60 y140 w160", "")

PlacementGUI.Add("Text", "x60 y170 cWhite", "Upgrade:")
global Slot1Upgrade := PlacementGUI.Add("DropDownList", "x60 y190 w160", [0,1,2,3,4,5,6,7,8,9,10,"MAX"])
Slot1Upgrade.Choose(1)

PlacementGUI.Add("Text", "x60 y220 cWhite", "Placements:")
global Slot1Placement := PlacementGUI.Add("DropDownList", "x60 y240 w160", [1,2,3])
Slot1Placement.Choose(3)

global Slot1Auto := PlacementGUI.Add("Checkbox","x60 y270 w160 cWhite", "Auto Skill")

PlacementGUI.Add("Text", "x60 y295 cWhite", "Manual skill:")
global Slot1SkillClick := PlacementGUI.Add("DropDownList", "x60 y315 w160", [0,1,2, "Shadow Summon"])
Slot1SkillClick.Choose(1)


;global Slot 2
PlacementGUI.SetFont("s16 bold", "Segoe UI")
PlacementGUI.Add("GroupBox", "x280 y80 w200 h275 cfffff +Center", "Slot 2")
PlacementGUI.SetFont("s10", "Segoe UI")

PlacementGUI.Add("Text", "x300 y120 cWhite", "Unit 2 name:")
global Slot2Name := PlacementGUI.Add("Edit", "x300 y140 w160", "")

PlacementGUI.Add("Text", "x300 y170 cWhite", "Upgrade:")
global Slot2Upgrade := PlacementGUI.Add("DropDownList", "x300 y190 w160", [0,1,2,3,4,5,6,7,8,9,10,"MAX"])
Slot2Upgrade.Choose(1)

PlacementGUI.Add("Text", "x300 y220 cWhite", "Placements:")
global Slot2Placement := PlacementGUI.Add("DropDownList", "x300 y240 w160", [1,2,3])
Slot2Placement.Choose(3)

global Slot2Auto := PlacementGUI.Add("Checkbox","x300 y270 w160 cWhite", "Auto Skill")

PlacementGUI.Add("Text", "x300 y295 cWhite", "Manual skill:")
global Slot2SkillClick := PlacementGUI.Add("DropDownList", "x300 y315 w160", [0,1,2, "Shadow Summon"])
Slot2SkillClick.Choose(1)


;global Slot 3
PlacementGUI.SetFont("s16 bold", "Segoe UI")
PlacementGUI.Add("GroupBox", "x520 y80 w200 h275 cfffff +Center", "Slot 3")
PlacementGUI.SetFont("s10", "Segoe UI")

PlacementGUI.Add("Text", "x540 y120 cWhite", "Unit 3 name:")
global Slot3Name := PlacementGUI.Add("Edit", "x540 y140 w160", "")

PlacementGUI.Add("Text", "x540 y170 cWhite", "Upgrade:")
global Slot3Upgrade := PlacementGUI.Add("DropDownList", "x540 y190 w160", [0,1,2,3,4,5,6,7,8,9,10,"MAX"])
Slot3Upgrade.Choose(1)

PlacementGUI.Add("Text", "x540 y220 cWhite", "Placements:")
global Slot3Placement := PlacementGUI.Add("DropDownList", "x540 y240 w160", [1,2,3])
Slot3Placement.Choose(3)

global Slot3Auto := PlacementGUI.Add("Checkbox","x540 y270 w160 cWhite", "Auto Skill")

PlacementGUI.Add("Text", "x540 y295 cWhite", "Manual skill:")
global Slot3SkillClick := PlacementGUI.Add("DropDownList", "x540 y315 w160", [0,1,2, "Shadow Summon"])
Slot3SkillClick.Choose(1)

;global Slot 4
PlacementGUI.SetFont("s16 bold", "Segoe UI")
PlacementGUI.Add("GroupBox", "x760 y80 w200 h275 cfffff +Center", "Slot 4")
PlacementGUI.SetFont("s10", "Segoe UI")

PlacementGUI.Add("Text", "x780 y120 cWhite", "Unit 4 name:")
global Slot4Name := PlacementGUI.Add("Edit", "x780 y140 w160", "")

PlacementGUI.Add("Text", "x780 y170 cWhite", "Upgrade:")
global Slot4Upgrade := PlacementGUI.Add("DropDownList", "x780 y190 w160", [0,1,2,3,4,5,6,7,8,9,10,"MAX"])
Slot4Upgrade.Choose(1)

PlacementGUI.Add("Text", "x780 y220 cWhite", "Placements:")
global Slot4Placement := PlacementGUI.Add("DropDownList", "x780 y240 w160", [1,2,3])
Slot4Placement.Choose(3)

global Slot4Auto := PlacementGUI.Add("Checkbox","x780 y270 w160 cWhite", "Auto Skill")

PlacementGUI.Add("Text", "x780 y295 cWhite", "Manual skill:")
global Slot4SkillClick := PlacementGUI.Add("DropDownList", "x780 y315 w160", [0,1,2, "Shadow Summon"])
Slot4SkillClick.Choose(1)


Strats := PlacementGUI.Add("Checkbox","x60 y30 w250 cWhite", "SJW 2nd evo slot1 strat")

; Save
PlacementGUI.SetFont("s12 bold", "Segoe UI")
SavePlacementbttn := PlacementGUI.Add("Button", "x840 y20 w120 +BackgroundTrans +Center", "Save")
SavePlacementbttn.OnEvent("Click",(*) => SavePlacement())


PlacementGUI.BackColor := "0b1329"
PlacementGUI.MarginX := 20
PlacementGUI.MarginY := 20
SavePlacement() {
    file_path := A_ScriptDir "\Lib\UnitPlacements\placement.txt"
    strats_path := A_ScriptDir "\Lib\UnitPlacements\strategy.txt"
    dir_path := A_ScriptDir "\Lib\UnitPlacements"

    if !DirExist(dir_path) {
        MsgBox("Error: Directory does not exist: " dir_path)
        return
    }

    text := ""
    strattext := Strats.Value

    Loop 4 {
        slot := "Slot" A_Index
        text .= slot "|" %slot%Name.Value "|" %slot%Upgrade.Value "|" %slot%Placement.Value "|" %slot%Auto.Value "|" %slot%SkillClick.Value "`n"
    }


    try {
        FileDelete(file_path)
        FileAppend(text, file_path, "UTF-8")

        FileDelete(strats_path)
        FileAppend(strattext, strats_path, "UTF-8")

    } catch {
        MsgBox("Error writing to file: " file_path)
    }

    PlacementGUI.Hide()
}

LoadData() {
    file_path := A_ScriptDir "\Lib\UnitPlacements\placement.txt"

    if !FileExist(file_path) {
        MsgBox("No saved data found. Using default values.")
        return {}
    }

    slots := Map()
    dataLines := StrSplit(FileRead(file_path), "`n", "`r")

    for line in dataLines {
        if (Trim(line) = "") {
            continue
        }

        parts := StrSplit(line, "|")
        slot := parts[1]

        slots[slot] := Map()
        slots[slot]["Name"] := parts[2]
        slots[slot]["Upgrade"] := parts[3]
        slots[slot]["Placement"] := parts[4]
        slots[slot]["AutoSkill"] := (parts[5] = "1")
        slots[slot]["ManualSkill"] := parts[6]
    }

    return slots
}

LoadStrats(){
    file_path := A_ScriptDir "\Lib\UnitPlacements\strategy.txt"
    if !FileExist(file_path) {
        MsgBox("No saved data found. Using default values.")
        return {}
    }
    n := FileRead(file_path)
    Strats.Value := n="1"
    return n="1"
}


PlacementSettingUI() { 
    data := LoadData() ; Load saved data from file
    LoadStrats()
    if data.Has("Slot1") {
        Slot1Name.Value := data["Slot1"]["Name"]
        Slot1Upgrade.Value := data["Slot1"]["Upgrade"]
        Slot1Placement.Value := data["Slot1"]["Placement"]
        Slot1Auto.Value := data["Slot1"]["AutoSkill"]
        Slot1SkillClick.Value := data["Slot1"]["ManualSkill"]
    }

    if data.Has("Slot2") {
        Slot2Name.Value := data["Slot2"]["Name"]
        Slot2Upgrade.Value := data["Slot2"]["Upgrade"]
        Slot2Placement.Value := data["Slot2"]["Placement"]
        Slot2Auto.Value := data["Slot2"]["AutoSkill"]
        Slot2SkillClick.Value := data["Slot2"]["ManualSkill"]
    }

    if data.Has("Slot3") {
        Slot3Name.Value := data["Slot3"]["Name"]
        Slot3Upgrade.Value := data["Slot3"]["Upgrade"]
        Slot3Placement.Value := data["Slot3"]["Placement"]
        Slot3Auto.Value := data["Slot3"]["AutoSkill"]
        Slot3SkillClick.Value := data["Slot3"]["ManualSkill"]
    }

    if data.Has("Slot4") {
        Slot4Name.Value := data["Slot4"]["Name"]
        Slot4Upgrade.Value := data["Slot4"]["Upgrade"]
        Slot4Placement.Value := data["Slot4"]["Placement"]
        Slot4Auto.Value := data["Slot4"]["AutoSkill"]
        Slot4SkillClick.Value := data["Slot4"]["ManualSkill"]
    }

    PlacementGUI.Show("w" width " h" height)
}

; CREDIT TO s.isme (Discord)