<?php
/**
 *
 *
 *
 *
 *
 */



class RQ
{


    private $settings = array();
    private static $_instance = null;
    private static $P = array();
    private static $G = array();

    private function __construct()
    {

        
        if (count($_GET)) {
            foreach ($_GET as $key => $value) {
                self::$G[addslashes(strip_tags($key))] = addcslashes(strip_tags($value));
    
            }
        }


        if (count($_POST)) {
            foreach ($_POST as $key => $value) {
                self::$P[addslashes(strip_tags($key))] = addcslashes(strip_tags($value));
            }
        }

       
    }


    protected function __clone()
    {

    }


    protected function __wakeup()
    {

    }


    static public function getInstance()
    {
        if (is_null(self::$_instance)) {
            self::$_instance = new self();
        }
        return self::$_instance;
    }


    public static function P($feild = false)
    {
        if (array_key_exists($feild, self::$P)) {
            return self::$P[$feild];
        }
        return (self::$P);
    }


    public static function G($feild = false)
    {
        if (array_key_exists($feild, self::$G)) {
            return self::$G[$feild];
        }
        return (self::$G);
    }


}
