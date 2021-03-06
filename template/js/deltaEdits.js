"use strict";



$(window).on('load', function () {
    window.addEventListener('hashchange', hashchange);
    hashchange();

    function hashchange() {
        var hash = location.hash;
        var ctrl = $(".tabsBlock .tabs .tab[data-hash=" + hash.split('#')[1] + "]");
        if (ctrl.length) {
            ctrl.click();
        }
    }
});









$(document).ready(function () {

    Sortable.create(document.getElementById("dloadImageList"),{
        animation: 300,
        store: {
            get: function (sortable) {
              return  [];
            },
            set: function (sortable) {
              remodePositions($('.imgprogress'));
            }
        }
    });



    function remodePositions (ctrl) {
        let i = 1;

        ctrl.each(function(key , val){
            if ($(this).hasClass('deleted')){
                $(this).appendTo($('#dloadImageList'));
            }
        });

        ctrl.find('img').each(function(key , val){
            $(val).data('position' , i).attr('data-position' , i);
            $(this).parent().find('.lnk').prop('name' , 'photo_'+i);
            $(this).parent().find('.del').prop('name' , 'photo_del_'+i);
            $(this).parent().find('.alt').prop('name' , 'photo_alt_'+i);
            $(this).parent().find('.tit').prop('name' , 'photo_tit_'+i);
            $(this).parent().find('.pos').prop('name' , 'photo_pos_'+i).val(i++);
        });
    }





    $(document).on("click", ".deltaEPCont", function (evt) {
        evt.stopPropagation();
        if ($('.deltaEditProduct').hasClass('active')) {
        	$(this).addClass('active');
        	$('.deltaEditProduct').removeClass('active');
        }else {
        	$(this).removeClass('active');
        	$('.deltaEditProduct').addClass('active');
        }
    });





    $(document).on("click", ".tab", function (evt) {
        evt.stopPropagation();
        $('.cont').removeClass('active');
        $('.tab ').removeClass('active');
        $(this).addClass('active');
        $('.cont[data-tabid=' + $(this).data("tabid") + ']').addClass('active');
        location.hash = $(this).data("hash");
    });





    $(document).on("keyup , change", "input:not(#uploaded_file)", function (evt) {
        $(this).attr("value" , $(this).val());
    });



    $(document).on("click", ".deleteThis", function (evt) {
        $(this).parent().addClass("deleted");
        $(this).parent().find('.del').val('true');
        $(this).parent().appendTo($('#dloadImageList'));
        remodePositions($('.imgprogress'));
    });



    

    $(document).on("keyup", "#imageAlt", function (evt) {
        $(".imgprogress.editing img").prop("alt" , $(this).val());
        $(".imgprogress.editing").find('.alt').val($(this).val());
    });


    $(document).on("keyup", "#imageTitle", function (evt) {
        $(".imgprogress.editing img").prop("title", $(this).val())
        $(".imgprogress.editing").find('.tit').val($(this).val());
    });









    $(document).on("click", ".imgprogress", function (evt) {
        $('.imgprogress').removeClass("editing");
        $(this).addClass("editing");
        $('#imageAlt').val($(this).find('img').prop('alt'));
        $('#imageTitle').val($(this).find('img').prop('title'));
        $('#imageTitle , #imageAlt').data('link' , $(this).find('img').prop('src')  ).attr("data-link" , $(this).find('img').prop('src') );  
        $('.tabContent input:not(#uploaded_file)').change();
    });







    $(document).on("click", ".PropsGroups .accept" , function (evt) {
        var form = new FormData();
     
        form.append("event" , "addPropsGroup");
        form.append("nameGroup" , $("#PGroupName").val());

        let fetchParams = {
            method : "POST",
            body : form,
            headers : {
                "X-Requested-With"  :"XMLHttpRequest",
                "xDltFetching"      : true
            }
        }


        let promise = fetch('ajax/adm/' , fetchParams)
            .then(response => {
                if (response.status != 200) throw new Error("o_O");
                return response.json();
            })
            .then(data => {
                if (data.state) {
                    if (data.mode == 'create'){
                        $(".PropsGroups").append('<input type="text" class="propsGroupList" name="propsGroup_'+data.id+'" disabled="disabled" value="'+data.name+'">');
                    }
                    console.log('yep');
                }else {
                    console.log('nope');
                }
            })
            .catch(message=>{
                console.log(message);
            });
    });




    


    $(document).on("change", "#uploaded_file", function (evt) {
        var files = $(this).prop('files');
        var data = new FormData();
        var imageList = [];
        console.log(files);
        for (var i = 0, f; f = files[i]; i++) {
            if (!f.type.match('image.*')) {
                continue;
            }
            imageList.push(f);
            var reader = new FileReader();
            reader.onload = (function(theFile) {
                return function(e) {
                    var arrnames = theFile.name.split('.'); 
                    var ext = arrnames.pop();
                    var filename = arrnames.join('.');
                    var filenameNotDot = arrnames.join('');
                    var span =  $('<span>', { 
                      class:  'imgprogress',                    
                    });
                    span.append('<div class="progress-bar-mini orange shine"></div>');
                    span.append( ['<img class="thumb" src="', e.target.result,
                                    '" title="', filename, '"/>'].join(''));
                    span.appendTo('.imagelist');  
                    data.append( i , theFile );   
                    remodePositions($('.imgprogress'));   
                };
            })(f);
            reader.readAsDataURL(f);
        }
        setTimeout(uploadImage, 100 , imageList , 0);
    });










function uploadImage(data  , cnt) {
    var formData = new FormData();
    formData.append( 0 , data[cnt] );
    var current = data[cnt];
    var arrnames = current.name.split('.');  
    var ext = arrnames.pop();
    var filename = arrnames.join('.'); 
    var filenameNotDot = arrnames.join(''); 
    var progress = $('.imgprogress img[title="'+filename+'"]').parent().find('.progress-bar-mini');
 
    let imageListState = [];

    if (imageListState[cnt] == 'loaded') {

        if (cnt+1 < data.length) {
            uploadImage(data  , cnt+1);
        }
    } else {
        $.ajax({
            url: 'ajax/adm/?event=uploadimages',
            type: 'POST',
            data: formData,
            cache: false,
            dataType: 'json',
            processData: false,
            contentType: false,
            beforeSend: function(request) {
                request.setRequestHeader("xDltFetching", true);
            },
            xhr: function(){
            var xhr = $.ajaxSettings.xhr();
                xhr.upload.addEventListener('progress', function(evt){
                    if(evt.lengthComputable) {
                         var percentComplete = Math.ceil(evt.loaded / evt.total * 100);
                        progress.css({width: percentComplete + '%'});
                    } 
                }, true);
                return xhr;
            },
            success: function( respond ){
                if (respond.result){
                    imageListState[cnt-1] = 'loaded';
                    var percentFullComplete = Math.ceil(cnt / data.length * 100);
                    progress.remove();
                   // $(".cont[data-tabid=2]").append('<input type="hidden" name="photo_'+cnt+'" value="'+respond.path+'">')
                    let maxpos =  $('.imgprogress').length;
                    $('.imgprogress img[title="'+filename+'"]').parent().prepend('<span class="deleteThis">&times;</span>');
                    $('.imgprogress img[title="'+filename+'"]').parent().append('<input type="hidden" class="lnk" name="photo_'+maxpos+'" value="'+respond.path+'">');
                    $('.imgprogress img[title="'+filename+'"]').parent().append('<input type="hidden" class="pos" name="photo_pos_'+maxpos+'" value="'+maxpos+'">');
                    $('.imgprogress img[title="'+filename+'"]').parent().append('<input type="hidden" class="pos" name="photo_alt_'+maxpos+'" value="">');
                    $('.imgprogress img[title="'+filename+'"]').parent().append('<input type="hidden" class="pos" name="photo_tit_'+maxpos+'" value="">');
                    $('.imgprogress img[title="'+filename+'"]').parent().append('<input type="hidden" class="del" name="photo_del_'+maxpos+'" value="false">');
                    $("#progressFillImg").css({width: percentFullComplete + '%'});
                  
                    if (percentFullComplete >= 100) {
                        $("#progressFillImg").css({width: '0%'});
                 
                        
                    }

                    if (cnt < data.length) uploadImage(data  , cnt);
                }else {
                    if (cnt < data.length -1) uploadImage(data  , ++cnt);
                }
                remodePositions($('.imgprogress'));

            },
            error: function(){
                if (cnt < data.length -1 ) uploadImage(data  , ++cnt);
            }
        });  
    }   
  cnt++;  
}





    $(document).on("click", ".dControl.save", function (evt) {
        var form = new FormData();
        var vals = $(".deltaEditProduct input:not([type=file]):not(.notSend) , .deltaEditProduct textarea");

        for (let i = 0; i < vals.length ; i++) {
        	form.append($(vals[i]).attr('name'), $(vals[i]).val());
        }

        form.append("id_product" , $(".deltaEditProduct").data("productid"));
        form.append("event" , "addOrUpdate");
        form.append("description" , tinyMCE.activeEditor.getContent());


        let fetchParams = {
        	method : "POST",
        	body : form,
        	headers : {
                //"Accept"            :"application/json, text/javascript, */*; q=0.01",
                //"Content-Type"      :"application/x-www-form-urlencoded; charset=UTF-8",
                "X-Requested-With"  :"XMLHttpRequest",
        		"xDltFetching"      : true
        	}
        }


        let promise = fetch('ajax/adm/' , fetchParams)
        	.then(response => {
        		if (response.status != 200) throw new Error("o_O");
        		return response.json();
        	})
        	.then(data => {
                if (data.state) {
                    console.log('yep');
                }else {
                    console.log('nope');
                }
        	})
        	.catch(message=>{
        		console.log(message);
            });






    });











});



