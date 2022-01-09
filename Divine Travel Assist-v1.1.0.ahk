; Divine Travel Assist Macro
; by oyamelon
; v1.1.0

; SortArray by https://sites.google.com/site/ahkref/custom-functions/sortarray


; You can change it to any hotkey in line 292. The default is Ctrl & D (^D)

;-------------------------------------
; Variables to configure (I'm using DeepL for translation)
Global F3ResultType := 1              ; Select the calculation result when using F3 + C. 1 is both Safe Coord and Highroll Coord. 2 is Safe Coord only. 3 is Highrool Coord only.
Global F3SafeHighDisplay := False     ; Include the letters Safe and High in the calculation results when using F3 + C to make it easier to understand visually.
Global NormalResultType := 3          ; This is the type when only the coordinates are obtained without using F3 + C. The number is the same as F3ResultType.
Global NormalSafeHighDisplay := False ; When only the coordinates are obtained without using F3 + C, the letters Safe and High are inserted to make it easier to understand visually.
Global NinbHotKey := "F6"             ; If you are using Ninjabrain Bot, you will operate Ninjabrain Bot when you press C, so when you calculate using F3 + C, cancel the operation of Ninjabrain Bot. Select the Ninjabrain Bot Undo or Reset hotkey. Leave blank if you do not want to cancel the operation.
;-------------------------------------

#InstallKeybdHook

 DivineSelect()
 {
  Gui, Add, Button, X10 Y10 W40 Center G0, 0
  N := 0
  Loop, 7
  {
    N += 1
    Gui, Add, Button, X+10 W40 Center G%N%, %N%
  }
  Gui, Add, Button, X10 W40 Center G8, 8
  N := 8
  Loop, 7
  {
    N += 1
    Gui, Add, Button, X+10 W40 Center G%N%, %N%
  }
  GUI, Show, W410 H70
 }

 0:
    CheckClipboard(0)
    GUI, Destroy
 return

 1:
    CheckClipboard(1)
    GUI, Destroy
 return

 2:
    CheckClipboard(2)
    GUI, Destroy
 return

 3:
    CheckClipboard(3)
    GUI, Destroy
 return

 4:
    CheckClipboard(4)
    GUI, Destroy
 return

 5:
    CheckClipboard(5)
    GUI, Destroy
 return

 6:
    CheckClipboard(6)
    GUI, Destroy
 return

 7:
    CheckClipboard(7)
    GUI, Destroy
 return

 8:
    CheckClipboard(8)
    GUI, Destroy
 return

 9:
    CheckClipboard(9)
    GUI, Destroy
 return

 10:
    CheckClipboard(10)
    GUI, Destroy
 return

 11:
    CheckClipboard(11)
    GUI, Destroy
 return

 12:
    CheckClipboard(12)
    GUI, Destroy
 return

 13:
    CheckClipboard(13)
    GUI, Destroy
 return

 14:
    CheckClipboard(14)
    GUI, Destroy
 return

 15:
    CheckClipboard(15)
    GUI, Destroy
 return

CheckClipboard(n)
{
    Global F3ResultType
    Global SafeHighDisplay
    Global NormalResultType


    IfInString, ClipBoard, /execute in minecraft:the_nether run tp @s
    {
        F3ClipBoard := True
        NinbCancel() 
    }
    Else
    {
        F3ClipBoard := False
    }

	array1 := StrSplit(Clipboard, " ")
	fullx := array1[7]
	fullz := array1[9]
	arrayx := StrSplit(fullx, ".")
	arrayz := StrSplit(fullz, ".")
	x := arrayx[1]
	z := arrayz[1]


    DC := DivineCoords(n)
    If F3ClipBoard
    {
        If F3SafeHighDisplay
        {
            F3SafeDisplay := "Safe "
            F3HighDisplay := "High "
        }
        If (F3ResultType = 2 or F3ResultType = 1)
        {
            safedistance := F3SafeDisplay DistanceCalc(x, z, DC[2], DC[3], DC[4], DC[5], DC[6], DC[7])
            distance := safedistance
        }
	    If (F3ResultType = 3 or F3ResultType = 1)
        {
            highdistance := F3HighDisplay DistanceCalc(x, z, DC[8], DC[9], DC[10], DC[11], DC[12], DC[13])
            distance := highdistance
        }
        if (F3ResultType = 1)
        {
            distance := safedistance " " highdistance
        }
        d := DC[1]
	    ClipBoard = %d%: %distance%
    }
    Else
    {
        If NormalSafeHighDisplay
        {
            NormalSafeDisplay := " Safe"
            NormalHighDisplay := " High"
        }
        If (NormalResultType = 2 or NormalResultType = 1)
        {
            safedistance := NormalSafeDisplay DC[2] DC[3] " |" DC[4] DC[5] " |" DC[6] DC[7]
            distance := safedistance
        }
        If (NormalResultType = 3 or NormalResultType = 1)
        {
            highdistance := NormalHighDisplay DC[8] DC[9] " |" DC[10] DC[11] " |" DC[12] DC[13]
            distance := highdistance
        }
        if (NormalResultType = 1)
        {
            distance := safedistance " |" highdistance
        }
        d := DC[1]
	    ClipBoard = %d%:%distance%
    }
    
}

DivineCoords(n)
{
    DivineCoord0 = 0, 251, 50, -169, 192, -82, -242, 186, 37, -125, 143, -61, -180
    DivineCoord1 = 1, 213, 142, -230, 113, 17, -255, 158, 106, -170, 84, 12, -190
    DivineCoord2 = 2, 142, 213, -255, 17, 113, -230, 106, 158, -190, 12, 84, -170
    DivineCoord3 = 3, 50, 251, -242, -82, 192, -169, 37, 186, -180, -61, 143, -125
    DivineCoord4 = 4, -50, 251, -192, -169, 242, -82, -37, 186, -143, -125, 180, -61
    DivineCoord5 = 5, -142, 213, -113, -230, 255, 17, -106, 158, -84, -170, 190, 12
    DivineCoord6 = 6, -213, 142, -17, -255, 230, 113, -158, 106, -12, -190, 170, 84
    DivineCoord7 = 7, -251, 50, 82, -242, 169, 192, -186, 37, 61, -180, 125, 143
    DivineCoord8 = 8, -251, -50, 169, -192, 82, 242, -186, -37, 125, -143, 61, 180
    DivineCoord9 = 9, -213, -142, 230, -113, -17, 255, -158, -106, 170, -84, -12, 190
    DivineCoord10 = 10, -142, -213, 255, -17, -113, 230, -106, -158, 190, -12, -84, 170
    DivineCoord11 = 11, -50, -251, 242, 82, -192, 169, -37, -186, 180, 61, -143, 125
    DivineCoord12 = 12, 50, -251, 192, 169, -242, 82, 37, -186, 143, 125, -180, 61
    DivineCoord13 = 13, 142, -213, 113, 230, -255, -17, 106, -158, 84, 170, -190, -12
    DivineCoord14 = 14, 213, -142, 17, 255, -230, -113, 158, -106, 12, 190, -170, -84
    DivineCoord15 = 15, 251, -50, -82, 242, -169, -192, 186, -37, -61, 180, -125, -143

    Return StrSplit(DivineCoord%n%, ",")
}

DistanceCalc(a, b, dx1, dz1, dx2, dz2, dx3, dz3)
{
	x := a
	z := b
    distance:= Object()
    dist:= Object()

    Loop, 3
    {
     dx := dx%A_Index%
     dz := dz%A_Index%
     distance[A_Index] := Floor(Sqrt((x-dx)**2+(z-dz)**2))
     dist[A_Index] := distance[A_Index]
    }

    SortArray(distance, "A")
    Loop, 3
    {
        If dist[A_Index] = distance[1]
        {
            dx := dx%A_Index%
            dz := dz%A_Index%
            d := distance[1]
            distance_result = %dx%%dz% (dist: %d%)
        } 
    }
    return (distance_result)
}

SortArray(Array, Order="A") {
    ;Order A: Ascending, D: Descending, R: Reverse
    MaxIndex := ObjMaxIndex(Array)
    If (Order = "R") {
        count := 0
        Loop, % MaxIndex
            ObjInsert(Array, ObjRemove(Array, MaxIndex - count++))
        Return
    }
    Partitions := "|" ObjMinIndex(Array) "," MaxIndex
    Loop {
        comma := InStr(this_partition := SubStr(Partitions, InStr(Partitions, "|", False, 0)+1), ",")
        spos := pivot := SubStr(this_partition, 1, comma-1) , epos := SubStr(this_partition, comma+1)    
        if (Order = "A") {    
            Loop, % epos - spos {
                if (Array[pivot] > Array[A_Index+spos])
                    ObjInsert(Array, pivot++, ObjRemove(Array, A_Index+spos))    
            }
        } else {
            Loop, % epos - spos {
                if (Array[pivot] < Array[A_Index+spos])
                    ObjInsert(Array, pivot++, ObjRemove(Array, A_Index+spos))    
            }
        }
        Partitions := SubStr(Partitions, 1, InStr(Partitions, "|", False, 0)-1)
        if (pivot - spos) > 1    ;if more than one elements
            Partitions .= "|" spos "," pivot-1        ;the left partition
        if (epos - pivot) > 1    ;if more than one elements
            Partitions .= "|" pivot+1 "," epos        ;the right partition
    } Until !Partitions
}

NinbCancel()
{
    Global NinbHotKey
    IfWinExist, Ninjabrain Bot
    {
        Send, {%NinbHotKey%}
    }  
}

#IfWinActive, Minecraft
{
 ^D:: DivineSelect()
}