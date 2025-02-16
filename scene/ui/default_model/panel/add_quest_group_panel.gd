#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name AddQuestGroupPanel extends PanelModel

# TODO 添加任务组面板 ===============>信 号<===============
#region 信号

#endregion

# TODO 添加任务组面板 ===============>常 量<===============
#region 常量

#endregion

# TODO 添加任务组面板 ===============>变 量<===============
#region 变量
@onready var create_quest_group_button: Button = %CreateQuestGroupButton
@onready var quest_group_name_line_edit: LineEdit = %QuestGroupNameLineEdit
@onready var quest_group_desc_text_edit: TextEdit = %QuestGroupDescTextEdit

var save_dir : String
#endregion

# TODO 添加任务组面板 ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	pass
#endregion

# TODO 添加任务组面板 ===============>信号链接方法<===============
#region 信号链接方法

func _on_create_quest_group_button_pressed() -> void:
	var quest_group : QuestGroup = QuestGroup.new()
	quest_group.quest_group_name = quest_group_name_line_edit.text
	quest_group.quest_group_desc = quest_group_desc_text_edit.text
	var file_dialog : FileDialog = FileDialog.new()
	UiTool.ui_canvas_layers["ui_tool"].add_child(file_dialog)
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	file_dialog.popup_centered_ratio()

	await file_dialog.dir_selected

	ResourceSaver.save(quest_group, file_dialog.current_dir.path_join(quest_group.quest_group_name) + ".tres")
	file_dialog.queue_free()

	UiTool.queue_free_null_ui_scene(self)


func _on_quest_group_name_line_edit_text_changed(new_text: String) -> void:
	if new_text != "":
		create_quest_group_button.disabled = false
	else :
		create_quest_group_button.disabled = true
#endregion

# TODO 添加任务组面板 ===============>工具方法<===============
#region 工具方法

#endregion
