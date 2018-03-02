<?php
/**
 * Каталог
 * 
 * парсинг чанков , вывод
 * @author delta <info@delta-ltd.ru>, <aleksandr.it@delta-ltd.ru>
 * @version 1.0
 */



/**
 * 
 * 
 * 
 * 
 */
trait catalog_cRender {

	protected  $bufer = '';


	/**
	 * Верстка. Блоки категорий
	 * 
	 * @param string $chunkName - чанк категории
	 * @param mixed $mode - false - вернуть верстку, 'print' - напечатать
	 * @return string
	 */
	public function renderAll ($chunkName , $what , $mode = false){
		$this->bufer = '';
		if (($ids = $this->selectTarget($what , $typeField)) === false) return $this;
		//$this->toPlaceholder('islogged', '0' , 'px.');
		$list = new ArrayObject( $ids );
		$iterator = $list->getIterator();
		$bodyChunk = $this->modx->getChunk($chunkName) ;
		while($iterator->valid()){
			$tmp = $this->modx->parseText($bodyChunk , $iterator->current()['fields'] , '[+px.');
			if (array_key_exists('tv' , $iterator->current()))
				$tmp = $this->modx->parseText($tmp , $iterator->current()['tv'] , '[+px.');
			$this->bufer .= $tmp;
			$iterator->next();
		}
		//$this->bufer = $this->rewriteUrls($bufer);		
		if ($mode == 'print') {
			echo $this->bufer;
			$this->bufer = '';
		}
		return $this->bufer;
	}






	/**
	 * Верстка. Карточка товара
	 * 
	 * @param string $chunkName - чанк категории
	 * @param mixed $mode - false - вернуть верстку, 'print' - напечатать
	 * @return string
	 */
	public function render ($chunkName , $data, $mode = false){
		$this->bufer = '';
		$bodyChunk = $this->modx->getChunk($chunkName); 
		$this->bufer = $this->modx->parseText($bodyChunk , $data['fields'] , '[+px.');
		if ($mode == 'print') {
			echo $this->bufer;
			$this->bufer = '';
		}
		return $this->bufer;
	}
	






}