class_name PipeSpawner

extends Node2D

const pipe_scene: PackedScene = preload("res://scenes/pipe/pipe.tscn")
const PIPE_GAP_HEIGHT: int = 120

@onready var top_spawner: Marker2D = $TopSpawner
@onready var bottom_spawner: Marker2D = $BottomSpawner


var screen_size: Vector2 = Vector2.ZERO

func _on_spawn_timer_timeout() -> void:
	var random_y_pos: int = randi_range(90, 320)
	spawn_top_pipe(random_y_pos)
	spawn_bottom_pipe(random_y_pos)


func spawn_top_pipe(random_y_pos: int) -> void:
	var pipe: Pipe = pipe_scene.instantiate() as Pipe
	get_tree().current_scene.add_child(pipe)
	
	pipe.global_position = top_spawner.global_position
	pipe.global_position.y += random_y_pos


func spawn_bottom_pipe(random_y_pos: int) -> void:
	random_y_pos += PIPE_GAP_HEIGHT
	
	var pipe: Pipe = pipe_scene.instantiate() as Pipe
	get_tree().current_scene.add_child(pipe)
	pipe.flip_direction()
	bottom_spawner.global_position.y = random_y_pos
	
	pipe.global_position = bottom_spawner.global_position
	
