class_name LogicalAndCondition
extends Resource

@export var to_check : Array[ItemCondition] = [] 

func check(item: Item):
	if to_check == null or to_check.size() == 0:
		return true
		
	for c in to_check:
		if not c.check(item):
			return false
			
	return true
