class_name ItemCondition
extends Resource

@export var item_id : Item = null

func check(item: Item):
	return item_id != null and item == item_id
