<?php
$sql = array();

$sql[1] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'mgmsliderdest_configuracion` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `mgmd_image` VARCHAR(2000) NOT NULL,
    `mgmd_image_responsive` VARCHAR(2000) NOT NULL,
    `mgmd_url` VARCHAR(2000) NOT NULL,
    PRIMARY KEY  (`id`)
) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;';



foreach ($sql as $query) {
    if (Db::getInstance()->execute($query) == false) {
        return false;
    }
}
