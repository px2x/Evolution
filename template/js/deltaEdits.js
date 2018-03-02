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





    $(document).on("click", ".dControl.save", function (evt) {
        var form = new FormData();
        var vals = $(".deltaEditProduct input , .deltaEditProduct textarea");

        for (let i = 0; i < vals.length ; i++) {
        	form.append($(vals[i]).attr('name'), $(vals[i]).val());
        }
        form.append("id_product" , $(".deltaEditProduct").data("productid"));
        form.append("event" , "addOrUpdate");



        let fetchParams = {
        	method : "POST",
        	body : form,
        	headers : {
        		xDltFetching : true
        	}
        }



        let promise = fetch('ajax/adm/' , fetchParams)
        	.then(response => {
        		if (response.status != 200) throw new Error("o_O");
        		return response.json();
        	})
        	.then(data => {
        		console.log(data);
        	})
        	.catch(message=>{
        		console.log(message);
        	});





    });











});



