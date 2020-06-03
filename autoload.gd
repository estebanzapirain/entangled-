extends Node

var level = 0 #level number
const AliceStartPos = [Vector2(52,-15),Vector2(52,-15)] #alice initial positions by level 0,1,etc
const BobStartPos = [Vector2(236,-15),Vector2(236,75)] #bob initial positions by level 0,1,etc


func next_level():
	level += 1

