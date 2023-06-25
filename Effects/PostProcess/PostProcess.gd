extends Node2D

var crt_shader = preload("res://Effects/PostProcess/Shaders/Crt.gdshader")
var dither_shader = preload("res://Effects/PostProcess/Shaders/Dither.gdshader")
var electric_lines_shader = preload("res://Effects/PostProcess/Shaders/ElectricLines.gdshader")
var eyes_shader = preload("res://Effects/PostProcess/Shaders/Eyes.gdshader")
var greyscale_shader = preload("res://Effects/PostProcess/Shaders/Greyscale.gdshader")
var invert_shader = preload("res://Effects/PostProcess/Shaders/Invert.gdshader")
var nebula_shader = preload("res://Effects/PostProcess/Shaders/Nebula.gdshader")
var pixelisation_shader = preload("res://Effects/PostProcess/Shaders/Pixelise.gdshader")
var radar_shader = preload("res://Effects/PostProcess/Shaders/Radar.gdshader")
var shockwave_shader = preload("res://Effects/PostProcess/Shaders/Shockwave.gdshader")
var super_hex_shader = preload("res://Effects/PostProcess/Shaders/SuperHex.gdshader")
var tv_static_shader = preload("res://Effects/PostProcess/Shaders/TvStatic.gdshader")
var vaporwave_shader = preload("res://Effects/PostProcess/Shaders/Vapourwave.gdshader")
var vcr_shader = preload("res://Effects/PostProcess/Shaders/Vcr.gdshader")
var voronoi_shader = preload("res://Effects/PostProcess/Shaders/Voronoi.gdshader")
var water_shader = preload("res://Effects/PostProcess/Shaders/Water.gdshader")

var increment : float = 0.005
const DEFAULT_PIXELISATION : float = 0.01
const SIZE_X : String = "size_x"
const SIZE_Y : String = "size_y"
const SWEEP_COLOUR : String = "sweepColor"


func crt() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = crt_shader
	
func dither() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = dither_shader

func electric_lines() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = electric_lines_shader
	
func eyes() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = eyes_shader
	
func greyscale() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = greyscale_shader

func invert() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = invert_shader

func nebula() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = nebula_shader

func reset_pixelisation() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = pixelisation_shader
	mat.set_shader_parameter(SIZE_X, DEFAULT_PIXELISATION)
	mat.set_shader_parameter(SIZE_Y, DEFAULT_PIXELISATION)

func increase_pixelisation() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	var current : float = mat.get_shader_parameter(SIZE_X)
	mat.set_shader_parameter(SIZE_X, current + increment)
	mat.set_shader_parameter(SIZE_Y, current + increment)
	
func decrease_pixelisation() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	var current : float = mat.get_shader_parameter(SIZE_X)
	mat.set_shader_parameter(SIZE_X, current - increment)
	mat.set_shader_parameter(SIZE_Y, current - increment)

func radar() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = radar_shader

func radar_set_colour(colour : Color) -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.set_shader_parameter(SWEEP_COLOUR, colour)

func shockwave() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = shockwave_shader

func super_hex() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = super_hex_shader

func tv_static() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = tv_static_shader
	
func vaporwave() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = vaporwave_shader
	
func vcr() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = vcr_shader

func voronoi() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = voronoi_shader

func water() -> void:
	var mat : ShaderMaterial = $ColorRect.material
	mat.shader = water_shader
