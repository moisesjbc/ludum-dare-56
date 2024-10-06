extends Node2D


var tutorial
var text = "Hold RIGHT CLICK to scan the creatures.\nThis will drain your energy (top-right corner) while in use.\nNow find the creature with a SKULL and shoot THAT ONE"
var press_space_to_continue = false
var creature_scene = preload("res://gameplay/creature/creature.tscn")

var damage_creature = null
var life_creature = null
var energy_creature = null


func start(tutorial):
	self.tutorial = tutorial

	if damage_creature != null:
		damage_creature.queue_free()
	damage_creature = creature_scene.instance()
	damage_creature.set_feature_type(FeatureType.DAMAGE)
	damage_creature.global_position = $damage_creature_pos.global_position
	damage_creature.speed = 0
	add_child(damage_creature)
	damage_creature.connect("died", tutorial, "next_step")
	
	if life_creature != null:
		life_creature.queue_free()
	life_creature = creature_scene.instance()
	life_creature.set_feature_type(FeatureType.LIFE_POWERUP)
	life_creature.global_position = $life_creature_pos.global_position
	life_creature.speed = 0
	add_child(life_creature)
	life_creature.connect("died", self, "restart")
	
	if energy_creature != null:
		energy_creature.queue_free()
	energy_creature = creature_scene.instance()
	energy_creature.set_feature_type(FeatureType.ENERGY_POWERUP)
	energy_creature.global_position = $energy_creature_pos.global_position
	energy_creature.speed = 0
	add_child(energy_creature)
	energy_creature.connect("died", self, "restart")


func stop(tutorial):
	damage_creature.disconnect("died", tutorial, "next_step")
	life_creature.disconnect("died", self, "restart")
	energy_creature.disconnect("died", self, "restart")
	
	
func restart():
	start(self.tutorial)
