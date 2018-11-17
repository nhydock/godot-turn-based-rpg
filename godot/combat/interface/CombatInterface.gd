extends CanvasLayer

onready var lifebar_builder = $LifebarsBuilder
onready var oldschool_ui = $OldSchoolUI
onready var select_arrow = $SelectArrow

func initialize(battlers : Array):
	lifebar_builder.initialize(battlers)
	oldschool_ui.initialize(battlers)

func select_target(selectable_battlers : Array) -> Battler:
	var selected_target : Battler = yield(select_arrow.select_target(selectable_battlers), "completed")
	return selected_target
