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
var quest_group_bar : QuestGroupBar
var quest_group_panel : QuestGroupPanel
#endregion

# TODO 任务组工具面板 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO 任务组工具面板 ===============>信号链接方法<===============
#region 信号链接方法
# TODO_FUC 添加任务按钮信号方法
func _on_add_quest_button_pressed() -> void:
	UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME["添加任务组面板"], UiTool.UiType.PANEL, "ui_ex")
	UiTool.queue_free_null_ui_scene(self)

# TODO_FUC 重命名按钮信号方法
func _on_rename_button_pressed() -> void:
	quest_group_bar.is_rename = true
	UiTool.queue_free_null_ui_scene(self)

# TODO_FUC 删除按钮信号方法
func _on_remove_button_pressed() -> void:
	DirAccess.remove_absolute(UiTool.current_focus_dir + quest_group_bar.quest_group_name)
	UiTool.file_update.emit()
	UiTool.queue_free_null_ui_scene(self)

# TODO_FUC 隐藏所有任务组内容按钮信号方法
func _on_hide_all_quest_group_context_button_pressed() -> void:
	for i : QuestGroupBar in quest_group_panel.quest_group_list.get_children():
		i.context_visible = false
	UiTool.queue_free_null_ui_scene(self)
#endregion

# TODO 任务组工具面板 ===============>工具方法<===============
#region 工具方法
func bar_mode(_quest_group_bar : QuestGroupBar) -> void:
	%AddQuestButton.show()
	%RenameButton.show()
	%RemoveButton.show()
	%HideAllQuestGroupContextButton.show()
	quest_group_bar = _quest_group_bar

func quest_group_panel_mode(_quest_group_panel : QuestGroupPanel) -> void:
	%AddQuestButton.show()
	%HideAllQuestGroupContextButton.show()
	quest_group_panel = _quest_group_panel
#endregion
