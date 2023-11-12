class_name GameOverScreen

extends CanvasLayer


func _ready() -> void:
	visible = false
	GameEvent.game_over.connect(_on_game_over)


func _on_game_over() -> void:
	visible = true


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
