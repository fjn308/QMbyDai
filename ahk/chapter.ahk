IfExist, chapter.txt
FileDelete, chapter.txt
i := 1
FileAppend, CHAPTER01=00:00:00.000, chapter.txt
FileAppend, `r`nCHAPTER01NAME=unknown, chapter.txt
Loop, Parse, Clipboard, `n, `r
{
    i := i + 1
    temp1 := StrReplace(A_LoopField, " - Scene changed to ", ",")
    temp2 := StrSplit(temp1, ",")
    If (i < 10)
    {
        chapter := "CHAPTER0" i "=" temp2[1]".000"
        name := "CHAPTER0" i "NAME=" temp2[2]
        FileAppend, `r`n%chapter%, chapter.txt
        FileAppend, `r`n%name%, chapter.txt
    }
    Else
    {
        chapter := "CHAPTER" i "=" temp2[1]".000"
        name := "CHAPTER" i "NAME=" temp2[2]
        FileAppend, `r`n%chapter%, chapter.txt
        FileAppend, `r`n%name%, chapter.txt
    }
    If (i = 100)
    {
        MsgBox, Over 100 chapters? Come on!
        Break
    }
}
MsgBox, Done.
