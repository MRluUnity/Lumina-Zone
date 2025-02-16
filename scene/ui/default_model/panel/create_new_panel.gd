#--------------------------------------
# 这个类
# 类中自定义了
# 定义了
#--------------------------------------
class_name CreateNewPanel extends PanelModel

# TODO 创建新面板UI ===============>信 号<===============
#region 信号

#endregion

# TODO 创建新面板UI ===============>常 量<===============
#region 常量
const PANEL_GROUP : String = "res://scene/ui/default_model/panel/can_create_panel/"
#endregion

# TODO 创建新面板UI ===============>变 量<===============
#region 变量
@onready var panel_list: VBoxContainer = %PanelList

#endregion

# TODO 创建新面板UI ===============>虚方法<===============
#region 常用的虚方法
func _init() -> void:
	pass

func _ready() -> void:
	for i in panel_list.get_children():
		i.queue_free()

	var dir = DirAccess.open(PANEL_GROUP)
	for file in dir.get_files():
		if file.ends_with(".gd") or file.ends_with(".uid"): continue
		print(PANEL_GROUP.path_join(file))
		var scene : PanelModel = load(PANEL_GROUP.path_join(file)).instantiate()

		var button : Button = Button.new()
		button.text = scene.panel_name
		button.pressed.connect(_on_panel_button_pressed.bind(button.text))
		panel_list.add_child(button)

		scene.queue_free()
#endregion

# TODO 创建新面板UI ===============>信号链接方法<===============
#region 信号链接方法
func _on_panel_button_pressed(_panel_name : String) -> void:
	UiTool.add_ui_scene_to_ui_ex(UiTool.UI_NAME[_panel_name], UiTool.UiType.PANEL, "ui_ex")
	UiTool.queue_free_null_ui_scene(self)
#endregion

# TODO 创建新面板UI ===============>工具方法<===============
#region 工具方法

#endregion
