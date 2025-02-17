#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name QuestGroupBar extends BarModel

# TODO 任务组条 ===============>信 号<===============
#region 信号

#endregion

# TODO 任务组条 ===============>常 量<===============
#region 常量

#endregion

# TODO 任务组条 ===============>变 量<===============
#region 变量

#endregion

# TODO 任务组条 ===============>虚方法<===============
#region 常用的虚方法
func _gui_input(event: InputEvent) -> void:
	super._gui_input(event)
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_right"):
			UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME["任务组工具面板"], UiTool.UiType.TOOL_PANEL, "ui_tool", get_global_mouse_position(),
			{
				"function" : "bar_mode",
			}
			)
		if event.is_action_pressed("mouse_left"):
			UiTool.queue_all_panel(UiTool.UiType.TOOL_PANEL)
#endregion

# TODO 任务组条 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 任务组条 ===============>工具方法<===============
#region 工具方法
func _set_quest_group(quest_group : QuestGroup) -> void:
	%QuestGroupNameLabel.text = quest_group.quest_group_name
	%QuestGroupDescTextEdit.text = quest_group.quest_group_desc
	tooltip_text = quest_group.quest_group_desc
#endregion
