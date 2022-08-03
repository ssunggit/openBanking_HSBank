<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>openAPI_최강 5조</title>
</head>
<body>
	<button id="search">최강 5조 bank 계좌 정보 조회</button>
	<div id="result">---------------------------------------------</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	
		 $('#search').click(function(){
		
			$.ajax({
				url:'http://34.64.80.215/OpenBanking/AccountList.json',
				data: {
					key:'P2Q8Z2M5O0', phoneNumber:'0100110222', bankCode:'003'},
				dataType:'json',
				success: callback,
				error: function(){
					alert('실패!!')
				}
			})
		}) 

	})
	
	function callback(result){
		console.log('계좌정보 : '+ result)
		for(i=0; i < result.length; i++){
			let list = result[i]
			$('#result').append('<br>')
			$('#result').append('[' + (i+1) + ']')
			$('#result').append('<br>')
			$('#result').append('[은행코드] ' + list.bankCode + '<br>')
			$('#result').append('[은행이름] ' + list.bankName+'<br>')
			$('#result').append('[계좌번호] ' + list.accountNumber+'<br>')
			$('#result').append('[계좌 비밀번호] ' + list.password+'<br>')
			$('#result').append('[계좌 별칭] ' + list.alias+'<br>')
			$('#result').append('[계좌 잔액] ' + list.balance+'<br>')
			$('#result').append('[계좌 개설일] ' + list.openDate+'<br>')
			$('#result').append('[회원 아이디] ' + list.id +'<br>')
			$('#result').append('---------------------------------------------')
		}
	}
</script>
</html>