class_name Hub
extends Node

# List of building nodes
var buildings: Array[Building] = []

# List of connections between buildings, each connection is a pair of indices (or names)
var connections: Array = []

# Adds a building to the list
func add_building(building: Building) -> void:
    if not buildings.has(building):
        buildings.append(building)
        building.register_hub(self)


# Removes a building and its associated connections
func remove_building(building: Node2D) -> void:
    if buildings.has(building):
        var index = buildings.find(building)
        buildings.erase(building)
        # Remove connections related to this building
        connections = connections.filter(func(conn): 
            return conn[0] != index and conn[1] != index
        )
        print("Building removed:", building.name)

# Connects two buildings
func connect_buildings(building_a: Building, building_b: Building, anchor: Vector3) -> void:
    var index_a = buildings.find(building_a)
    var index_b = buildings.find(building_b)
    
    if index_a == -1 or index_b == -1:
        print("One or both buildings are not in the list.")
        return
    
    # Prevent duplicate connections
    var connection = [index_a, index_b]
    if not connections.has(connection) and not connections.has(connection.inverted()):
        connections.append(connection)
        
        building_a.add_connection(building_b, anchor)
        building_b.add_connection(building_a, anchor)

# Disconnects two buildings
func disconnect_buildings(building_a: Building, building_b: Building) -> void:
    var index_a = buildings.find(building_a)
    var index_b = buildings.find(building_b)
    
    if index_a == -1 or index_b == -1:
        print("One or both buildings are not in the list.")
        return
    
    var connection = [index_a, index_b]
    connections.erase(connection)
    connections.erase(connection.inverted())
    
    building_a.remove_connection(building_b)
    building_b.remove_connection(building_a)
    
    
func debug_print() -> void:
    print("Buildings:", buildings)
    print("Connections:", connections)
