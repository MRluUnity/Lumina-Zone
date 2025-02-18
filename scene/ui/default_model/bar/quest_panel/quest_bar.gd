#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name QuestBar extends BarModel

# TODO 任务条 ===============>信 号<===============
#region 信号

#endregion

# TODO 任务条 ===============>常 量<===============
#region 常量

#endregion

# TODO 任务条 ===============>变 量<===============
#region 变量

#endregion

# TODO 任务条 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO 任务条 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 任务条 ===============>工具方法<===============
#region 工具方法
func _set_quest(_quest : Quest) -> void:
	%QuestNameLabel.text = _quest.quest_name
	%QuestDescTextEdit.text = _quest.quest_desc

	tooltip_text = _quest.quest_desc
#endregion
