<?php

require_once 'render_pages.php';
require_once 'yandex_parse.php';
require_once 'simple_html_dom.php';

$pdo = new PDO('mysql:dbname=newschema;host=localhost;encoding=ut8mb4', 'root', '',  [
	PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
	PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

session_start();
$cookie = $_COOKIE['PHPSESSID'];

if($_POST['type'])
    $page=$_POST['type'];
else if ($_POST['login'])
    $page='login';

try{
    switch($page){
        case 'register':
            $pdo->prepare("insert into accounts (login, password) values('".$_POST['login']."', '".md5($_POST['password'])."')")->execute();
            echo 'success';
        break;

        case 'yandexSearch':
            $html = file_get_html('https://yandex.ru/search/?text='.preg_replace('/ /', '+', $_POST['value']));
            $res='';
            $number=1;
            foreach($html->find('li.serp-item') as $element){
                $a = $element->find('h2', 0)->find('a', 0);
                $text = $element->find('.extended-text__full', 0)->plaintext;
                if(!$text)
                    $text = $element->find('.text-container.typo.typo_text_m.typo_line_m', 0)->plaintext;
                $str = '<h2>'.$number.')<a href='.$a->href.'>'.$a->plaintext.'</a></h2>'.$text;
                $str = preg_replace('/( ?Скрыть ?$| ?Читать полностью$)/U', '', $str);
                $number+=1;
                $res.=$str;
            }
            echo $res;
        break;

        case 'searchUser':
            if($_SESSION['userId']){
                $data = $pdo->query("call getUsers('".$_POST['userLogin']."')")->fetchAll();
                if($data)
                    echo json_encode($data);
                else
                    echo 'no users';
            }
            else
                echo 'not logged';
        break;

        case 'checkNewMessages':
            if($_SESSION['userId']){
                $data = $pdo->query("call getMessagesNewer('".$_SESSION['login']."', '".$_POST['userLogin']."', '".$_POST['date']."', ".$_POST['limit'].")")->fetchAll();
                if($data)
                    echo json_encode($data);
                else
                    echo 'no updates';
            }
            else
                echo 'not logged';
        break;

        case 'addMessage':
            if($_SESSION['userId']){
                $date = $pdo->query("call addMessage('".$_POST['message']."', '".$_SESSION['login']."', '".$_POST['userLogin']."')")->fetch();
                echo $date['date'];
            }
            else
                echo 'not logged';
        break;

        case 'getContacts':
            if($_SESSION['userId']){
                echo $pdo->query("select contacts from accounts where(userId=".$_SESSION['userId'].")")->fetch()['contacts'];
            }
            else
                echo 'not logged';
        break;

        case 'addUser':
            if($_SESSION['userId']){
                $contacts=json_decode($pdo->query("select contacts from accounts where(userId=".$_SESSION['userId'].")")->fetch()['contacts']);
                if(!in_array($_POST['userLogin'], $contacts)){
                    $contacts[]=$_POST['userLogin'];
                    $pdo->prepare("update accounts set contacts='".json_encode($contacts)."' where (login='".$_SESSION['login']."')")->execute();
                    echo 'success';
                }
                else
                    echo 'fail';
            }
            else
                echo 'not logged';
        break;

        case 'getMessagesOlder':
            if($_SESSION['userId']){
                $contacts = json_decode($pdo->query("select contacts from accounts where(userId=".$_SESSION['userId'].")")->fetch()['contacts']);
                if (in_array($_POST['userLogin'], $contacts))
                    echo json_encode($pdo->query("call getMessagesOlder('".$_SESSION['login']."', '".$_POST['userLogin']."', '".$_POST['date']."', ".$_POST['limit'].")")->fetchAll());
            }
            else
                echo 'not logged';
        break;

        case 'getMessages20':
            if($_SESSION['userId']){
                $contacts = json_decode($pdo->query("select contacts from accounts where(userId=".$_SESSION['userId'].")")->fetch()['contacts']);
                if (in_array($_POST['userLogin'], $contacts))
                    echo json_encode($pdo->query("call getMessagesLogin('".$_SESSION['login']."', '".$_POST['userLogin']."', ".$_POST['limit'].")")->fetchAll());
            }
            else
                echo 'not logged';
        break;

        case 'logged':
            if($_SESSION['userId'])
                echo 'logged successfully';
            else
                echo 'not logged';
        break;

        case 'login':
            $page = $pdo->query("select userId from accounts where(login='".$_POST['login']."' and password='".md5($_POST['password'])."')")->fetch();
            if ($page['userId']){
                $pdo->query("update accounts set lastSessionId='".$cookie."' where(userId=".$page['userId'].")")->execute();
                echo 'succes';
            }
            else
                echo 'failed to login';
        break;

        default:
            if ($cookie){
                $page = $pdo->query("select userId, login from accounts where(lastSessionId='".$cookie."')")->fetch();
                if ($page['userId']){
                    $_SESSION['userId']=$page['userId'];
                    $_SESSION['login']=$page['login'];
                    renderMainPage($page['userId']);
                    break;
                }
            }
            renderAuthPage();
        break;
    }
}
catch (Exception $ex) {
    echo "Ошибка на сайте: " . $ex->getMessage();
}
