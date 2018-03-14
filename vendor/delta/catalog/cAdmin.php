<?php
/**
 * Каталог
 * 
 * 
 * @author delta <info@delta-ltd.ru>, <aleksandr.it@delta-ltd.ru>
 * @version 1.0
 */


/**
 * 
 * 
 * 
 * 
 */
trait catalog_cAdmin {



	public function checkExists($id){
		$result = $this->modx->db->select("id_product", self::$_TABLE_P,  "id_product=" . $id ); 
		if( $this->modx->db->getRecordCount( $result ) >= 1 ) {
			return true;
		}
		return false;
	}



	public function updateGoods($id){
		if (!is_numeric($id))  return false;

		$sql = "UPDATE ".self::$_TABLE_DESCR."  SET 
			name = '".RQ::P('name')."', 
			intro = '".RQ::P('intro')."', 
			description = '".RQ::P('description')."'
		WHERE id_product = ".$id." AND id_language = ".DocumentParser::$_LANGUAGE_ID." LIMIT 1 ";

		if ($result = $this->modx->db->query($sql)) {
			$this->modx->clearCache();
			return true;
		}
	}








	public function uploadimages() {
   
	    if ($_FILES[0]) {
	        $extArr =  explode('.', $_FILES[0]['name'] );
	        $ext = end($extArr);     
	        array_pop($extArr);
	        $nameWithOutExt = $extArr;
	        $nameWithOutExt = implode('.',$nameWithOutExt);
	            
	          
	        if (!file_exists($_SERVER['DOCUMENT_ROOT'].'/assets/images/catDLT/upload/')) {
	           	if (!mkdir($_SERVER['DOCUMENT_ROOT'].'/assets/images/catDLT/upload/' , 0777 , true)) {
	           	}
	        }  
	          
	        if (($ext != 'png' || $ext != 'jpg' || $ext != 'jpeg' || $ext != 'gif') && $_FILES[0]['size'] > 0 && $_FILES[0]['error'] == 0)   {
	           $newfileName = time().'_'.md5($_FILES[0]['name']).'.'.$ext;
	           if (move_uploaded_file($_FILES[0]['tmp_name'], $_SERVER['DOCUMENT_ROOT'].'/assets/images/catDLT/upload/'.$newfileName)) {
	                return  array(
	                	'result' => true, 
	                	'path' => 'assets/images/catDLT/upload/'.$newfileName,
	                	'realname' => $nameWithOutExt,
	                );
	           }else {
	                return  array(
	                	'result' => false, 
	                	'tx' => 'Неверно определен путь к файлу'

	                );
	           }
	        }
	        return false;
	     }
	}






}