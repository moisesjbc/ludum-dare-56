extends Node2D


var tutorial
var text = "Oh, there's a creature!\nNow aim at it with the mouse and shoot with LEFT CLICK"
var press_space_to_continue = false


func start(tutorial):
	self.tutorial = tutorial
	tutorial.get_node("player").movement_enabled = false
	tutorial.get_node("player").shooting_enabled = true
	$creature.connect("died", self, "next_step")


func stop(tutorial):
	$creature.disconnect("died", self, "next_step")


func next_step():
	self.tutorial.next_step()
