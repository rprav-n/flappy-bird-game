class_name Game

extends Node2D


func _ready() -> void:
	get_tree().paused = true



func _on_wait_screen_visibility_changed() -> void:
	get_tree().paused = false


func _on_pipe_bound_area_area_entered(area: Area2D) -> void:
	area.queue_free()
