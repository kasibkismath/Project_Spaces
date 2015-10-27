// Passwords Match
function onLoad() {
	$('#password').keyup(checkPasswordsMatch);
	$('#confirmPassword').keyup(checkPasswordsMatch);
	$('#signUpFormDetails').submit(canSubmit);
}

function checkPasswordsMatch() {
	var password = $('#password').val();
	var confirmPassword = $('#confirmPassword').val();

	if (password.length > 7 || confirmPassword.length > 7) {
		if (password == confirmPassword) {
			$('#matchedPasswords').show();
			$('#unMatchedPasswords').hide();
		} else {
			$('#unMatchedPasswords').show();
			$('#matchedPasswords').hide();
		}
	}

	if (password == "" && confirmPassword == "") {
		$('#unMatchedPasswords').hide();
		$('#matchedPasswords').hide();
	}
}

function canSubmit() {
	var password = $('#password').val();
	var confirmPassword = $('#confirmPassword').val();

	if (password != confirmPassword) {
		alert("Passwords DO NOT Match!")
		return false;
	} else {
		return true;
	}
}
$(document).ready(onLoad);