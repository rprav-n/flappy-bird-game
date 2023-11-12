class_name Bird

extends CharacterBody2D

enum State {FLYING, DEAD}

const GRAVITY: int = 1400
const JUMP_SPEED: int = 400
const FALL_ROTATION: float = 15.0
const FLY_ROTATION_WEIGHT: int = 100
const FALL_ROTATION_WEIGHT: int = 10

const WINGS_SOUND: AudioStream = preload("res://assets/audio/wing.ogg")
const POINT_SOUND: AudioStream = preload("res://assets/audio/point.ogg")
const HIT_SOUND: AudioStream = preload("res://assets/audio/hit.ogg")

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var score_timer: Timer = $ScoreTimer

var state: State = State.FLYING
var should_rotate: bool = false

func _ready() -> void:
	animated_sprite_2d.play("fly")


func _physics_process(_delta: float) -> void:
	apply_gravity()
	
	if state == State.FLYING:
		handle_jump()
		if should_rotate:
			handle_rotation()
	elif state == State.DEAD:
		score_timer.stop()
		animated_sprite_2d.play("idle")
	
	move_and_slide()


func apply_gravity() -> void:
	velocity.y += GRAVITY * get_physics_process_delta_time()
	

func handle_jump() -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_SPEED * -1
		SoundManager.play_sound(WINGS_SOUND)
		if should_rotate:
			rotation_degrees = lerp(rotation_degrees, -10.0, FLY_ROTATION_WEIGHT * get_physics_process_delta_time())


func handle_rotation() -> void:
	rotation_degrees = lerp(rotation_degrees, FALL_ROTATION, FALL_ROTATION_WEIGHT * get_physics_process_delta_time())


func die() -> void:
	state = State.DEAD
	GameEvent.game_over.emit()


func _on_score_timer_timeout() -> void:
	Global.score += 1
	GameEvent.update_score.emit()
	SoundManager.play_sound(POINT_SOUND, false)


func _on_hurt_box_area_entered(_area: Area2D) -> void:
	if state == State.DEAD: return
	SoundManager.play_sound(HIT_SOUND)
	die()
