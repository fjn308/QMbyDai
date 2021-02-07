IfExist, *.png
FileDelete, *.png
IfExist, ready.txt
FileDelete, ready.txt

Loop
{
    IfExist, *.png
    {
        status := "initial"
        FileRead, status, status.txt
        If InStr(status, "onenote")
        {
            Sleep, 1000
            status := "initial"
            FileRead, status, status.txt
            If InStr(status, "onenote")
            FileDelete, *.png
        }
        Else If InStr(status, "outside")
        {
            cache := "nothing"
            last := "nothing"
            Loop, Read, log.txt
            {
                last := cache
                cache := A_LoopReadLine
            }
            If last Contains STOP
            FileDelete, *.png
        }
    }
    Sleep, 1000
}

^h::
status := "initial"
FileRead, status, status.txt
If InStr(status, "onenote")
{
    IfExist, *.png
    FileDelete, *.png
    IfExist, ready.txt
    FileDelete, ready.txt
    Send, #{PrintScreen}
    Loop
    {
        IfExist, *.png
        Break
        Sleep, 300
    }
    FileMove, *.png, ps.png
    FileAppend, go, ready.txt
    Loop
    {
        status := "initial"
        FileRead, status, status.txt
        If InStr(status, "outside")
        Break
        Sleep, 300
    }
    Send, {F11}
    FileDelete, ready.txt
}
Return