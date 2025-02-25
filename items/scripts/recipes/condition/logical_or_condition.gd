class_name LogicalOrCondition
extends Resource

@export var to_check : Array[ItemCondition] = [] 

func check(item: Item):
	if to_check == null or to_check.size() == 0:
		return false
		
	for c in to_check:
		if c.check(item):
			return true
			
	return false
