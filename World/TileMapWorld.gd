extends TileMap


var used_cells = get_used_cells()
var world = []
var usedCells = []
var worldCells = []

# Called when the node enters the scene tree for the first time.
func _ready():
	addWorldTiles() # Replace with function body.


func addWorldTiles():
	print("Used WorldCells:", get_used_cells())
	usedCells = get_used_cells()
	for tile in usedCells.size():
		var worldCell : WorldCell = WorldCell.new()
		worldCell.position.x = usedCells[tile].x
		worldCell.position.y = usedCells[tile].y
		worldCell.id = tile+1
		worldCells.append(worldCell)
		set_cellv(Vector2(usedCells[tile].x, usedCells[tile].y),0)

func getSelected(x,y):
	for worldCell in worldCells.size():
		if (worldCells[worldCell].position == Vector2(x,y)):
			return worldCells[worldCell].getSelected()
			
func getSelectedCell():
	for worldCell in worldCells.size():
		if (worldCells[worldCell].selected):
			return worldCells[worldCell]
			
func setSelected(x,y,selected):
	for worldCell in worldCells.size():
		if (worldCells[worldCell].position == Vector2(x,y)):
			worldCells[worldCell].setSelected(selected)

func getCellID(x,y):
	for worldCell in worldCells.size():
		if (worldCells[worldCell].position.x == x && worldCells[worldCell].position.y == y):
			return worldCells[worldCell].id

			

