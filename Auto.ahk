;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;스크립트 시작 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Include Gdip_all.ahk
#Include Gdip_ImageSearch.ahk
#Include Search_img.ahk

global Title
Title=제목 없음 - 그림판

gui,show,w100 h100 center,chapter11
gui,Add,Button,x0 y0 w100 h50 gStart,Start
gui,Add,Button,x0 y50 w100 h50 gStop,Stop
return

Start:
	CoordMode, Pixel, Relative
	CoordMode, Mouse, Relative
	WinGet,winid,ID,%Title%
	if (Search_img("left.PNG",winid,x,y)) {
		;MsgBox, success!! x=%x% y=%y%
		SendMouseClick(x, y)
	} else if (Search_img("right.PNG",winid,x,y)) {
		;MsgBox, success!! x=%x% y=%y%
		SendMouseClick(x, y)
	} else if (Search_img("up.PNG",winid,x,y)) {
		;MsgBox, success!! x=%x% y=%y%
		SendMouseClick(x, y)
	} else if (Search_img("down.PNG",winid,x,y)) {
		;MsgBox, success!! x=%x% y=%y%
		SendMouseClick(x, y)
	} else {
		;MsgBox,못찾음
	}
return

Stop:
	ExitApp
	return

GuiClose:
	ExitApp
	return

PostMouseMove(FoundX,FoundY) {
	lparam:=FoundX|FoundY<<16
	PostMessage,0x200,0,%lparam%,,%Title%
	Sleep, 1000
}

PostMouseClick(FoundX,FoundY) {
	lparam:=FoundX|FoundY<<16
	PostMessage,0x201,1,%lparam%,,%Title%
	PostMessage,0x202,0,%lparam%,,%Title%
	Sleep, 1000
}

SendMouseMove(FoundX,FoundY) {
	WinActivate, %Title%
	Click %FoundX%, %FoundY%, 0
}

SendMouseClick(FoundX,FoundY) {
	WinActivate, %Title%
	Click %FoundX%, %FoundY%, 1
}

SendKey(key) {
	WinActivate, %Title%
	Send, %key%
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;; 스크립트 끝 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;