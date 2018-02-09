<?php

if (!is_numeric($root)){
	$root= $modx->documentIdentifier;
}



//$catalog = new catalog_c($modx);

//echo 'ww'.$modx->urlXParams['istCardPage']."ww";

if ($modx->urlXParams['istCardPage'] != true) {
	$modx->c->getCatFromID($root);
	$modx->c->getCatFromID($root)->getFields()->sortIt('cats', 'menuindex', 'DESC');
	$modx->c->renderAll($chunkCats , 'cats' , 'print');
}



if ($modx->urlXParams['istCardPage'] != true) {
	$modx->c->getGoodsFromCats ($root ,false, /*$modx->parseXparams()*/ false , true );
}
//$modx->c->getGoodsFromCats ($root ,false, /*$modx->parseXparams()*/ false , true );
$modx->c->getAllGoodFields();
$modx->c->renderAll($chunkGoods , 'goods' , 'print'); 




echo '==============<br>';
$idsF = $modx->c->getArrayData('goods');

echo $modx->pre($idsF);

//echo $modx->pre($modx->c->getArrayData('cats'));


/*
$catalog = $modx->getCatFromID($root);
$catalog->getFields()->sortIt('cats', 'menuindex', 'DESC')->sliceIt('cats' , 0, 2);
*/



//$catalog->getCatFromID($root)->getFields()->sortIt('cats', 'menuindex', 'DESC');

//$catalog->renderAll($chunkCats , 'cats' , 'print');





//$modx->getGoodsFromCats ($root ,false, /*$modx->parseXparams()*/ false , true );
//$modx->getAllGoodFields();
/*
$modx->renderAll($chunkGoods , 'goods' , 'print');

echo $modx->pre($modx->getArrayData('goods'));

/
	
	
	
/*
$idsF = $modx->getArrayData('cats');
echo $modx->pre($idsF);
*/
?>