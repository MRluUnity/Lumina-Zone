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

#endregion

# TODO 任务面板 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO 任务面板 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 任务面板 ===============>工具方法<===============
#region 工具方法
func _set_quest_panel(value_dic : Dictionary) -> void:
	%QuestGroupNameLabel.text = value_dic.keys()[0]
	update_quest_list(value_dic[%QuestGroupNameLabel.text].quests)

func update_quest_list(quests : Array) -> void:
	for i in %QuestList.get_children():
		i.queue_free()

	for i : Quest in quests:
		var quest_bar : QuestBar = UiTool.create_ui_scene(UiTool.UI_NAME["任务条"])
		%QuestList.add_child(quest_bar)
		quest_bar._set_quest(i)
#endregion
