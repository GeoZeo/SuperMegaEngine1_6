function check_password(argument0) {
	//check_password(my_pass)
	var bin_pass;
	var max_pass;
	
	if cfgTwoPasswordColours {
		max_pass = 96;
		var tern_pass = argument0;
		bin_pass = block_base_convert(tern_pass, 3, 2, 2, 3);
	}
	else {
		max_pass = 64;
		bin_pass = argument0;
	}

	bin_pass = string_lpad(bin_pass, max_pass, "0");

	//Change character to compute the correct password size
	var charlen = ceil(log2(global.totalCharacters));
	setPlayer(global.characters[real(base_convert(string_copy(bin_pass, 1, charlen), 2, 10))]);

	var pass_size = password_size()
	var base_pass = string_copy(bin_pass, 1, pass_size);
	var checksum = string_copy(bin_pass, 1 + pass_size, max_pass - pass_size);
	var correct_checksum = password_checksum(base_pass);

	print("bin pass", bin_pass, string_length(bin_pass), "base pass", base_pass, string_length(base_pass));

	if cfgTwoPasswordColours print("tern pass size", string_length(tern_pass), "password size", string_length(bin_pass), "base bin password size", pass_size, "checksum size", string_length(checksum), "correct checksum size", string_length(correct_checksum));
	else print("bin pass size", string_length(bin_pass), "password size", string_length(bin_pass), "base bin password size", pass_size, "checksum size", string_length(checksum), "correct checksum size", string_length(correct_checksum));
	print("found checksum", checksum, "correct checksum", correct_checksum);

	return checksum == correct_checksum;



}
