<?php

function parseH2($content){
    preg_match_all('@(<h2 class="organic.*</h2>|>[ А-Яа-яa-z,\\.-—"]+<)@Ui', $content, $result1, PREG_SET_ORDER);
    //preg_match_all('|>[ \w\d"]+<|Ui', $content, $result2, PREG_SET_ORDER);
    return $result1;
}
