// window.onload = function() {
//     var user = document.getElementById('id_username')
//     var email = document.getElementById('id_email')
//     var pass1 = document.getElementById('id_password1')
//     var pass2 = document.getElementById('id_password2')
//     user.style.opacity = '1'
//     user.className = 'form-control form-control-user'
//     user.placeholder = 'Username'

//     email.style.opacity = '1'
//     email.className = 'form-control form-control-user'
//     email.placeholder = 'Email'

//     pass1.style.opacity = '1'
//     pass1.className = 'form-control form-control-user'
//     pass1.placeholder = 'Password'

//     pass2.style.opacity = '1'
//     pass2.className = 'form-control form-control-user'
//     pass2.placeholder = 'Repeat Password'
// }
function dashActive() {
    document.getElementById('dashboard').classList.add('active')
    document.getElementById('studentlist').classList.remove('active')
    document.getElementById('filemanager').classList.remove('active')
}

function listActive() {
    document.getElementById('dashboard').classList.remove('active')
    document.getElementById('studentlist').classList.add('active')
    document.getElementById('filemanager').classList.remove('active')
}

function fileActive() {
    document.getElementById('dashboard').classList.remove('active')
    document.getElementById('studentlist').classList.remove('active')
    document.getElementById('filemanager').classList.add('active')
}