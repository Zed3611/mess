<?php

function renderAuthPage(){
    readfile('html\\auth.html');
}

function renderMainPage($user){
    readfile('html\\main.html');
}