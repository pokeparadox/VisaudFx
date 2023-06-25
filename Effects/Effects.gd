extends Node2D

# Store a dictionary of which effects are enabled
const FLASH : String = "Flash"
const BG_COLOUR_SWAP : String = "BgColourSwap"
const PIRATE_SPIN : String = "PirateSpin"
const SPECTRUM : String = "Spectrum"
const DVD : String = "DVD"
const BORDER_SQ : String = "BorderSq"
const POST_PROCESS : String = "PostProcess"

# SHADERS
const CRT : String = "Crt"
const DITHER : String = "Dither"
const ELECTRIC_LINES : String = "ElectricLines"
const EYES : String = "Eyes"
const GREYSCALE : String = "Greyscale"
const INVERT : String = "Invert"
const NEBULA : String = "Nebula"
const PIXELISE : String = "Pixelise"
const RADAR : String = "Radar"
const SHOCKWAVE : String = "Shockwave"
const SUPER_HEX : String = "SuperHex"
const TV_STATIC : String = "TvStatic"
const VAPORWAVE : String = "Vaporwave"
const VCR : String = "Vcr"
const VORONOI : String = "Voronoi"
const WATER : String = "Water"


var effect_enabled = { 
	FLASH : false, 
	BG_COLOUR_SWAP: false, 
	PIRATE_SPIN: false,
	SPECTRUM: true,
	DVD : true,
	BORDER_SQ : false,
	POST_PROCESS : false
	}
	
var shader_enabled = {
	CRT : false,
	DITHER : false,
	ELECTRIC_LINES : false,
	EYES : false,
	GREYSCALE : false,
	INVERT : false,
	NEBULA : false,
	PIXELISE : false,
	RADAR : false,
	SHOCKWAVE : false,
	SUPER_HEX : false,
	TV_STATIC : false,
	VAPORWAVE : false,
	VCR : false,
	VORONOI : false,
	WATER : false
}

func _ready():
	#perform initial setup of effects
	effect_enabled[FLASH] = Random.next_bool()
	effect_enabled[BG_COLOUR_SWAP] = Random.next_bool()
	effect_enabled[PIRATE_SPIN] = Random.next_bool()

func _on_main_bar_completed(current_bar : int, length : float):
	# Check for specific beat effect override
	var num_changes : int = Random.next_int_range(0, effect_enabled.size())
	var current_changes : int = 0
	
	# Check for randomised effect
	for i in effect_enabled.keys():
		if current_changes < num_changes:
			effect_enabled[i] = Random.next_bool()
			current_changes = current_changes + 1
		else:
			break
	if effect_enabled[POST_PROCESS]:
		var current_i : int = 0
		var target_i : int = Random.next_int_range(0, shader_enabled.size())
		for i in shader_enabled.keys():
			shader_enabled[i] = current_i == target_i
			current_i += 1
	
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
		
	if not effect_enabled[POST_PROCESS] and effect_enabled[DVD]:
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
		
	# Post Process
	if effect_enabled[POST_PROCESS]:
		$PostProcess.show()
		if shader_enabled[CRT]:
			$PostProcess.crt()
		elif shader_enabled[DITHER]:
			$PostProcess.dither()
		elif shader_enabled[ELECTRIC_LINES]:
			$PostProcess.electric_lines()
		elif shader_enabled[EYES]:
			$PostProcess.eyes()
		elif shader_enabled[GREYSCALE]:
			$PostProcess.greyscale()
		elif shader_enabled[INVERT]:
			$PostProcess.invert()
		elif shader_enabled[NEBULA]:
			$PostProcess.nebula()
		elif shader_enabled[PIXELISE]:
			$PostProcess.reset_pixelisation()
		elif shader_enabled[RADAR]:
			$PostProcess.radar()
		elif shader_enabled[SHOCKWAVE]:
			$PostProcess.shockwave()
		elif shader_enabled[SUPER_HEX]:
			$PostProcess.super_hex()
		elif shader_enabled[TV_STATIC]:
			$PostProcess.tv_static()
		elif shader_enabled[VAPORWAVE]:
			$PostProcess.vaporwave()
		elif shader_enabled[VCR]:
			$PostProcess.vcr()
		elif shader_enabled[VORONOI]:
			$PostProcess.voronoi()
		elif shader_enabled[WATER]:
			$PostProcess.water()
	else:
		$PostProcess.hide()

func _on_main_beat_completed(current_beat : int, length : float):
	if effect_enabled[FLASH]:
		$Flash.play(current_beat, length)
	if effect_enabled[PIRATE_SPIN]:
		$PirateSpin.spin(0.2)
	if effect_enabled[BORDER_SQ]:
		$BorderFollowSquares.add_square()
	if effect_enabled[POST_PROCESS]:
		if shader_enabled[PIXELISE]:
			if Random.next_bool():
				$PostProcess.increase_pixelisation()
			else:
				$PostProcess.decrease_pixelisation()
		elif shader_enabled[RADAR]:
			var r : float = Random.next_int_range(0, 255) / 255.0
			var g : float = Random.next_int_range(0, 255) / 255.0
			var b : float = Random.next_int_range(0, 255) / 255.0
			$PostProcess.radar_set_colour(Color(r,g,b,1.0))

