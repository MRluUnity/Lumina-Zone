#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name QuestToolPanel extends ToolPanelModel

# TODO 任务工具面板 ===============>信 号<===============
#region 信号

#endregion

# TODO 任务工具面板 ===============>常 量<===============
#region 常量

#endregion

# TODO 任务工具面板 ===============>变 量<===============
#region 变量
var selected_quest : int
#endregion

# TODO 任务工具面板 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO 任务工具面板 ===============>信号链接方法<===============
#region 信号链接方法

func _on_add_quest_button_pressed() -> void:
	UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME["添加任务面板"], UiTool.UiType.PANEL, "ui_ex")
	UiTool.queue_free_null_ui_scene(self)

func _on_remove_quest_button_pressed() -> void:
	UiTool.current_quest_group.quests.remove_at(selected_quest)
	UiTool.current_quest_group.save_quest_group()
	UiTool.file_update.emit()
	UiTool.queue_free_null_ui_scene(self)
#endregion

# TODO 任务工具面板 ===============>工具方法<===============
#region 工具方法
func _set_remove_quest(_selected_quest : int) -> void:
	selected_quest = _selected_quest
	%RemoveQuestButton.show()
#endregion
