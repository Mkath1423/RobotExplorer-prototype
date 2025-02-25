class_name PropertyIdCondition
extends Resource

@export var property_id : ItemPropertyId = null 

func check(item: Item):
	return property_id != null and \
		item.properties.any(func(p): p.id == property_id)
