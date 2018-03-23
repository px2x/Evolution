<?php
/**
 * Каталог
 * 
 * добавление, удаление, редактирование.
 * @author delta <info@delta-ltd.ru>, <aleksandr.it@delta-ltd.ru>
 * @version 1.1
 */



/**
 * 
 * 
 * 
 * 
 */
class props_p {

	protected static $_TABLE_PROPS_GRO_DESCR;
	protected static $_TABLE_PROPS_GRO;
	protected static $_TABLE_PROPS;
	protected static $_TABLE_PROPS_DESCR;
	protected $modx;




	public function __construct($modx) {
		$this->modx = $modx;
		self::$_TABLE_PROPS_GRO_DESCR = $this->modx->getFullTableName( '_props_group_descr' );
		self::$_TABLE_PROPS_GRO = $this->modx->getFullTableName( '_props_group' );
		self::$_TABLE_PROPS = $this->modx->getFullTableName( '_props' );
		self::$_TABLE_PROPS_DESCR = $this->modx->getFullTableName( '_props_descr' );
	}







	public function addPropsGroup($name = false){
		if ($name == false) return false;
		$responsep['id'] = $this->checkPropsGroupExist($name);

		if (!is_numeric($responsep['id'])) {
			$responsep['mode'] = 'create';
			$sql = "INSERT INTO ".self::$_TABLE_PROPS_GRO." (id_props_group) VALUES (NULL)";
			if ($result = $this->modx->db->query($sql)) {
				$responsep['id'] = $this->modx->db->getInsertId();
			}
		}else{
			$responsep['mode']  = 'update';
		}
		$sql = "INSERT INTO ".self::$_TABLE_PROPS_GRO_DESCR." (id_props_group , `name` , id_language) VALUES (
			".$responsep['id']." ,
			'".$name."' , 
			1 
		) ON DUPLICATE KEY UPDATE 
			`name` = '".$name."'";
		if ($result = $this->modx->db->query($sql)) {
			$responsep['state'] = true;
		}
		$responsep['name'] = $name;
		return $responsep;
	}








	/**
	 * Проверка существования
	 * 
	 * @return mixed
	 */
	function checkPropsGroupExist ($name = false){
		if ($name == false) return false;
		$result = $this->modx->db->query("SELECT id_props_group
			FROM  ".self::$_TABLE_PROPS_GRO_DESCR." WHERE `name` =  '".$name."' LIMIT 1"); 
		if( $this->modx->db->getRecordCount( $result ) == 1 ) {
			if( $row = $this->modx->db->getRow( $result ) ) {
				return $row['id_props_group'];
			}
		}
		return false;
	}









}
