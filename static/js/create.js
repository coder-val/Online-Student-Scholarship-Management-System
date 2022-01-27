var user = document.getElementById('id_username')
p1 = document.getElementById('id_password1')
p2 = document.getElementById('id_password2')

user.onkeyup = function() {
    var result = user.value;
    p1.value = result;
    p2.value = result;
};

var form_fields = document.getElementsByTagName('input')
form_fields[1].placeholder = 'Student ID'
form_fields[2].placeholder = 'First Name'
form_fields[3].placeholder = 'Last Name'
form_fields[4].placeholder = 'Email'
form_fields[5].placeholder = 'Password'
form_fields[6].placeholder = 'Repeat Password'


for (var field in form_fields) {
    form_fields[field].className += ' form-control form-control-user'
}