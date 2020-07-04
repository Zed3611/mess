// var getContacts = function(){
//     $.post(document.location, {'getContacts': true}, function(data){
//         viewContacts(JSON.parse(data))
//     });
// }
var getContacts = function(){
    $.post(document.location, {'type': 'getContacts'}, function(data){
        viewContacts(JSON.parse(data))
    });
}
getContacts();
var timer;
var g_user;
var g_lastDate;
var g_contacts = [];

$(document).ready(function(){
    var messageField = $('#message-send-field');
    var messageSender = $('#send');
    
    messageSender.click(function(handler){
        addMessage(g_user, messageField.val());
        messageField.val('');
    });
    messageField.on('keypress', function(e){
        if(e.which == 13)
            messageSender.click();
    });
    timer=setInterval(()=> checkNewMessages(), 5000);
    let search = $('#search');
    search.focusin(function(){
        searchIn(search);
    });
    search.focusout(function(){
        searchOut(search);
    });
    $('#search-button').click(function(event){
        searchSend(search.val());
    });
    $('#yandex-search-button').click(function(event){
        yandexSearch($('#yandex-search').val());
    });
});

// var yandexSearch = function(value){
//     $.post(document.location, {'yandexSearch': true, 'value': value}, function(data){
//         $('body').html( data );
//     });
// }

var yandexSearch = function(value){
    $.post(document.location, {'type': 'yandexSearch', 'value': value}, function(data){
        //data=JSON.parse(data);
        if(data[0]==='captcha'){
            var newWindow = window.open();
            newWindow.document.write(data[1]);
            let inp = $('<input>', {
                'type': 'text'
            });
            newWindow.append(inp);
        }
        //$('body').html( data );
        var newWindow = window.open();
        newWindow.document.open();
        newWindow.document.write(data);
        newWindow.document.close();
    });
}

// var checkNewMessages = function(){
//     if(g_user){
//         $.post(document.location, {'checkNewMessages': true, 'userLogin': g_user, 'date': g_lastDate, 'limit': 20}, function(data){
//             if(data!='no updates'){
//                 data=JSON.parse(data);
//                 g_lastDate=data[0]['date'];
//                 data = data.reverse();
//                 let messages = $('.user-messages');
//                 let scroll=messages.scrollTop();
//                 data.forEach(message => {
//                     let elem=$("<div>",{
//                         class: 'message',
//                     });
//                     elem.append($("<div>", {
//                         class: 'message-content',
//                         text: message['content']
//                     }));
//                     elem.append($("<div>", {
//                         class: 'user',
//                         text: message['fromLogin'] == g_user ? message['fromLogin'] : 'you'
//                     }));
//                     if(message['fromLogin']!=g_user)
//                         elem.css('margin-left', 'auto');
//                     messages.append(elem);
//                 });
//                 messages.scrollTop(scroll);
//             }
//         });
//     }
// }

var checkNewMessages = function(){
    if(g_user){
        $.post(document.location, {'type': 'checkNewMessages', 'userLogin': g_user, 'date': g_lastDate, 'limit': 20}, function(data){
            if(data!='no updates'){
                data=JSON.parse(data);
                g_lastDate=data[0]['date'];
                data = data.reverse();
                let messages = $('.user-messages');
                let scroll=messages.scrollTop();
                data.forEach(message => {
                    let elem=$("<div>",{
                        class: 'message',
                    });
                    elem.append($("<div>", {
                        class: 'message-content',
                        text: message['content']
                    }));
                    elem.append($("<div>", {
                        class: 'user',
                        text: message['fromLogin'] == g_user ? message['fromLogin'] : 'you'
                    }));
                    if(message['fromLogin']!=g_user)
                        elem.css('margin-left', 'auto');
                    messages.append(elem);
                });
                messages.scrollTop(scroll);
            }
        });
    }
}

var viewContacts = function(data){
    $('#contacts').empty();
    data.forEach(element => {
        let elem=$("<div>", {
            class: 'contact',
            text: element
        });
        elem.css('padding', 5);
        elem.click(function(handler){
            $('.contact').each(function(){
                $(this).css('background-color', '');
            });
            elem.css('background-color', 'grey');
            postMessages(elem.text());
        })
        $('#contacts').append(elem);
        g_contacts.push(element);
    });
}



