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
class catalog_c {

	use catalog_cRender;
	use catalog_cAdmin;



	protected $rootCatalog = 3;
	protected static $_VIEW_P_DIR_OPT;
	protected static $_VIEW_P_ALL_FIELD;
	protected static $_TABLE_P_IMAGES;
	protected static $_TABLE_P;
	protected static $_TABLE_DESCR;
	protected  $catsIDS = array();
	public  $goodsIDS = array();
	protected $modx;





	public function __construct($modx) {
		$this->modx = $modx;

		self::$_VIEW_P_DIR_OPT = 'v_product_dir_and_option' ;
		self::$_VIEW_P_ALL_FIELD = 'v_product_all_field' ;
		self::$_TABLE_P_IMAGES =  $this->modx->getFullTableName( '_product_images' );
		self::$_TABLE_P =  $this->modx->getFullTableName( '_product' );
		self::$_TABLE_DESCR =  $this->modx->getFullTableName( '_product_description' );
	}






	/**
	 * 
	 * 
	 * 
	 */ 
	public function set ($data = false , $type = 'goodsIDS'){
		if (! $data) return false;
		if (! property_exists(__CLASS__ , $type)) return false;
		$this->{$type} = array();
		if (is_array($data)) {
			foreach ($data as $key => $value) {
				$this->push($value , $type);
			}
		}else {
			$this->push($data , $type);
	
		}
		
	}




	/**
	 * 
	 * 
	 * 
	 */
	protected function push ($data = false, $type = 'goodsIDS'){
		if (! is_numeric ($data) ) return false;
		if (!in_array($data , $this->{$type})){
			$this->{$type}[] = $data;
		}
	}







	/**
	 * Возвращает список ид категорий
	 * 
	 * 
	 * @param integer $id родитель
	 * @param integer $limiter количество возвращаемых элементов, если не указано - будут возвращены все
	 * @return mixed
	 */
	public function getCatFromID ($id, $limiter = false, $push = false){
		$this->catsIDS = array();
		if (is_numeric($limiter)) $limiter = ' LIMIT '.$limiter ;
		$tableSC = $this->modx->getFullTableName('site_content');
		$result = $this->modx->db->select("id", $tableSC,  "parent=" . $id ." AND published = '1' AND deleted = '0' AND isfolder = '1' ".$limiter); 
		if( $this->modx->db->getRecordCount( $result ) >= 1 ) {
			while( $row = $this->modx->db->getRow( $result ) ){  
				$this->catsIDS[] = $row['id'] ; 
			}
		}
		if ($push) return $this->catsIDS;
		else return $this;
		
	}






	/**
	 * Возвращает список ид всех вложенных категорий
	 * 
	 * @param integer $id родитель
	 * @param boolean $addParent включать или нет в цепочку родителя
	 * @return array
	 */
	function getTreeCat($id = false , $addParent = true, $recursive = false){
		$idsCats = array();
		$tmp = array();
		if (!is_numeric($id)) {
			$id=$this->documentIdentifier;
		}
		if ($addParent) {
			if (!in_array($id , $idsCats))  {
				array_push($idsCats , $id);
			}
		}

		if (count($ids = $this->getCatFromID ($id , false , true)) > 0 && is_array($ids)) {
			foreach ($ids as $key => $value) {
				if (!in_array($value , $idsCats))  {
					array_push($idsCats , $value);
					$tmp = $this->getTreeCat($value, false , true); 
					foreach ($tmp as $key2 => $value2) {
						if (!in_array($value2 , $idsCats))  {
							array_push($idsCats , $value2);
						}
					}
				}
			}
		}

		if ($recursive) return $idsCats;
		else {
			$this->catsIDS = $idsCats;
			return $this;
		}	
	}




