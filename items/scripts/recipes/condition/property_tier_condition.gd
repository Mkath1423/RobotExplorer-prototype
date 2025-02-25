class_name PropertyTierCondition
extends Resource

enum PropertyTierConditionMode {
	EQUAL_TO,
	AT_LEAST,
	AT_MOST,
	GREATER_THAN,
	LESS_THAN
}
	
@export var property_id : ItemPropertyId = null 
@export var level : int = 0 
@export var mode : PropertyTierConditionMode = PropertyTierConditionMode.AT_LEAST 

func check_property(property: ItemProperty):
	if property_id == null or property.id != property_id:
		return false
	
	var tiered_property := property as TieredProperty
	
	if tiered_property == null:
		return false
		
	match mode:
		PropertyTierConditionMode.EQUAL_TO:
			return tiered_property.level == level
			
		PropertyTierConditionMode.AT_LEAST:
			return tiered_property.level >= level
			
		PropertyTierConditionMode.AT_MOST:
			return tiered_property.level <= level
			
		PropertyTierConditionMode.GREATER_THAN:
			return tiered_property.level > level
			
		PropertyTierConditionMode.LESS_THAN:
			return tiered_property.level < level

func check(item: Item):
	return property_id != null and \
		item.properties.any(check_property)
