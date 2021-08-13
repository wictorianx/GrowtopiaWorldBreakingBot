k = 1
ESC::
	k=!k 
Break(){
a = 0
While a < 12{
a = a + 1
send {space}
Sleep 500
} 
}
Move(dir){
if (dir = right)
	send {d}
	send {d}
	send {d}
else {
	send {a}
	send {a}
	send {a}
}
}
calcDir(x, sDir){
if sDir = "left"
	v = 0
else {
v = 1
} 
if (Mod(col,2) = v)
	dir = "left"
else{
dir = "right" 
return dir
}
BreakLine(col,sDir){
global k
dir = calcDir(col, sDir) 
i = 0
While i < 97{ 
i = i + 1
if k{
	Move(dir)
	Break()
}
else{
	While !k{
	Sleep(1000)
}
	Move(dir)
	Break()
}
}
}
BreakWorld(){
InputBox, H, Enter World Height, sEnter world height., , 640, 480
if ErrorLevel
    MsgBox, CANCEL was pressed.
else
    MsgBox, You entered "%H%"
InputBox, sDir, Enter World Height, Enter starting direction., , 640, 480
if ErrorLevel
    MsgBox, CANCEL was pressed.
else
    MsgBox, You entered "%sDir%"
x = 0
While (x < 97){
BreakLine(x,sDir)
Break()
if (calcDir(x,sDir) = "left")
	MouseMove, 1052, 546
else {
MouseMove, 219, 552
}
y = 0
While a < 12{
y = a + 1
MouseClick, left
Sleep 500
Move(calcDir(x,sDir))
x = x + 1
}
}
BreakWorld()












