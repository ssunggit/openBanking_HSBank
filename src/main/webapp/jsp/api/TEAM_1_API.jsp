<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>J_INVESTMENT_BANK API</title>
</head>
<body>
	<button id="ajaxButton">J_INVESTMENT_BANK API 검색</button>
	
	<div id="ajaxList"></div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).on('click','#ajaxButton',function(){
	$.ajax({
		type:'get'
		,url:'http://129.154.207.113:8080/openAPI/J_INVESTMENT_BANK'
		,data:{
		bankCode:"20"
		,phoneNumber:"01041215153"
		,tokenId:"z3i8i4v4j4a1"
		},datetype:'jsonp'
		,success:callback
		,error:function(){
			alert('실패');
		}
	})
})

function callback(result){
	console.log(result);
	
	$('#ajaxList').empty();
	
	for(let i=0; i < result.length; i++){
		let ajaxData = result[i];
		let ajaxAccountNumber = ajaxData.accountNumber;
		let ajaxAccountPassword = ajaxData.accountPassword;
		let ajaxBalance = ajaxData.balance;
		let ajaxBankAlias= ajaxData.bankAlias;
		let ajaxBankCode = ajaxData.bankCode;
		let ajaxBankName = ajaxData.bankName;
		let ajaxBankRegDate = ajaxData.bankRegDate;
		let ajaxPhoneNumber = ajaxData.phoneNumber;
		let ajaxTransferLimit = ajaxData.transferLimit;
	
		$('#ajaxList').append('<br>');
		$('#ajaxList').append('<div> [계좌 번호] '+ajaxAccountNumber+'</div>');
		$('#ajaxList').append('<div> [계좌 비밀번호] '+ajaxAccountPassword+'</div>');
		$('#ajaxList').append('<div> [계좌 잔액] '+ajaxBalance+'</div>');
		$('#ajaxList').append('<div> [계좌 별칭] '+ajaxBankAlias+'</div>');
		$('#ajaxList').append('<div> [은행 코드] '+ajaxBankCode+'</div>');
		$('#ajaxList').append('<div> [은행 이름] '+ajaxBankName+'</div>');
		$('#ajaxList').append('<div> [계좌 개설일] '+ajaxBankRegDate+'</div>');
		$('#ajaxList').append('<div> [휴대폰 번호] '+ajaxPhoneNumber+'</div>');
		$('#ajaxList').append('<div> [계좌 이체 한도] '+ajaxTransferLimit+'</div>');
		$('#ajaxList').append('------------------------------------------------');
		
		}
}
</script>
</html>
