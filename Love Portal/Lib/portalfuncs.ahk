#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk

; image detected
namek := "|<>*85$26.2Tzyk7zzgVW612GZ8nY90YxWK9U"
bleach := "|<>*74$22.XwwgDzylV00mIAgcEmMV39yTzztzzs"
underground :=  "|<>*83$51.BznzzzzzlbyTzzzzyA32820Y31V219GEV2V8092E084N8lAH618zzzzXzzzzzzzwzzzzU"
dd := "|<>*76$35.zzzzzy7zzzzw7zzzztd0lX43G4+4V0U84923WGAMZzzwTzzzztzzzzzzzzs"
shibuya := "|<>**50$32.WI800/bnzzysG9GlnIeKdKZ2pmK9GQRlU"

namek2 :="|<>*88$27.BzzyMjzzn5W1W09EdF92J21gGgGU"
bleach2 := "|<>*79$28.XznvwDzzjllUU4mEk34d10YMlUWPzzzzDzzzxs"
underground2 :="|<>*81$27.kTzww3zzbC4U09m49YYE10Y2EA4U"
dd2 := "|<>*81$29.3zwty3ztnwq90a9d258GGU2EVlW6lU"

global xportal := 208
global yportal := 256
global xstartportal := 304
global ystartportal := 317

global maps := [ ; Image -> Name
    [namek, namek2,"Namek"],
    [bleach, bleach2,"Spirit Society"],
    [dd, dd ,"Double Dungeon"],
    [underground, underground2 ,"Underground Church"]
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