#Requires AutoHotkey v2
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\webhooksettings.ahk
#Include %A_ScriptDir%\Lib\Discord-Webhook-master\lib\WEBHOOK.ahk
#Include %A_ScriptDir%\main.ahk
#Include %A_ScriptDir%\Lib\gui.ahk
SendMode "Event"

SearchDelay := 1000


VoteStart() {
    BetterClick(365, 120)
}

ClickMethod(button, x, y, clickDelay := 0) {
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick("Left", -1, 0, , , , "R")
}




LookDown() {
    BetterClick(700, 299)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 1000
    MouseGetPos(&x, &y)
    SendInput(Format("{Click {} {} Left}", x, y + 150))
	Sleep 1000

    loop 20 {
        SendInput("{WheelDown}")
        Sleep 50
    }
}

PlaceUnit(x, y, slot) {
    Send(slot)
    Sleep (SearchDelay / 2)
    clickmethod("Left", x, y)
}

	


ChatGPTSleep(lPeriod) { ; also credits to yuh + chatgpt for this
    if (hTimer := DllCall("CreateWaitableTimerExW", "ptr", 0, "ptr", 0, "uint", 3, "uint", 0x1F0003, "uptr"))
		&& DllCall("SetWaitableTimer", "uptr", hTimer, "uint64*", lPeriod * -10000, "int", 0, "ptr", 0, "ptr", 0, "int", 0)
		DllCall("WaitForSingleObject", "uptr", hTimer, "UInt", 0xFFFFFFFF), DllCall('CloseHandle', "uptr", hTimer)
}


InitiateWebhook() {
    global webhook
    global WebhookURL := FileRead(WebhookURLFile, "UTF-8")
    global DiscordUserID := FileRead(DiscordUserIDFile, "UTF-8")

    if (webhookURL ~= 'i)https?:\/\/discord\.com\/api\/webhooks\/(\d{18,19})\/[\w-]{68}') {
        global webhook := WebHookBuilder(WebhookURL)
        SendWebhook()
    }
}

AddToLog(text) {
    global lastlog
    SendActivityLogsStatus := FileRead(SendActivityLogsFile, "UTF-8")
    ActivityLog.Value := text "`n" ActivityLog.Value
    if FileExist(SendActivityLogsFile) && (SendActivityLogsStatus = "1") {
        lastlog := text
        WebhookLog()
    }
}


StopMacro() {
    global WebhookURL := FileRead(WebhookURLFile, "UTF-8")
    global DiscordUserID := FileRead(DiscordUserIDFile, "UTF-8")

    if (webhookURL ~= 'i)https?:\/\/discord\.com\/api\/webhooks\/(\d{18,19})\/[\w-]{68}') {
        global webhook := WebHookBuilder(WebhookURL)
        EndWebhook()
    } 
    Reload()
}

BetterClick(x, y) { ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick("Left", -1, 0, , , , "R")
    Sleep(50)
}

WebhookLog() {
    global WebhookURL := FileRead(WebhookURLFile, "UTF-8")
    global DiscordUserID := FileRead(DiscordUserIDFile, "UTF-8")

    if (webhookURL ~= 'i)https?:\/\/discord\.com\/api\/webhooks\/(\d{18,19})\/[\w-]{68}') {
        global webhook := WebHookBuilder(WebhookURL)
        TextWebhook()
    } 
}


SensitivityCalculator() {
    width := A_ScreenWidth
    height := A_ScreenHeight

    SensitivityCalc := ((width*width) + (height*height)) / ((1920*1920) + (1080*1080))
    Sensitivity := (0.15 * Sqrt(SensitivityCalc))
    Sensitivity := Format("{:.3f}", Sensitivity)
    SensitivityString := "" Sensitivity
    loop {
        if (SubStr(SensitivityString, -1) = "0") {
            SensitivityString := SubStr(SensitivityString, 1, (StrLen(SensitivityString) - 1))
            
        }
        else {
            break
        }
    }
   return SensitivityString
}

