<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!--step01_ajax_get_json.html-->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hospital_List</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- Font Awesome CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1"
	crossorigin="anonymous">
<script type="text/javascript" src="jquery-3.5.1.js"></script>
<script type="text/javascript">
       
        var xhr;
        if (window.XMLHttpRequest) {
            xhr = new XMLHttpRequest();
        } else {
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xhr == null) {
            alert("Error create xhr object");
        }
      
        $(function () {
            $('#searchAll').click(function () {
                let url = 'hospital.json';
                xhr.open('GET', url, true);
                xhr.send(null);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        console.log(xhr.responseText);
                        console.log(typeof xhr.responseText);
                        const obj = JSON.parse(xhr.responseText);
                        const listArray = obj.hospital1;

                        let message = "<ol>";
                        for (let i = 0; i < listArray.length; i++) {
                            const listObj = listArray[i];
                            let 기준일시 = listObj.기준일시;
                            let 검체채취 = listObj.검체채취;
                            let 시도 = listObj.시도;
                            let 시군구=listObj.시군구;
                            let 의료기관명 = listObj.의료기관명;
                            let 주소=listObj.주소;
                            let 전화번호=listObj.대표전화번호;
                            message += "<li>" + "의료기관명:"+의료기관명 +"<br>"+" 주소:"+주소 + "</li>";
                        }
                        message += "</ol>";
                        $("#sel").append(message);
                    }
                }
            });
            $('#search').click(function (data) {
            	let url = 'hospital.json';
                xhr.open('GET', url, true);
                xhr.send(null);
            	let input = document.getElementById('searchbar').value;
            	xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        console.log(xhr.responseText);
                        console.log(typeof xhr.responseText);
                        
                        var listSelect = new Array();
                        var index=0;
                        const obj = JSON.parse(xhr.responseText);
                        const listArray = obj.hospital1;
                        /*
                        for(var i=0;i<list.Array.length;i++){
                        	const listObj = listArray[i];
                        	var HospitalLoc=listObj.주소;
                        	var a=$("#searchbar").val();
                        	if(HospitalLoc.indexOf(a=-1){
                        		listSelect[index++]=listObj;
                        	}
                        }
                        for(var j=0; j<listSelect.length; j++){
        	            	console.log(listSelect.length);
        	            }
                     	return listSelect;
 					    }*/
 					   let aa=1;
						if(($("#searchbar").val()==document.getElementsByClassName('주소'))){
							let message = "<ol>";
	                        for (let i = 0; i < listArray.length; i++) {
	                            const listObj = listArray[i];
	                            let 기준일시 = listObj.기준일시;
	                            let 검체채취 = listObj.검체채취;
	                            let 시도 = listObj.시도;
	                            let 시군구=listObj.시군구;
	                            let 의료기관명 = listObj.의료기관명;
	                            let 주소=listObj.주소;
	                            let 전화번호=listObj.대표전화번호;
	                            
	                            message += "<li>" + "의료기관명:"+의료기관명 +"<br>"+" 주소:"+주소 + "</li>";
	                            a++;
	                        }
	                        if(a==1){
	                        	message += "</ol>";
		                        $("#sel").append(message);
	                        }
	                        
						}
						if($("#searchbar").val()===null || $("searchbar").val()===""){
							alert("입력값을 넣어주세요");
							return ;
						}
						  
                    }
                }
            	});
            
                }
                
        });

            
        
    </script>
</head>

<body>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-sm-12">
				<h5 class="card-title">마스크 검색</h5>
				<div class="form-row d-flex align-items-center">
					<div class="form-group col-md-10">
						<input type="text" id="searchbar" name="address"
							class="form-control" placeholder="예)서울특별시 강남구 역삼동" />
					</div>
					<div class="form-group col-md-2">
						<button id="searchAll" class="btn btn-info btn-lg btn-block">
							<i class="fa fa-search" aria-hidden="true"></i> 모두검색
						</button>
						<button id="search" class="btn btn-info btn-lg btn-block">
							<i class="fa fa-search" aria-hidden="true"></i> 검색
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 20px">
			<div class="col-sm-12"></div>
		</div>
		<div class="row">
			<div class="col-sm-12" id="content2"></div>
		</div>
	</div>
	<div id="sel"></div>
</body>

</html>