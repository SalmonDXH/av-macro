#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk

; image detected


namek := "|<>*85$26.2Tzyk7zzgVW612GZ8nY90YxWK9U"
namek2 := "|<>*88$27.BzzyMjzzn5W1W09EdF92J21gGgGU"
shibuya := "|<>*100$31.zzzzzlC7zzmbnzzwkUG4X9Ed8YIc44EWI37QTzzzDs"
shibuya2 := "|<>*96$43.vZzzzyntmzzzzNsEAF0l4ABgdVGqI2q4mcN8RNWNKAZU"

global xportal := 208
global yportal := 256
global xstartportal := 302
global ystartportal := 306

global maps := [ ; Image -> Name
    [namek, namek2, "Namek"],
    [shibuya, shibuya2, "Shibuya"]
]
; After turning on inventory gui
SearchForPortal(portalType, nums){
    ; Portal size (height = extra , width = extra)

    ; first portak
    extra := 73
    BetterClick(217, 198) ; Click on the search bar
    Sleep 500
    TypeText(portalType) ; Example search for "Love" or "WW" (ww for winter)
    Sleep 5000
    AddToLog("Searching for " maps[nums][3] " portal")
    loop 3 {
        multi_y := A_Index
        loop 6 {
            multi_x := A_Index
            MouseMove(xportal+extra*(multi_x-1), yportal+extra*(multi_y-1)) ; Hover portal to show the detail
            if (ok:=FindText(&Xe, &Ye, 452, 142, 1128, 576, 0.1, 0.1, maps[nums][1]) || ok:=FindText(&Xe, &Ye, 452, 142, 1128, 576, 0.1, 0.1, maps[nums][2])){
                AddToLog("Found " maps[nums][3] " portal (" portalType ")" )
                Sleep 500
                return [extra*(multi_x-1), extra*(multi_y-1)] ; return the coordinate of that portal
            }
            Sleep 1000
        }
    }
    return ; return when it couldn't find the portal
}