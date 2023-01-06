extends Sprite

var _timer:float
var _max_timer:float

# ゴーストエフェクト開始
func start(_position:Vector2, _scale:Vector2, _frame:int, _flip_h:bool):
	position = _position
	scale = _scale
	frame = _frame
	flip_h = _flip_h
	_timer = 0.5
	_max_timer = _timer
	# 単色シェーダーのフラグ設定.
	material.set_shader_param("is_mono", Common.is_ghost_mono)

func _process(delta: float) -> void:
	_timer -= delta
	if _timer <= 0:
		# タイマー終了で消える
		queue_free()

	var rate = (_timer/_max_timer)
	var base_alpha = 0.5
	var alpha = rate * base_alpha
	modulate.a = alpha