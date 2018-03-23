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

	
	if (RQ::P('event') == 'addPropsGroup') {
		$response = $modx->p->addPropsGroup(RQ::P('nameGroup'));
	}


	if (RQ::G('event') == 'uploadimages') {
		$response = $modx->c->uploadImages();
	}
}
	
return json_encode($response);
?>