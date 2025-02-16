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

#endregion

# TODO 任务组条 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 任务组条 ===============>工具方法<===============
#region 工具方法
func _set_quest_group(quest_group_name : String, quest_group_desc : String) -> void:
	%QuestLabel.text = quest_group_name
	%ComponentButton.text = quest_group_desc
	tooltip_text = quest_group_desc
#endregion
