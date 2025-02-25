class_name LogicalNotCondition
extends Resource

@export var to_check : ItemCondition = null

func check(item: Item):
	return to_check != null and not to_check.check(item)