var viewMessages = function(data, user, addOlder){
    let messages = $('.user-messages');
    if(!addOlder)
        messages.children().remove();
    data=JSON.parse(data);
    if(data.length===0)
        return;
    messages.unbind('scroll');
    var lastDate=data[data.length-1]['date'];
    if(!addOlder)
        g_lastDate=data[0]['date'];
    let height = 0;
    data.forEach(message => {
        let elem=$("<div>",{
            class: 'message',
        });
        elem.append($("<div>", {
            class: 'message-content',
            text: message['content']
        }));
        elem.append($("<div>", {
            class: 'user',
            text: message['fromLogin'] == user ? message['fromLogin'] : 'you'
        }));
        if(message['fromLogin']!=user)
            elem.css('margin-left', 'auto');
        messages.prepend(elem);
        height+=elem.outerHeight();
    });

    if(addOlder)
        messages.scrollTop(height);
    else
        messages.scrollTop(messages.prop('scrollHeight'));
    if(messages.prop('scrollHeight')>messages.outerHeight()){
        messages.scroll(function(){
            if(messages.scrollTop()==0){
                viewOlderMessages(user, lastDate);
                messages.unbind('scroll');
            }
        })
    }
    $('#send').prop('user', user);
}

// var addMessage = function(user, message){
//     $.post(document.location, {'addMessage': true, 'userLogin': user, 'message': message}, function(data){
//             let messages = $('.user-messages');
//             let elem=$("<div>",{
//                 class: 'message',
//             });
//             elem.append($("<div>", {
//                 class: 'message-content',
//                 text: message
//             }));
//             elem.append($("<div>", {
//                 class: 'user',
//                 text: 'you'
//             }));
//             elem.css('margin-left', 'auto');
//             messages.append(elem);
//             messages.scrollTop(messages.prop('scrollHeight'));
//             g_lastDate=data;
//     });
// }

var addMessage = function(user, message){
    $.post(document.location, {'type': 'addMessage', 'userLogin': user, 'message': message}, function(data){
            let messages = $('.user-messages');
            let elem=$("<div>",{
                class: 'message',
            });
            elem.append($("<div>", {
                class: 'message-content',
                text: message
            }));
            elem.append($("<div>", {
                class: 'user',
                text: 'you'
            }));
            elem.css('margin-left', 'auto');
            messages.append(elem);
            messages.scrollTop(messages.prop('scrollHeight'));
            g_lastDate=data;
    });
}

// var postMessages = function(user){
//     $.post(document.location, {'getMessages20': true, 'userLogin': user, 'limit': 20}, function(data){
//         g_user=user;
//         viewMessages(data, user, false);
//     });
// }

var postMessages = function(user){
    $.post(document.location, {'type': 'getMessages20', 'userLogin': user, 'limit': 20}, function(data){
        g_user=user;
        viewMessages(data, user, false);
    });
}

// var viewOlderMessages = function(user, lastDate){
//     if(lastDate)
//         $.post(document.location, {'getMessagesOlder': true, 'userLogin': user, 'date': lastDate, 'limit': 20}, function(data){
//             viewMessages(data, user, true);
//         });
// }

var viewOlderMessages = function(user, lastDate){
    if(lastDate)
        $.post(document.location, {'type': 'getMessagesOlder', 'userLogin': user, 'date': lastDate, 'limit': 20}, function(data){
            viewMessages(data, user, true);
        });
}

var searchIn = function(search){
    let results = $('#search-results');
    if(!$('#search-results').length){
        results = $('<div>', {
            id: 'search-results'
        });
        results.css('height', '92%');
        results.css('overflow-y', 'auto');
        $('#left-side').append(results);
    }
    else
        results.prop('hidden', false);
    $('#contacts').prop('hidden', true);
}

var searchOut = function(search){
    if($('#search').val()===''){
        $('#search-results').prop('hidden', true);
        $('#contacts').prop('hidden', false);
        $('#search-results').empty();
    }
}

// var searchSend = function(line){
//     $.post(document.location, {'searchUser': true, 'userLogin': line}, function(data){
//         data=JSON.parse(data);
//         let search = $('#search-results');
//         data.forEach(element => {
//             let elem = $('<div>', {
//                 class: 'contact',
//                 text: element['login']
//             });
//             elem.click(function(handler){
//                 if(g_contacts.indexOf(element['login'])===-1){
//                     $.post(document.location, {'addUser': true, 'userLogin': element['login']}, function(data){
//                         if(data==='success'){
//                             getContacts();
//                         }
//                     });
//                 }
//                 $('#search').val('')
//                             .focusout();
//             });
//             search.append(elem);
//         });
//     });
// }

var searchSend = function(line){
    $.post(document.location, {'type': 'searchUser', 'userLogin': line}, function(data){
        data=JSON.parse(data);
        let search = $('#search-results');
        data.forEach(element => {
            let elem = $('<div>', {
                class: 'contact',
                text: element['login']
            });
            elem.click(function(handler){
                if(g_contacts.indexOf(element['login'])===-1){
                    $.post(document.location, {'type': 'addUser', 'userLogin': element['login']}, function(data){
                        if(data==='success'){
                            getContacts();
                        }
                    });
                }
                $('#search').val('')
                            .focusout();
            });
            search.append(elem);
        });
    });
}