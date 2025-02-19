#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name QuestGroup extends Resource

# TODO 任务组 ===============>信 号<===============
#region 信号

#endregion

# TODO 任务组 ===============>常 量<===============
#region 常量

#endregion

# TODO 任务组 ===============>变 量<===============
#region 变量
@export_multiline var quest_group_desc : String
@export var quests : Array[Quest]
#endregion

# TODO 任务组 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO 任务组 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 任务组 ===============>工具方法<===============
#region 工具方法
func get_quests_complete_count() -> float:
	var complete_count : float
	for quest in quests:
		if not quest.complete:
			continue
		complete_count += 1
	return complete_count / float(quests.size())

func save_quest_group() -> void:
	ResourceSaver.save(self, self.resource_path)
#endregion
