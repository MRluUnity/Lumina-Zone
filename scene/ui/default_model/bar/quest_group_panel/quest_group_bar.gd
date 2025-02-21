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
var is_rename : bool:
	set(v):
		is_rename = v
		%QuestRenameLineEdit.visible = is_rename
		%QuestGroupNameLabel.visible = not is_rename

var quest_group_name : String
var quest_group : QuestGroup

var is_double : bool = false
var can_double : bool = false
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
				"value" : self
			}
			)

		if event.is_action_pressed("mouse_left"):
			UiTool.queue_all_panel(UiTool.UiType.TOOL_PANEL)
			is_double = false
			if can_double:
				is_double = true
			can_double = true
			get_tree().create_timer(.25).timeout.connect(func(): can_double = false)
			if is_double:
				UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME["任务面板"], UiTool.UiType.PANEL, "ui_ex", Vector2.ZERO,
				{
					"function" : "_set_quest_panel",
					"value" : {quest_group_name.replace(".tres", "") : quest_group}
				}
				)
				QuestGroupModelController.current_quest_group = quest_group

#endregion

# TODO 任务组条 ===============>信号链接方法<===============
#region 信号链接方法

func _on_quest_rename_line_edit_text_submitted(new_text: String) -> void:
	new_text.replace(".tres", "")

	var dir = DirAccess.open(UiTool.current_focus_dir)

	dir.rename(UiTool.current_focus_dir + %QuestGroupNameLabel.text, UiTool.current_focus_dir + new_text + ".tres")

	UiTool.file_update.emit()
#endregion

# TODO 任务组条 ===============>工具方法<===============
#region 工具方法
func _set_quest_group(_quest_group : QuestGroup, _quest_group_name : String) -> void:
	%QuestGroupNameLabel.text = _quest_group_name
	%QuestGroupDescTextEdit.text = _quest_group.quest_group_desc

	quest_group_name = _quest_group_name
	tooltip_text = _quest_group.quest_group_desc

	quest_group = _quest_group
#endregion
