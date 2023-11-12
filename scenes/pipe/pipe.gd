class_name Pipe

extends Area2D

const SPEED: int = 100


func _physics_process(delta: float) -> void:
	global_position.x -= SPEED * delta


func flip_direction() -> void:
	scale.y = -1

