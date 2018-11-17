extends Node

onready var combat_arena = $CombatArena
onready var transition = $Overlays/TransitionColor
onready var party = $Party

func _ready():
	enter_battle("res://combat/battlers/formations/PorcupineFormation001.tscn")

func enter_battle(formation_name : String):
	"""
	Plays the combat transition animation and initializes the combat scene
	"""
	yield(transition.fade_to_color(), "completed")
	var formation: Formation = load(formation_name).instance()
	combat_arena.initialize(formation, party)
	yield(get_tree().create_timer(0.8), "timeout")
	yield(transition.fade_from_color(), "completed")
	combat_arena.battle_start()
