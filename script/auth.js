class Auth{
    constructor(){
        
    }
    
    registerReq(login, password){
        if(login && password && login!=='' && password!==''){
            let body = 'type=register&login='+login+'&password='+password;
            let request = new XMLHttpRequest();
            request.responseType = 'text';
            request.onload=function(){
                if (request.response!='success'){
                    let div=document.getElementById('failDiv');
                    if(!div)
                        div = document.createElement('div');
                    div.innerHTML = "failed to register";
                    div.id='failDiv';
                    submit.before(div);
                }
                else{
                    submit.onclick();
                }
            }
            request.open("POST", document.location, true);
            request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            request.send(body);
        }
        else{
            let div=document.getElementById('failDiv');
            if(!div)
                div = document.createElement('div');
            div.innerHTML = "login or password is incorrect";
            div.id='failDiv';
            submit.after(div);
        }
    }

    loginReq(login, password){
        if(login && password && login!=='' && password!==''){
            let body = 'type=login&login='+login+'&password='+password;
            let request = new XMLHttpRequest();
            request.responseType = 'text';
            request.onload=function(){
                if (request.response==='failed to login'){
                    let div=document.getElementById('failDiv');
                    if(!div)
                        div = document.createElement('div');
                    div.innerHTML = "login or password is incorrect";
                    div.id='failDiv';
                    submit.before(div);
                }
                else{
                    document.location.reload();
                }
            }
            request.open("POST", document.location, true);
            request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            request.send(body);
        }
        else{
            let div=document.getElementById('failDiv');
            if(!div)
                div = document.createElement('div');
            div.innerHTML = "login or password is incorrect";
            div.id='failDiv';
            submit.after(div);
        }
    }
}

var auth = new Auth();

login = document.getElementById('login');
password=document.getElementById('password');
submit=document.getElementById('submit');
register=document.getElementById('register');

submit.onclick=function(){
    auth.loginReq(login.value, password.value);
}

register.onclick=function(){
    auth.registerReq(login.value, password.value);
}

login.addEventListener('keydown', function(e) {
    if (e.keyCode === 13) {
        submit.onclick();
    }
});

password.addEventListener('keydown', function(e) {
    if (e.keyCode === 13) {
        submit.onclick();
    }
});