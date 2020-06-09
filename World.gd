extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var buildingsSet = $TileMapBuildings
onready var worldSet = $TileMapWorld
onready var clickedTileSet = $TileMapClicked
onready var selected_tile = clickedTileSet.tile_set.find_tile_by_name("BlockTileset_4")
onready var debugUI = $CanvasLayer/DebugUI/Control

onready var selected_tiles_max = 1;
onready var selected_tiles_nr = 0;
onready var selected_tile_last = Vector2(0,0);
onready var selected_tiles=[];

func updateUI(id, money, buildingx, buildingy, selected):
	debugUI.emit_signal("id_changed",id)
	debugUI.emit_signal("money_changed",money)
	debugUI.emit_signal("x_changed",buildingx)
	debugUI.emit_signal("y_changed",buildingy)
	debugUI.emit_signal("selected_changed", selected)
	
func showSelectedTile(x,y):
	clickedTileSet.set_cellv(Vector2(x,y),selected_tile)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	
	var building_mouse_pos = buildingsSet.get_local_mouse_position()
	var building_tile_pos = buildingsSet.world_to_map(building_mouse_pos)
	var world_selected_pos = Vector2(building_tile_pos.x+1,building_tile_pos.y+1)
	updateUI(buildingsSet.getBuildingID(building_tile_pos.x, building_tile_pos.y),buildingsSet.getBuildingMoney(building_tile_pos.x, building_tile_pos.y),
	buildingsSet.getBuildingX(building_tile_pos.x, building_tile_pos.y), buildingsSet.getBuildingY(building_tile_pos.x, building_tile_pos.y), buildingsSet.getBuildingSelected(building_tile_pos.x, building_tile_pos.y))
	
	if event is InputEventMouseButton:
		
		if event.pressed:

			print("BUILDINGPOS:", building_tile_pos)
			print("SELECTED TILES:", selected_tiles_nr)
			print("BUILDING:" , buildingsSet.getBuilding(building_tile_pos.x, building_tile_pos.y))
			print("BUILDINGID:" , buildingsSet.getBuildingID(building_tile_pos.x, building_tile_pos.y))

			if(selected_tiles_nr<selected_tiles_max):
				if(buildingsSet.getBuildingID(building_tile_pos.x, building_tile_pos.y)!=null):
						if(clickedTileSet.get_cellv(world_selected_pos)==-1):
							buildingsSet.setBuildingSelected(building_tile_pos.x, building_tile_pos.y, true)
							showSelectedTile(world_selected_pos.x, world_selected_pos.y)
							selected_tiles_nr += 1
	
			if(selected_tiles_nr>=selected_tiles_max):
				if(buildingsSet.getBuildingID(building_tile_pos.x, building_tile_pos.y)!=null):
					buildingsSet.setBuildingSelected(selected_tile_last.x, selected_tile_last.y, false)
					clickedTileSet.set_cellv(Vector2(selected_tile_last.x+1,selected_tile_last.y+1),-1)
					print(selected_tile_last)
					showSelectedTile(world_selected_pos.x, world_selected_pos.y)
					buildingsSet.setBuildingSelected(building_tile_pos.x, building_tile_pos.y, true)
					
			if(buildingsSet.getBuildingID(building_tile_pos.x, building_tile_pos.y)!=null):
				selected_tile_last = building_tile_pos
#			if(clickedTileSet.get_cellv(world_tile_pos)==0):
#					clickedTileSet.set_cellv(world_tile_pos,-1)
#					selected_tiles_nr -= 1
#					print("worldtile")
#			if(clickedTileSet.get_cellv(building_tile_pos)==0):
#					clickedTileSet.set_cellv(building_tile_pos,-1)
#					selected_tiles_nr -= 1
#					print("buildingtile")
				
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
