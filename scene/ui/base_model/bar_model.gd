#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name BarModel extends PanelContainer

# TODO 条形模块 ===============>信 号<===============
#region 信号

#endregion

# TODO 条形模块 ===============>常 量<===============
#region 常量

#endregion

# TODO 条形模块 ===============>变 量<===============
#region 变量
@onready var bar_context_panel: PanelContainer = %BarContextPanel



#endregion

# TODO 条形模块 ===============>虚方法<===============
#region 常用的虚方法
func _ready() -> void:
	pass

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_left"):
			bar_context_panel.visible = not bar_context_panel.visible
#endregion

# TODO 条形模块 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 条形模块 ===============>工具方法<===============
#region 工具方法

#endregion
