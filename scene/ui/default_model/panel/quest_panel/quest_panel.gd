#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name QuestPanel extends PanelModel

# TODO 任务面板 ===============>信 号<===============
#region 信号

#endregion

# TODO 任务面板 ===============>常 量<===============
#region 常量

#endregion

# TODO 任务面板 ===============>变 量<===============
#region 变量
@onready var quest_list: VBoxContainer = %QuestList

var quest_group : QuestGroup
#endregion

# TODO 任务面板 ===============>虚方法<===============
#region 常用的虚方法
func _ready() -> void:
	UiTool.file_update.connect(update_quest_list.bind(quest_group.quests))

func _gui_input(event: InputEvent) -> void:
	super._gui_input(event)

	if UiTool.not_has_tool():
		UiTool.current_quest_group = quest_group

	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_right"):
			UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME["任务工具面板"], UiTool.UiType.TOOL_PANEL, "ui_tool", get_global_mouse_position())
		if event.is_action_pressed("mouse_left"):
			UiTool.queue_all_panel(UiTool.UiType.TOOL_PANEL)
#endregion

# TODO 任务面板 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 任务面板 ===============>工具方法<===============
#region 工具方法
func _set_quest_panel(value_dic : Dictionary) -> void:
	%QuestGroupNameLabel.text = value_dic.keys()[0]
	update_quest_list(value_dic[%QuestGroupNameLabel.text].quests)
	quest_group = value_dic[%QuestGroupNameLabel.text]

func update_quest_list(quests : Array) -> void:
	for i in %QuestList.get_children():
		i.queue_free()

	for i : Quest in quests:
		var quest_bar : QuestBar = UiTool.create_ui_scene(UiTool.UI_NAME["任务条"])
		%QuestList.add_child(quest_bar)
		quest_bar._set_quest(i)
#endregion
