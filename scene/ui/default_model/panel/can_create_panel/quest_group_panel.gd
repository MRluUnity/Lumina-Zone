#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name QuestGroupPanel extends PanelModel

# TODO 任务组面板 ===============>信 号<===============
#region 信号

#endregion

# TODO 任务组面板 ===============>常 量<===============
#region 常量

#endregion

# TODO 任务组面板 ===============>变 量<===============
#region 变量
var file_dir := "C:/Users/Lenovo/Desktop/testaaa/"
@onready var quest_group_list: VBoxContainer = %QuestGroupList
#endregion

# TODO 任务组面板 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	UiTool.file_update.connect(_update_quest_group_list)

	_update_quest_group_list()

func _gui_input(event: InputEvent) -> void:
	super._gui_input(event)
	UiTool.current_focus_dir = file_dir

	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_right"):
			UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME["任务组工具面板"], UiTool.UiType.TOOL_PANEL, "ui_tool", get_global_mouse_position(),
			{
				"function" : "quest_group_panel_mode",
				"value" : self
			}
			)
		if event.is_action_pressed("mouse_left"):
			UiTool.queue_all_panel(UiTool.UiType.TOOL_PANEL)
#endregion

# TODO 任务组面板 ===============>信号链接方法<===============
#region 信号链接方法
func _update_quest_group_list() -> void:
	for i in quest_group_list.get_children():
		i.queue_free()

	var dir = DirAccess.open(file_dir)

	for i in dir.get_files():
		if i.ends_with(".tres"):
			var quest_group : QuestGroup = load(file_dir + i)
			var quest_group_bar : QuestGroupBar = UiTool.UI_SCENE[UiTool.UI_NAME["任务组条"]].instantiate()
			quest_group_list.add_child(quest_group_bar)
			quest_group_bar._set_quest_group(quest_group, i)
#endregion

# TODO 任务组面板 ===============>工具方法<===============
#region 工具方法

#endregion
