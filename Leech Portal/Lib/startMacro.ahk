#Requires AutoHotkey v2.0

#Include %A_ScriptDir%\Lib\webhooksettings.ahk
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\otherfuncs.ahk

xNull := 738
yNull := 425


nullClick() {
    BetterClick(xNull, yNull)
}

reward := "|<>**50$45.000000q7vr3jzizzzzzzzrwABgkkkkb9gY6Q6xtA1iriljDkBqxrZtiPUrUqhVvSKrKA"
start := "|<>**50$27.gw7k5gwqSbjwzytV1VnNAN+HQr9Mvatt71l1BgTAA"

namek1 := "|<>*85$26.2Tzyk7zzgVW612GZ8nY90YxWK9U"
namek2 := "|<>*88$27.BzzyMjzzn5W1W09EdF92J21gGgGU"

sandvillage1 := ""
sandvillage2 := ""

dd1 := "|<>*76$35.zzzzzy7zzzzw7zzzztd0lX43G4+4V0U84923WGAMZzzwTzzzztzzzzzzzzs"
dd2 := "|<>*81$29.3zwty3ztnwq90a9d258GGU2EVlW6lU"

shibuyastation1 := ""
shibuyastation2 := ""

shibuyaafter1 := "|<>*100$31.zzzzzlC7zzmbnzzwkUG4X9Ed8YIc44EWI37QTzzzDs"
shibuyaafter2 := "|<>*96$43.vZzzzyntmzzzzNsEAF0l4ABgdVGqI2q4mcN8RNWNKAZU"

underground1 := "|<>*83$51.BznzzzzzlbyTzzzzyA32820Y31V219GEV2V8092E084N8lAH618zzzzXzzzzzzzwzzzzU"
underground2 := "|<>*81$27.kTzww3zzbC4U09m49YYE10Y2EA4U"

bleach1 := "|<>*74$22.XwwgDzylV00mIAgcEmMV39yTzztzzs"
bleach2 := "|<>*79$28.XznvwDzzjllUU4mEk34d10YMlUWPzzzzDzzzxs"

portal_array := [
    [[namek1, namek2, "Namek"], [shibuyaafter1, shibuyaafter2, "Shibuya Aftermatch"]], ; Winter
    [[namek1, namek2, "Namek"], [dd1, dd2, "Double Dungeon"], [bleach1, bleach2, "Spirit Society"], [underground1, underground2, "Underground Church"]]  ; Love
]

StartMacro() {
    global PortalMap
    current_type := PortalMap.Value
    while (autoMacro) {
        AntiSoftLock()
        Claiming(current_type)
        nullClick()
        Sleep 1000
    }
}

AntiSoftLock() {
    if (ok := FindText(&X, &Y, 594, 69, 926, 300, 0, 0, start)) {
        Movement := 0
        BetterClick(369, 126) ; Click Start
        Sleep 500
    }
}

Claiming(nums){
    if (ok := FindText(&X, &Y, 616, 213, 865, 262, 0, 0, reward)) {
            Movement := 300
            AddToLog("Found reward")
            nullClick()
            Sleep 100
            for index, text in portal_array[nums] {
                MouseMove(297, 278)
                Sleep 1000
                if (ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, portal_array[nums][A_Index][1]) || ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, portal_array[nums][A_Index][2])) {
                    AddToLog("Claiming " portal_array[nums][A_Index][3] " portal")
                    updateClaim()
                    BetterClick(297, 335) ; Claim reward
                    Sleep 500
                    BetterClick(364, 311)
                    Sleep 500
                    BetterClick(401, 307)
                    return
                }

                MouseMove(402, 282)
                Sleep 1000
                if (ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, portal_array[nums][A_Index][1]) || ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, portal_array[nums][A_Index][2])) {
                    AddToLog("Claiming " portal_array[nums][A_Index][3] " portal")
                    updateClaim()
                    BetterClick(398, 344) ; Claim reward
                    Sleep 500
                    BetterClick(364, 311)
                    Sleep 500
                    BetterClick(401, 307)
                    return
                }

                MouseMove(515, 283) ; Third
                Sleep 1000
                if (ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, portal_array[nums][A_Index][1]) || ok := FindText(&X, &Y, 529, 250, 1127, 611, 0.1, 0.1, portal_array[nums][A_Index][2])) {
                    AddToLog("Claiming " portal_array[nums][A_Index][3] " portal")
                    updateClaim()
                    BetterClick(511, 343) ; Claim reward
                    Sleep 500
                    BetterClick(364, 311)
                    Sleep 500
                    BetterClick(401, 307)
                    return
                }
            }

            AddToLog("Couldn't detect portal type, claiming 3rd portal")
            updateClaim()
            BetterClick(511, 343)
            Sleep 200
            BetterClick(364, 311)
            Sleep 500
            BetterClick(401, 307)
            return
        }
}