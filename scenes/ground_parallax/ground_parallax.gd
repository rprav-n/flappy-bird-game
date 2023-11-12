class_name GroundParallax

extends ParallaxBackground

const SPEED: int = 100


func _physics_process(delta: float) -> void:
	scroll_offset.x -= SPEED * delta
