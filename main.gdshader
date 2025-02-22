shader_type spatial;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform vec4 albedo_color : source_color = vec4(0.2, 0.5, 0.3, 1.0); // Default: Red

void fragment() {
    ALBEDO = albedo_color.rgb; // Set surface color
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
