class_name ResourceNode extends Node

@export var resourceType : ResourceType

@export var remaining_harvests : int
@export var max_harvests : int

@export var recharge_frequency_sec : float
@export var recharge_amaount : int

var recharge: Timer

func _ready():
	recharge = Timer.new()
	self.add_child(recharge)
	recharge.timeout.connect(_rechage)
	recharge.wait_time = recharge_frequency_sec
	recharge.start()

func _rechage():			
	remaining_harvests = min(max_harvests, remaining_harvests + recharge_amaount)
	print(name + "has " +  str(remaining_harvests) + " remaining harvests")

func _validate():
	if remaining_harvests <= 0:
		queue_free()

func take(n: int, item: ItemType): 
	if item not in resourceType.harvest_options:
		return 0
		
	if remaining_harvests >= n:
		remaining_harvests -= n
	else:
		n = remaining_harvests
		remaining_harvests = 0
	
	_validate()
	return n
		
		
