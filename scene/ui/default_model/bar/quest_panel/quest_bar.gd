#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name QuestBar extends BarModel

# TODO 任务条 ===============>信 号<===============
#region 信号
signal quest_complete
#endregion

# TODO 任务条 ===============>常 量<===============
#region 常量

#endregion

# TODO 任务条 ===============>变 量<===============
#region 变量

#endregion

# TODO 任务条 ===============>虚方法<===============
#region 常用的虚方法
func _gui_input(event: InputEvent) -> void:
	super._gui_input(event)

	if event is InputEventMouseButton:
		if event.is_action_pressed("mouse_right"):
			UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME["任务工具面板"], UiTool.UiType.TOOL_PANEL, "ui_tool", get_global_mouse_position(),
			{
				"function" : "_set_remove_quest",
				"value" : get_index()
			}
			)
		if event.is_action_pressed("mouse_left"):
			UiTool.queue_all_panel(UiTool.UiType.TOOL_PANEL)
#endregion

# TODO 任务条 ===============>信号链接方法<===============
#region 信号链接方法
func _on_component_button_toggled(toggled_on: bool) -> void:
	self_modulate.a = .6 if toggled_on else 1.
	QuestGroupModelController.current_quest_group.quests[get_index()].complete = toggled_on
	QuestGroupModelController.current_quest_group.save_quest_group()
	quest_complete.emit()
#endregion

# TODO 任务条 ===============>工具方法<===============
#region 工具方法
func _set_quest(_quest : Quest) -> void:
	%QuestNameLabel.text = _quest.quest_name
	%QuestDescTextEdit.text = _quest.quest_desc

	%ComponentButton.button_pressed = _quest.complete
	if _quest.dead_line_time.size() != 0:
		%TimeLabel.show()
		%TimeLabel.text = "任务的截止时间是：%s年%s月%s日%s时%s分%s秒" %\
		 [
			int(_quest.dead_line_time["year"]),
			int(_quest.dead_line_time["month"]),
			int(_quest.dead_line_time["day"]),
			int(_quest.dead_line_time["hour"]),
			int(_quest.dead_line_time["minute"]),
			int(_quest.dead_line_time["second"])
		]

	self_modulate.a = .6 if %ComponentButton.button_pressed else 1.
	%ComponentButton.toggled.connect(_on_component_button_toggled)
	#tooltip_text = _quest.quest_desc
#endregion
