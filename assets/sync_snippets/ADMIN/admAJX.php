<?php

$headers = getallheaders();

if ($headers['xDltFetching'] == 'true'){

	
	if (RQ::P('event') == 'addOrUpdate') {
		if ($response['che'] = $modx->c->checkExists(RQ::P('id_product'))){
			$response['evt'] =  'update';
			$response['state'] =  $modx->c->updateGoods(RQ::P('id_product'));
		}else {
			$response['evt'] = 'create';
		}
	}









	if (RQ::G('event') == 'uploadimages') {
		$response = $modx->c->uploadimages(); 
	}
	
	
}
	
return json_encode($response);

?>