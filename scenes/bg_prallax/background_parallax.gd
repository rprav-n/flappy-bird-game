class_name BackgroundParallax

extends ParallaxBackground

const SPEED: int = 50


func _physics_process(delta: float) -> void:
	scroll_offset.x -= SPEED * delta
