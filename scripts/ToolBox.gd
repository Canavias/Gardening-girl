extends Node3D

# 工具节点列表
var tools: Array[Node3D] = [] # 所有工具节点
var current_tool: int = 0     # 当前显示的工具索引

# 初始化，收集所有工具节点并显示第一个
func _ready() -> void:
	tools = [
		get_node("Tool1"),
		get_node("Tool2"),
		get_node("Tool3"),
		get_node("Tool4"),
		get_node("Tool5"),
		get_node("Tool6")
	]
	_show_tool(0)

# 输入处理，按下1-6切换不同工具
func _input(event) -> void:
	if event.is_action_pressed("tool_1"):
		_show_tool(0)
	elif event.is_action_pressed("tool_2"):
		_show_tool(1)
	elif event.is_action_pressed("tool_3"):
		_show_tool(2)
	elif event.is_action_pressed("tool_4"):
		_show_tool(3)
	elif event.is_action_pressed("tool_5"):
		_show_tool(4)
	elif event.is_action_pressed("tool_6"):
		_show_tool(5)

# 显示指定索引的工具，其余隐藏
func _show_tool(idx: int) -> void:
	for i in range(tools.size()):
		tools[i].visible = (i == idx)
	current_tool = idx
