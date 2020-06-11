extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var buildingsSet = $TileMapBuildings
onready var worldSet = $TileMapWorld
onready var clickedTileSet = $TileMapClicked
onready var selected_tile = clickedTileSet.tile_set.find_tile_by_name("BlockTileset_4")
onready var selected_tile_hover = clickedTileSet.tile_set.find_tile_by_name("BlockTileset_6")
onready var debugUI = $GUI/DebugUI/Control
onready var selectedUI = $GUI/SelectedUI

onready var selected_tiles_max = 1;
onready var selected_tiles_nr = 0;
onready var selected_tile_last = Vector2(0,0);
onready var hover_tile_last_pos = Vector2(0,0)
onready var selected_tiles=[];
onready var attempted

signal selected_changed

func _on_Selected_Changed(selectedid,selectedpos,selectedmoney):
	emit_signal("selected_changed", selectedid,selectedpos,selectedmoney)

func _on_Menu_add_building():
	buildingsSet.setBuilding(selected_tile_last.x-1,selected_tile_last.y-1)

func _on_Menu_delete_building():
	buildingsSet.deleteBuilding(selected_tile_last.x-1,selected_tile_last.y-1)

func updateUI(id, money, buildingx, buildingy, selected, buildingtilepos, worldtilepos):
	debugUI.emit_signal("id_changed",id)
	debugUI.emit_signal("money_changed",money)
	debugUI.emit_signal("x_changed",buildingx)
	debugUI.emit_signal("y_changed",buildingy)
	debugUI.emit_signal("selected_changed", selected)
	debugUI.emit_signal("building_pos_changed", buildingtilepos)
	debugUI.emit_signal("world_pos_changed", worldtilepos)
	
func updateSelectedUI(id, money, x,y):
	selectedUI.emit_signal("id_changed", id)
	selectedUI.emit_signal("money_changed", money)
	selectedUI.emit_signal("x_changed",Vector2(x,y))
	
func showSelectedTile(x,y,selected):
	if(selected):
		clickedTileSet.set_cellv(Vector2(x,y),selected_tile)
	else:
		clickedTileSet.set_cellv(Vector2(x,y),-1)
		
func showSelectedTileHover(x,y,state):
	if(state):
		clickedTileSet.set_cellv(Vector2(x,y),selected_tile_hover)
	else:
		clickedTileSet.set_cellv(Vector2(x,y),-1)

func hoverTile(x,y):
	showSelectedTileHover(x,y, true)
	if(x != hover_tile_last_pos.x || y != hover_tile_last_pos.y):
		if(clickedTileSet.get_cellv(hover_tile_last_pos)==selected_tile_hover):
			showSelectedTileHover(hover_tile_last_pos.x,hover_tile_last_pos.y,false)
	hover_tile_last_pos = Vector2(x,y)
	
func selectBuilding(x,y,selected):
	if(buildingsSet.getBuildingID(x,y)!=null):
		showSelectedTile(x+1,y+1, selected)
		buildingsSet.setBuildingSelected(x, y, selected)
	emit_signal("selected_changed",buildingsSet.getBuildingID(x,y),buildingsSet.getBuildingPos(x,y),buildingsSet.getBuildingMoney(x,y))

	
func selectWorld(x,y,selected):
	showSelectedTile(x,y,selected)
	worldSet.setSelected(x,y,selected)
		
#fromworld = if translating from worldtile to buildingtile
func selectTile(x,y,selected):
	if(buildingsSet.getBuildingID(x, y)!=null):
		selectBuilding(x,y,selected)
		if(selected):
			selected_tiles_nr += 1
		else:
			selected_tiles_nr -= 1
	elif(worldSet.getCellID(x,y)!=null):
		selectWorld(x,y,selected)
		if(selected):
			selected_tiles_nr += 1
		else:
			selected_tiles_nr -= 1

func isTileSelected(x,y):
	if(worldSet.getSelected(x,y)!=null || buildingsSet.getSelectedBuilding()!=null):
		print(worldSet.getSelected(x,y))
		return true
	else:
		print(false)
		return false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func _unhandled_input(event):
	
	var building_mouse_pos = buildingsSet.get_local_mouse_position()
	var building_tile_pos = buildingsSet.world_to_map(building_mouse_pos)
	building_tile_pos.x -= 1
	building_tile_pos.y -= 1
	var world_mouse_pos = worldSet.get_local_mouse_position()
	var world_tile_pos = worldSet.world_to_map(world_mouse_pos)
	var world_selected_pos = Vector2(building_tile_pos.x+1,building_tile_pos.y+1)
	
	updateUI(buildingsSet.getBuildingID(building_tile_pos.x, building_tile_pos.y),buildingsSet.getBuildingMoney(building_tile_pos.x, building_tile_pos.y),
	buildingsSet.getBuildingX(building_tile_pos.x, building_tile_pos.y), buildingsSet.getBuildingY(building_tile_pos.x, building_tile_pos.y), buildingsSet.getBuildingSelected(building_tile_pos.x, building_tile_pos.y),
	building_tile_pos, world_tile_pos)
	
	if(clickedTileSet.get_cellv(world_tile_pos)!=0):
		hoverTile(world_tile_pos.x,world_tile_pos.y)
	
	if event is InputEventMouseButton:
		
		if event.pressed:
			print("SELECTED_TILES_NR: ", selected_tiles_nr)
			print("SELECTED_TILE_LAST: ", selected_tile_last)
			
#			if(world_tile_pos==selected_tile_last && isTileSelected(world_tile_pos.x,world_tile_pos.y) == true):
#				selectTile(world_tile_pos.x,world_tile_pos.y,false)
			
			if(selected_tiles_nr<selected_tiles_max):
				if(isTileSelected(world_tile_pos.x,world_tile_pos.y)):
					selectTile(world_tile_pos.x,world_tile_pos.y,true)
			elif(selected_tiles_nr==selected_tiles_max):
				selectTile(selected_tile_last.x,selected_tile_last.y,false)
				selectTile(world_tile_pos.x,world_tile_pos.y,true)
				

			selected_tile_last = world_tile_pos
			
				
			
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

