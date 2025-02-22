@tool
extends MeshInstance3D

@export var grid_size: int = 20   :
	set(value):
		grid_size = value
		generate_terrain()

@export var cell_size: float = 1.0  :
	set(value):
		cell_size = value
		generate_terrain()

@export var height_scale: float = 2.5  :
	set(value):
		height_scale = value
		generate_terrain()

var noise = FastNoiseLite.new() # Perlin noise generator

func _enter_tree():
	_ready()
	

func _ready():
	noise.seed = randi()
	noise.frequency = 0.1
	generate_terrain()

func generate_terrain():
	var mesh = ArrayMesh.new()
	var st = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)

	for x in range(grid_size):
		for z in range(grid_size):
			# Get Perlin noise height
			var height = noise.get_noise_2d(x, z) * height_scale
			var height_next_x = noise.get_noise_2d(x+1, z) * height_scale
			var height_next_z = noise.get_noise_2d(x, z+1) * height_scale
			var height_diag = noise.get_noise_2d(x+1, z+1) * height_scale

			# Create 4 vertices (2 triangles per square)
			var v1 = Vector3(x * cell_size, height, z * cell_size)
			var v2 = Vector3((x+1) * cell_size, height_next_x, z * cell_size)
			var v3 = Vector3(x * cell_size, height_next_z, (z+1) * cell_size)
			var v4 = Vector3((x+1) * cell_size, height_diag, (z+1) * cell_size)

			# Triangle 1
			st.add_vertex(v1)
			st.add_vertex(v2)
			st.add_vertex(v3)

			# Triangle 2
			st.add_vertex(v2)
			st.add_vertex(v4)
			st.add_vertex(v3)

	st.generate_normals()
	st.commit(mesh)
	self.mesh = mesh
