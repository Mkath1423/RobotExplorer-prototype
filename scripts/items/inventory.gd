class_name Inventory extends Node

var inventory : Dictionary = {}

@export var max_capacity : int
var current_amount : int = 0

func add(n: int, i: ItemType):
	var amount_to_add : int = min(n, max_capacity - current_amount)
	inventory[i] = inventory.get (i, 0) + amount_to_add
	return n - amount_to_add

func add_all(items: Dictionary):
	for item in items:
		items[item] = add(items[item], item)
		
	return items

func take(n: int, i: ItemType):
	var available = inventory.get(i, 0)
	
	if available <= n:
		inventory.erase(i)
		return available
	else:
		inventory[i] -= n
		return n

func take_all(items: Dictionary):
	for item in items:
		items[item] = take(items[item], item)
		
	return items

