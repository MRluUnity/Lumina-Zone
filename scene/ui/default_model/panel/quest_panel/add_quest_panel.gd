#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name AddQuestPanel extends PanelModel

# TODO 添加任务面板 ===============>信 号<===============
#region 信号

#endregion

# TODO 添加任务面板 ===============>常 量<===============
#region 常量

#endregion

# TODO 添加任务面板 ===============>变 量<===============
#region 变量

#endregion

# TODO 添加任务面板 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO 添加任务面板 ===============>信号链接方法<===============
#region 信号链接方法
func _on_quest_name_line_edit_text_changed(new_text: String) -> void:
	%CreateQuestButton.disabled = new_text == ""

func _on_create_quest_button_pressed() -> void:
	var quest : Quest = Quest.new()
	quest.quest_name = %QuestNameLineEdit.text
	quest.quest_desc = %QuestDescTextEdit.text

	UiTool.current_quest_group.quests.append(quest)
	UiTool.current_quest_group.save_quest_group()
	UiTool.file_update.emit()

	UiTool.queue_free_null_ui_scene(self)
#endregion

# TODO 添加任务面板 ===============>工具方法<===============
#region 工具方法

#endregion
