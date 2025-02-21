#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name AddQuestGroupPanel extends PanelModel

# TODO 添加任务组面板 ===============>信 号<===============
#region 信号
signal update_quest_group
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
func _ready() -> void:
	update_quest_group.connect(QuestGroupModelController.controller._file_update)
#endregion

# TODO 添加任务组面板 ===============>信号链接方法<===============
#region 信号链接方法

func _on_create_quest_group_button_pressed() -> void:
	var quest_group : QuestGroup = QuestGroup.new()
	quest_group.quest_group_desc = quest_group_desc_text_edit.text
	var file_dialog : FileDialog = FileDialog.new()
	UiTool.ui_canvas_layers["ui_tool"].add_child(file_dialog)
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.file_mode = FileDialog.FILE_MODE_OPEN_DIR
	file_dialog.current_path = "C:/Users/Lenovo/Desktop/"
	file_dialog.popup_centered_ratio(.5)

	await file_dialog.dir_selected

	ResourceSaver.save(quest_group, file_dialog.current_dir.path_join(quest_group_name_line_edit.text) + ".tres")
	file_dialog.queue_free()

	update_quest_group.emit()

	UiTool.queue_free_null_ui_scene(self)



func _on_quest_group_name_line_edit_text_changed(new_text: String) -> void:
	create_quest_group_button.disabled = new_text == ""
#endregion

# TODO 添加任务组面板 ===============>工具方法<===============
#region 工具方法

#endregion
