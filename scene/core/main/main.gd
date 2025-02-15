#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name Main extends Node2D

# TODO 主场景 ===============>信 号<===============
#region 信号

#endregion

# TODO 主场景 ===============>常 量<===============
#region 常量

#endregion

# TODO 主场景 ===============>变 量<===============
#region 变量
@onready var ui: CanvasLayer = %Ui
@onready var ui_ex: CanvasLayer = %UiEx
@onready var ui_tool: CanvasLayer = $UiTool


#endregion

# TODO 主场景 ===============>虚方法<===============
#region 常用的虚方法
func _ready() -> void:
	UiTool.ui_canvas_layers["ui"] = ui
	UiTool.ui_canvas_layers["ui_ex"] = ui_ex
	UiTool.ui_canvas_layers["ui_tool"] = ui_tool
#endregion

# TODO 主场景 ===============>信号链接方法<===============
#region 信号链接方法
# TODO_FUC 关闭窗口信号方法
func _on_close_button_pressed() -> void:
	get_tree().quit()

# TODO_FUC 窗口 gui 点击信号方法
func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_right"):
			UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME["主界面工具面板"], UiTool.UiType.TOOL_PANEL, "ui_ex", get_global_mouse_position())
		if event.is_action_pressed("mouse_left"):
			UiTool.queue_free_ui_scene(UiTool.UI_NAME["主界面工具面板"], UiTool.UiType.TOOL_PANEL)
#endregion

# TODO 主场景 ===============>工具方法<===============
#region 工具方法

#endregion
