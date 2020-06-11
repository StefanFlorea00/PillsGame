extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var money = []
var used_cells = get_used_cells()
var usedCells = []
var buildings = []

# Called when the node enters the scene tree for the first time.
func _ready():
	addBuildings() # Replace with function body.


func addBuildings():
	print("Used Cells:", get_used_cells())
	usedCells = get_used_cells()
	for tile in usedCells.size():
		var building : Building = Building.new()
		building.position.x = usedCells[tile].x
		building.position.y = usedCells[tile].y
		building.money = 15
		building.id = tile+1
		buildings.append(building)
		set_cellv(Vector2(usedCells[tile].x, usedCells[tile].y),1)
	printBuildings()
		
func printBuildings():
	for building in buildings.size():
		print("CELL: ", buildings[building].position, "ID: ", buildings[building].id)
		
func getBuildingX(x, y):
	for building in buildings.size():
		if (buildings[building].position.x == x && buildings[building].position.y == y):
			return(buildings[building].position.x)

func getBuildingY(x, y):
	for building in buildings.size():
		if (buildings[building].position.x == x && buildings[building].position.y == y):
			return(buildings[building].position.y)
			
func getBuildingPos(x,y):
	for building in buildings.size():
		if (buildings[building].position.x == x && buildings[building].position.y == y):
			return(buildings[building].position)

func getBuilding(x, y):
	for building in buildings.size():
		if (buildings[building].position.x == x && buildings[building].position.y == y):
			return buildings[building]

func getBuildingID(x,y):
	for building in buildings.size():
		if (buildings[building].position.x == x && buildings[building].position.y == y):
			return buildings[building].id

func getBuildingMoney(x,y):
	for building in buildings.size():
		if (buildings[building].position.x == x && buildings[building].position.y == y):
			return buildings[building].money
			
func setBuildingSelected(x,y,selected):
	for building in buildings.size():
		if (buildings[building].position.x == x && buildings[building].position.y == y):
			buildings[building].selected = selected
			
func getSelectedBuilding():
	for building in buildings.size():
		if (buildings[building].selected):
			return buildings[building]


func getBuildingSelected(x,y):
	for building in buildings.size():
		if (buildings[building].position.x == x && buildings[building].position.y == y):
			return buildings[building].selected
			
func setBuilding(x,y):
	var building : Building = Building.new()
	building.position.x = x
	building.position.y = y
	building.money = 15
	building.id = 100+ buildings.size()
	buildings.append(building)
	set_cellv(Vector2(x, y),1)
	print("ADDED: ", building.id, building.position)

func deleteBuilding(x,y):
	for building in buildings.size():
		if (buildings[building].position.x == x && buildings[building].position.y == y):
			print("DELETED:", buildings[building].id, buildings[building].position)
			buildings.erase(buildings[building])
			set_cellv(Vector2(x, y),-1)

#func addCellData():
#	for i in range(buildings.size()):
#		used_cells[i] = 15
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
