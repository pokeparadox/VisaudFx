extends Node2D

# Store a dictionary of which effects are enabled
const FLASH : String = "Flash"
const BG_COLOUR_SWAP : String = "BgColourSwap"
const PIRATE_SPIN : String = "PirateSpin"
const SPECTRUM : String = "Spectrum"
const DVD : String = "DVD"
const BORDER_SQ : String = "BorderSq"

var effect_enabled = { 
	FLASH : false, 
	BG_COLOUR_SWAP: false, 
	PIRATE_SPIN: false,
	SPECTRUM: true,
	DVD : true,
	BORDER_SQ : false
	}

func _ready():
	#perform initial setup of effects
	effect_enabled[FLASH] = Random.next_bool()
	effect_enabled[BG_COLOUR_SWAP] = Random.next_bool()
	effect_enabled[PIRATE_SPIN] = Random.next_bool()

func _on_main_bar_completed(current_bar : int, length : float):
	# Check for specific beat effect override
	
	# Check for randomised effect
		#perform initial setup of effects
	effect_enabled[FLASH] = Random.next_bool()
	effect_enabled[BG_COLOUR_SWAP] = Random.next_bool()
	effect_enabled[PIRATE_SPIN] = Random.next_bool()
	effect_enabled[SPECTRUM] = Random.next_bool()
	effect_enabled[DVD] = Random.next_bool()
	effect_enabled[BORDER_SQ] = Random.next_bool()
	
	# Check to enable or disable an effect
	if effect_enabled[FLASH]:
		if Random.next_bool():
			$Flash.next_colour()
		
	if effect_enabled[BG_COLOUR_SWAP]:
		if Random.next_bool():
			$BgColourSwap.next_colour(length)
		$BgColourSwap.fade = Random.next_bool()
			
	if effect_enabled[PIRATE_SPIN]:
		if Random.next_bool():
			$PirateSpin.set_max_scale(4)
		else:
			$PirateSpin.set_max_scale(-1)
			
		$PirateSpin.falling = Random.next_bool()
			
		$PirateSpin.modulate.a = Random.next_float_range(0.1, 1.0)
		
		if Random.next_bool():
			$PirateSpin.reverse_spin_direction()
		
		$PirateSpin.show()
	else:
		$PirateSpin.hide()
		
	if effect_enabled[SPECTRUM]:
		$Spectrum.modulate.a = Random.next_float_range(0.1, 1.0)
		$Spectrum.show()
	else:
		$Spectrum.hide()
		
	if effect_enabled[DVD]:
		$PirateDvd.modulate.a = Random.next_float_range(0.1, 1.0)
		$PirateDvd.trails = Random.next_bool()
		$PirateDvd.show()
	else:
		$PirateDvd.hide()
		
	if effect_enabled[BORDER_SQ]:
		$BorderFollowSquares.modulate.a = Random.next_float_range(0.1, 1.0)
		
		if Random.next_bool():
			$BorderFollowSquares.next_colour()
		
		$BorderFollowSquares.show()
	else:
		$BorderFollowSquares.hide()
		
func _on_main_beat_completed(current_beat : int, length : float):
	if effect_enabled[FLASH]:
		$Flash.play(current_beat, length)
	if effect_enabled[PIRATE_SPIN]:
		$PirateSpin.spin(0.2)
	if effect_enabled[BORDER_SQ]:
		$BorderFollowSquares.add_square()
