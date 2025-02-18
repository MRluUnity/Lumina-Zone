class_name PanelModel extends PanelContainer

# TODO 面板模块 ===============>信 号<===============
#region 信号

#endregion

# TODO 面板模块 ===============>常 量<===============
#region 常量

#endregion

# TODO 面板模块 ===============>变 量<===============
#region 变量
@export var panel_name : String

var drag : bool = false:
	set(v):
		drag = v
		if drag:
			drag_pos = get_global_mouse_position() - global_position
var drag_pos : Vector2
#endregion

# TODO 面板模块 ===============>虚方法<===============
#region 常用的虚方法
func _ready() -> void:
	pass

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		drag = event.is_action_pressed("mouse_mid")
		if event.is_action_pressed("mouse_left"):
			get_parent().move_child(self, -1)

	if drag:
		global_position = get_global_mouse_position() - drag_pos

#endregion

# TODO 面板模块 ===============>信号链接方法<===============
#region 信号链接方法
# TODO_FUC 关闭窗口信号方法
func _on_close_button_pressed() -> void:
	UiTool.queue_free_null_ui_scene(self)
#endregion

# TODO 面板模块 ===============>工具方法<===============
#region 工具方法

#endregion
