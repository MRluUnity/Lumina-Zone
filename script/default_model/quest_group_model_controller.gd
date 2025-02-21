#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name QuestGroupModelController extends ModelController

# TODO 任务组模块管理器 ===============>信 号<===============
#region 信号
signal file_update
#endregion

# TODO 任务组模块管理器 ===============>常 量<===============
#region 常量
const MODEL_NAME : String = "任务组模块管理器"
#endregion

# TODO 任务组模块管理器 ===============>变 量<===============
#region 变量
static var current_focus_dir : String
static var current_quest_group : QuestGroup
static var controller : QuestGroupModelController
#endregion

# TODO 任务组模块管理器 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	controller = self
	UiTool.open_panel_controllers[MODEL_NAME] = self
#endregion

# TODO 任务组模块管理器 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO 任务组模块管理器 ===============>工具方法<===============
#region 工具方法
func _file_update() -> void:
	file_update.emit()
#endregion
