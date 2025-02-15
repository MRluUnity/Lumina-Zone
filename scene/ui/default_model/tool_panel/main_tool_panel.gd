#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name MainToolPanel extends ToolPanelModel

# TODO 主场景工具面板 ===============>信 号<===============
#region 信号

#endregion

# TODO 主场景工具面板 ===============>常 量<===============
#region 常量

#endregion

# TODO 主场景工具面板 ===============>变 量<===============
#region 变量

#endregion

# TODO 主场景工具面板 ===============>虚方法<===============
#region 常用的虚方法
func _ready() -> void:
	pass
#endregion

# TODO 主场景工具面板 ===============>信号链接方法<===============
#region 信号链接方法
# TODO_FUC 打开面板
func _on_open_panel_button_pressed() -> void:
	# WARNING 点击这个按钮可以打开面板选择器
	UiTool.queue_free_ui_scene(UiTool.UI_NAME["主界面工具面板"], UiTool.UiType.TOOL_PANEL)

# TODO_FUC 关闭全部面板
func _on_close_all_panel_button_pressed() -> void:
	# WARNING 点击这个按钮可以关闭全部面板
	UiTool.queue_free_ui_scene(UiTool.UI_NAME["主界面工具面板"], UiTool.UiType.TOOL_PANEL)
#endregion

# TODO 主场景工具面板 ===============>工具方法<===============
#region 工具方法

#endregion
