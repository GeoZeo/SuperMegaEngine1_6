/// @description  debug_password()
function debug_password() {
	var my_pass;
	
	if cfgTwoPasswordColours {
		var tern_pass = get_string("Type the ternary password", make_password());
		my_pass = tern_pass;
	}
	else {
		var bin_pass = get_string("Type the binary password", make_password());
		my_pass = bin_pass;
	}

	if check_password(my_pass) {
	    apply_password(my_pass);
	    playSFX(sfxMenuSelect);
	}
	else {
	    playSFX(sfxError);
	    print("ERROR: Invalid password.");
	}



}
