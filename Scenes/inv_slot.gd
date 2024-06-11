extends TextureRect

@export var accessible = true
func  _ready():
	if not accessible:
		texture = null
	
func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(60,60)
	var preview = Control.new()
	preview.add_child(preview_texture)
	set_drag_preview(preview)
	texture = null
	accessible = false
	return preview_texture.texture 
func _can_drop_data(at_position, data):
	return data is Texture2D
func _drop_data(at_position, data):
	texture = data
	accessible = true
