extends CharacterBody3D
class_name Player

# 可调参数
@export var move_speed: float = 5.0                # 普通移动速度

# 内部变量
var _move_input: Vector3 = Vector3.ZERO            # 当前移动输入方向

# 初始化
func _ready() -> void:
	pass

# 物理帧更新
func _physics_process(delta: float) -> void:
	_read_input()
	_move()

# 读取输入
func _read_input() -> void:
	var input_dir = Vector3.ZERO
	input_dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_dir.z = Input.get_action_strength("move_backward") - Input.get_action_strength("move_forward")
	input_dir = input_dir.normalized()
	_move_input = input_dir

# 移动
func _move() -> void:
	var h_velocity = _move_input * move_speed
	velocity.x = h_velocity.x
	velocity.z = h_velocity.z
	move_and_slide()
	# 转向逻辑：有输入时朝向移动方向
	if _move_input.length() > 0.01:
		var target_dir = _move_input.normalized()
		var target_rotation = atan2(-target_dir.x, -target_dir.z)
		rotation.y = lerp_angle(rotation.y, target_rotation, 0.15)
