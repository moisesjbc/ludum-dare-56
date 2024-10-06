extends Node2D


var tutorial
var text = "REALLY, you don't have to worry!\nBut let's go over some self-defense tips... just in case...\nStart by moving to the designated area by using ASDW or the arrow keys"
var press_space_to_continue = false


func start(tutorial):
	self.tutorial = tutorial
	tutorial.get_node("player").movement_enabled = true
	$target_area.connect("body_entered", self, "next_step")


func stop(tutorial):
	$target_area.disconnect("body_entered", self, "next_step")


func next_step(body):
	self.tutorial.next_step()
