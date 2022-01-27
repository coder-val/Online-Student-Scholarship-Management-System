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