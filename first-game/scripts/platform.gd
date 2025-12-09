extends AnimatableBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var pressure_plate: Area2D = $PressurePlate

var player_on_platform = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressure_plate.body_entered.connect(player_entered)
	pressure_plate.body_exited.connect(player_exited)

func player_entered(body):
	if body.is_in_group("Player") and not player_on_platform:
		player_on_platform = true
		animation_player.play("rise")
		print("Player entered - platform rising")

func player_exited(body):
	if body.is_in_group("Player") and player_on_platform:
		player_on_platform = false
		animation_player.play("fall")
		print("Player exited - platform falling")
