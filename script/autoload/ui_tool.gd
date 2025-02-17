#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
extends Node

# TODO UI工具 ===============>信 号<===============
#region 信号
signal file_update
#endregion

# TODO UI工具 ===============>常 量<===============
#region 常量
const UI_SCENE : Dictionary[String, PackedScene] = {
	"MainToolPanel" : preload("res://scene/ui/default_model/tool_panel/main_tool_panel.tscn"),
	"CreateNewPanel" : preload("res://scene/ui/default_model/panel/create_new_panel.tscn"),
	"QuestGroupPanel" : preload("res://scene/ui/default_model/panel/can_create_panel/quest_group_panel.tscn"),
	"QuestGroupBar" : preload("res://scene/ui/default_model/bar/quest_group_bar.tscn"),
	"QuestGroupToolPanel" : preload("res://scene/ui/default_model/tool_panel/quest_group_tool_panel.tscn"),
	"AddQuestGroupPanel" : preload("res://scene/ui/default_model/panel/add_quest_group_panel.tscn")
}
const UI_NAME : Dictionary[String, String] = {
	"主界面工具面板" : "MainToolPanel",
	"创建新面板" : "CreateNewPanel",
	"任务组面板" : "QuestGroupPanel",
	"任务组条" : "QuestGroupBar",
	"任务组工具面板" : "QuestGroupToolPanel",
	"添加任务组面板" : "AddQuestGroupPanel"
}
enum UiType {
	TOOL_PANEL,
	PANEL,
	Bar
}
#endregion

# TODO UI工具 ===============>变 量<===============
#region 变量
var ui_canvas_layers : Dictionary[String, CanvasLayer] = {}
var tool_uis : Dictionary[String, ToolPanelModel] = {}
var panel_uis : Dictionary[String, Array] = {}
var bar_uis : Dictionary[String, BarModel] = {}

var current_focus_dir : String
#endregion

# TODO UI工具 ===============>虚方法<===============
#region 常用的虚方法

#endregion

# TODO UI工具 ===============>信号链接方法<===============
#region 信号链接方法

#endregion

# TODO UI工具 ===============>工具方法<===============
#region 工具方法
func add_ui_scene_to_ui_ex(ui_name : String, ui_type : UiType, canvas_layer_name : String = "ui", pos : Vector2 = Vector2.ZERO, ex_value : Dictionary = {}):
	var ui_scene = UI_SCENE[ui_name].instantiate()

	if not ex_value.is_empty():
		if ex_value.has("value"):
			ui_scene.call(ex_value["function"], ex_value["value"])
		else :
			ui_scene.call(ex_value["function"])

	if pos != Vector2.ZERO:
		ui_scene.global_position = pos

	ui_canvas_layers[canvas_layer_name].add_child(ui_scene)

	match ui_type:
		0:
			queue_all_panel(UiType.TOOL_PANEL)
			tool_uis[ui_name] = ui_scene
		1:
			if panel_uis.has(ui_name):
				panel_uis[ui_name].append(ui_scene)
			else :
				panel_uis[ui_name] = [ui_scene]
		2:
			bar_uis[ui_name] = ui_scene

	return ui_scene

func create_ui_scene(ui_name : String):
	var ui_scene = UI_SCENE[ui_name].instantiate()
	return ui_scene

func queue_free_null_ui_scene(ui_scene : Control) -> void:
	ui_scene.queue_free()

	await get_tree().process_frame

	for i in bar_uis:
		if bar_uis[i] == null:
			bar_uis.erase(i)

	for i in tool_uis:
		if tool_uis[i] == null:
			tool_uis.erase(i)

	for i in panel_uis:
		if not panel_uis[i].is_empty():
			for panel in panel_uis[i]:
				if panel == null:
					panel_uis[i].erase(panel)
		if panel_uis[i].size() == 0:
			panel_uis.erase(i)

func queue_all_panel(ui_type : UiType) -> void:
	match ui_type:
		0:
			if tool_uis.is_empty(): return
			for i in tool_uis:
				queue_free_null_ui_scene(tool_uis[i])
		1:
			if panel_uis.is_empty(): return
			for i in panel_uis:
				if panel_uis[i].size() < 1:
					continue
				for panel in panel_uis[i]:
					queue_free_null_ui_scene(panel)
		2:
			if bar_uis.is_empty(): return
			for i in bar_uis:
				queue_free_null_ui_scene(bar_uis[i])

func _file_update() -> void:
	file_update.emit()

#endregion
