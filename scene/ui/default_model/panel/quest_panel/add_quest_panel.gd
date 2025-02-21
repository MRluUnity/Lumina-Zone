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
var time_dic : Dictionary = {
	"year" : 2025,
	"month" : 2,
	"day" : 21,
	"hour" : 6,
	"minute" : 6,
	"second" : 6
}
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
	if %OpenTimeModeButton.button_pressed:
		quest.dead_line_time = time_dic

	QuestGroupModelController.current_quest_group.quests.append(quest)
	QuestGroupModelController.current_quest_group.save_quest_group()
	QuestGroupModelController.controller.file_update.emit()

	UiTool.queue_free_null_ui_scene(self)

func _on_year_spin_value_changed(value: float) -> void:
	time_dic["year"] = value

func _on_month_spin_value_changed(value: float) -> void:
	time_dic["month"] = value

func _on_day_box_value_changed(value: float) -> void:
	time_dic["day"] = value

func _on_hour_box_value_changed(value: float) -> void:
	time_dic["hour"] = value

func _on_minute_box_value_changed(value: float) -> void:
	time_dic["minute"] = value

func _on_second_box_value_changed(value: float) -> void:
	time_dic["second"] = value

func _on_open_time_mode_button_toggled(toggled_on: bool) -> void:
	%YearSpin.visible = toggled_on
	%MonthSpin.visible = toggled_on
	%DayBox.visible = toggled_on
	%HourBox.visible = toggled_on
	%MinuteBox.visible = toggled_on
	%SecondBox.visible = toggled_on
#endregion

# TODO 添加任务面板 ===============>工具方法<===============
#region 工具方法

#endregion
