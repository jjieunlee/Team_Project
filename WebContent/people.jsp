<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
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
   //전체 출력
   $(function() {
      $('#searchAll').click(
            function() {
               let url = 'people1.json';
               xhr.open('GET', url, true);
               xhr.send(null);
               xhr.onreadystatechange = function() {
                  if (xhr.readyState == 4 && xhr.status == 200) {
                     //console.log(xhr.responseText);
                     //console.log(typeof xhr.responseText);
                     const obj = JSON.parse(xhr.responseText);
                     const listArray = obj.people1;

                     let message = "<ol>";
                     for (let i = 0; i < listArray.length; i++) {
                        const listObj = listArray[i];
                        let 환자번호 = listObj.환자;
                        let 확진일 = listObj.확진일;
                        let 거주지 = listObj.거주지;
                        let 여행력 = listObj.여행력;
                        let 접촉력 = listObj.접촉력;
                        let 조치사항 = listObj.조치사항;
                        message += "<li>" + "환자번호:" + 환자번호 + "<br>"
                              + " 거주지:" + 거주지 + "</li>";
                     }
                     message += "</ol>";
                     $("#sel").append(message);
                  }
               }
            });

      //검색출력
      $('#search').click(function() {
         let url = 'people1.json';
         xhr.open('GET', url, true);
         xhr.send(null);
         xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
               const obj = JSON.parse(xhr.responseText);
               const listArray = obj.hospital1;
               //let input = document.getElementById('searchbar').value
               var input = "강남구";
               //console.log(input);
               var listEl = new Array();
               var index = 0;

               let message = "<ol>";
               for (let i = 0; i < listArray.length; i++) {
                  const listObj = listArray[i];
                  let 시군구 = listObj.시군구;
                  let 주소 = listObj.주소;
                  //console.log(listObj);
                  if (주소.indexOf(input) != -1) {
                     listEl[index++] = listObj;
                  }
               }
               
                     for (let j = 0; j < listEl.length; j++) {
                        const listObj1 = listEl[j];
                        let 시군구1 = listObj1.시군구;
                        let 의료기관명1 = listObj1.의료기관명;
                        let 주소1 = listObj1.주소;
                        //console.log("j" + j);
                        console.log(listObj1);
                        console.log("-------------");
                        message += index;
                         if(j==(listEl.length)-1){
                         //message += "의료기관명:" + 의료기관명1 + "<br>";
                           
                        } 
                     }
                     $("#sel").append(message);

                  console.log("out" + listEl.length);
               }
            }
      });
   });
</script>
</head>

<body>
   <div class="container">
      <div class="row" style="margin-top: 20px">
         <div class="col-sm-12">
            <h5 class="card-title">코로나선별진료소 검색</h5>
            <div class="form-row d-flex align-items-center">
               <div class="form-group col-md-10">
                  <input type="text" id="searchbar" name="address"
                     class="form-control" placeholder="예)서울특별시 강남구 역삼동" />
               </div>
               <div class="form-group col-md-2">
                  <button id="searchAll" class="btn btn-info btn-lg btn-block">
                     <i class="fa fa-search" aria-hidden="true"></i>전체검색
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