extends CanvasLayer

@onready var start_button: Button = %StartButton


func _ready() -> void:
	start_button.grab_focus()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")