	/**
	 * Возвращает массив доп. поля и TV для массива c id категорий
	 * 
	 * @return mxied
	 */
	function getCatFields(){
		if (!is_array($this->catsIDS)) return false;
		$ids=false;
		foreach ($this->catsIDS as $key => $value) { 
			$result = $this->modx->db->query("SELECT pagetitle, parent, alias, id, isfolder, content, menuindex  
				FROM  ".DocumentParser::$_TABLE_SC." WHERE id =  ".$value.$limiter); 

			if( $this->modx->db->getRecordCount( $result ) >= 1 ) {
				while( $row = $this->modx->db->getRow( $result ) ) { 
					$ids[$value]['fields'] = $row;  
				}
			}

			$result = $this->modx->db->query("SELECT v.value, n.name FROM  ".DocumentParser::$_TABLE_TV." AS v 
										INNER JOIN ".DocumentParser::$_TABLE_TVNAMES." AS n ON n.id = v.tmplvarid
										WHERE v.contentid =  ".$value); 
			if( $this->modx->db->getRecordCount( $result ) >= 1 ) {
				while( $row = $this->modx->db->getRow( $result ) ) {  
					$ids[$value]['tv'][$row['name']] = $row['value'];  
				}
			}
		}
		$this->catsIDS = $ids;
		return $this;
	}




	/**
	 * Сортирует массив ids
	 * 
	 * @param array $ids массив (с полями) для сортировки
	 * @param string $field поле по которому сортировать
	 * @param string $order направление соритровки
	 * @param string $type если хоть что то сюда передать - сортироваться будет по ТВ параметрам (необходимо указать в {@$field})
	 * @return mxied
	 */
	function sortIt ($what , $field, $order = 'ASC', $type = 'fields'){
		if (($ids = $this->selectTarget($what , $typeField)) === false) return $this;
		uasort($ids, function($a, $b) use ($field, $order, $type){
			if ($order== 'DESC') {
				$fn_compaire_a = 1;
				$fn_compaire_b = -1;
			}else {
				$fn_compaire_a = -1;
				$fn_compaire_b = 1;
			}
			if ($type != 'fields') $type = 'tv';

			if ($a[$type][$field] == $b[$type][$field]) {
				return 0;
			}
			return (strnatcmp( $a[$type][$field] , $b[$type][$field])) < 0 ? $fn_compaire_a : $fn_compaire_b;
		});

		$this->{$typeField} = $ids;
		return $this;
	}



	/**
	 * Срез массива ids
	 * 
	 * Для пагинации
	 * @param array $ids массив (с полями)
	 * @param integer $from от (нумерация от нуля)
	 * @param integer $limiter количество
	 * @return mixed
	 */
	function sliceIt ($what, $from, $limiter){
		if (($ids = $this->selectTarget($what , $typeField)) === false) return $this;
		$ids = array_slice ($ids , $from, $limiter , true);
		$this->{$typeField} = $ids;
		return $this;
	}





	/**
	 * 
	 * 
	 * 
	 * 
	 */
	public function &selectTarget ($what , &$type = false){
		switch ($what) {
			case 'cats':
				$ids =  &$this->catsIDS;
				$type = 'catsIDS';
				break;

			case 'goods':
				$ids =  &$this->goodsIDS;
				$type = 'goodsIDS';
				break;
				
			default:
				return false;
		}
		return $ids;
	}






	/**
	 * 
	 * 
	 * 
	 * @return array
	 */
	public function getArrayData ($what){
		if (($ids = $this->selectTarget($what)) === false) return false;
		return $ids;
	}






	/**
	 * Выборка товаров из категории
	 * 
	 * Так же можно выбирать и из всех вложенных категорий
	 * @param array $id массив (с полями)
	 * @param integer $limiter от количество (ограничение кол-ва товаров)
	 * @param array $xParams массив применяемых фильтров
	 * @param boolean $showInnerCats true - выборка товаров и из вложенных категорий
	 * @return array
	 */
	function getGoodsFromCats ($id = false, $limiter = false , $xParams= false , $showInnerCats =false){
		$ids=false;
		if (!is_numeric($id)) {
			$id=$this->documentIdentifier;
		}
		if (is_numeric($limiter)) $limiter = ' LIMIT '.$limiter ;

		$dopSql = '';
		$dopSqlPrnt = ' 1 = 1 ';

		if ($id != $this->rootCatalog && $showInnerCats) {
			$this->getTreeCat($id);
			//$this->modx->pre($this->catsIDS);
			if (is_array($this->catsIDS)) {
				$dopSqlPrnt = ' pd.id_sc IN ('.implode(',' , $this->catsIDS).') ';
			}
		}else {
			$showInnerCats = false;
		}

 
		/**
		 * @todo выборка id товаров с учетом фильтров 
		 */
		//if (is_array($xParams)) { // не работает - пока не использовать - возможно переписать
		if (false) {


		}else {
			$sql = "SELECT * FROM ".self::$_VIEW_P_DIR_OPT." `pd`
				WHERE ".($showInnerCats ? $dopSqlPrnt :  " pd.id_sc=" . $id )." AND pd.visible > 0 GROUP BY pd.id_product ".$limiter; 
			$result = $this->modx->db->query($sql);
			if( $this->modx->db->getRecordCount( $result ) >= 1 ) {
				while( $row = $this->modx->db->getRow( $result ) ){  
					$ids[] = $row['id_product'];
				}
			}
			$this->goodsIDS = $ids;
			return $this;
		}
	}







	/**
	 * Выборка всех полей для массива ид товаров
	 * 
	 * 
	 * @return object
	 * @todo Сделать выборку картинок и свойств фильтров (параметров)
	 */
	function getAllGoodFields (){
		if (!is_array($this->goodsIDS)) return false;
		$ids=false;
		foreach ($this->goodsIDS as $key => $value) {
			$result = $this->modx->db->query("SELECT *
				FROM  ".self::$_VIEW_P_ALL_FIELD." WHERE id_product =  ".$value." 
				AND id_language = ".DocumentParser::$_LANGUAGE_ID); 
			if( $this->modx->db->getRecordCount( $result ) >= 1 ) {
				while( $row = $this->modx->db->getRow( $result ) ) { 
					$ids[$value]['fields'] = $row;  
					$ids[$value]['fields']['path'] = $this->modx->makeURL($row['parent']).$row['alias'].$this->modx->config['friendly_url_suffix']; 
				}
			}
		}
		$this->goodsIDS = $ids;
		return $this;
	}







	/**
	 * Возвращает все поля для указанного товара(ID)
	 * 
	 * 
	 * @return array
	 */
	function getFields ($id){
		if (!is_numeric($id)) return false;
		$ids=false;
		$result = $this->modx->db->query("SELECT *
			FROM  ".self::$_VIEW_P_ALL_FIELD." WHERE id_product =  ".$id." 
			AND id_language = ".DocumentParser::$_LANGUAGE_ID); 

		if( $this->modx->db->getRecordCount( $result ) > 0 ) {
			if( $row = $this->modx->db->getRow( $result ) ) { 
				$ids[$id]['fields'] = $row;   
				$this->toPlaceholderGood($row);
				$ids[$id]['fields']['path'] = $this->modx->makeURL ( $row['parent']).$row['alias'].$this->modx->config['friendly_url_suffix'];
	
			}

		}

		return $ids;
	}







	/**
	 * 
	 * 
	 * 
	 * 
	 */
	function toPlaceholderGood ($fields){
		if (is_array($fields) && count($fields)){
			foreach ($fields as $key => $value) {
				$this->modx->toPlaceholder($key, $value , 'px.');
			}
		}
	}







 

	/**
	 * Проверка существования алиаса в товарах
	 * 
	 * 
	 * @return mixed
	 */
	function checkAliasExist ($alias = false){

		if ($alias == false) return false;
			$result = $this->modx->db->query("SELECT *
				FROM  ".self::$_TABLE_P." WHERE alias =  '".$alias."' LIMIT 1"); 
			if( $this->modx->db->getRecordCount( $result ) == 1 ) {
				if( $row = $this->modx->db->getRow( $result ) ) { 
					return $row['id_product'];
				}
			}
		return false;
	}








}
