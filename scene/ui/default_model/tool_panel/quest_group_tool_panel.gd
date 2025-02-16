#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name QuestGroupToolPanel extends ToolPanelModel

# TODO 任务组工具面板 ===============>信 号<===============
#region 信号

#endregion

# TODO 任务组工具面板 ===============>常 量<===============
#region 常量

#endregion

# TODO 任务组工具面板 ===============>变 量<===============
#region 变量

#endregion

# TODO 任务组工具面板 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	pass
#endregion

# TODO 任务组工具面板 ===============>信号链接方法<===============
#region 信号链接方法
# TODO_FUC 添加任务按钮信号方法
func _on_add_quest_button_pressed() -> void:
	UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME["添加任务组面板"], UiTool.UiType.PANEL, "ui_ex")
	UiTool.queue_free_null_ui_scene(self)

#endregion

# TODO 任务组工具面板 ===============>工具方法<===============
#region 工具方法

#endregion
