<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<style>
    #header {
        position: fixed;
        width: 100%;
    }
    
    #hacker-list {
        padding-top: 300px;
	    display: flex;
	    flex-direction: column;
    }

    .form-group {
        position: fixed;
        z-index: 5;
        width: 100%;
		margin-top: 20px;
        padding: 20px 300px;
        background-color: rgba(255, 255, 255, 0.9) ;
        top: 200px;
        border-bottom: 1px solid rgb(240, 240, 240);
        box-shadow: 0px 12px 10px -10px  rgba(0, 0, 0, 0.3);

    }
    .snack-img-wrapper {
    	width: 75%;
    	height: 75%;
    }
    .display-snack-list {
        display: flex;
        flex-wrap: wrap;
        width: 75%;
        margin: 10px 40px;
        height: 15%;
        justify-content: space-between; /* 요소 사이의 간격 조절 */
	    gap: 10px;
    }
    
  .display-each-snack {
        width: calc(25% - 30px);
        height: 10%;
        background-color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
      }

  .display-each-snack:hover {
        box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3); /* 마우스를 올렸을 때의 테두리 스타일 및 색상 지정 */
      }
  
    #snack-img {
        height: 80%;
        width: 80%;
    }
    
    .list hr {
        width: 95%;
        border: 1px solid rgb(240, 240, 240); /* 원하는 스타일로 변경 가능 */
    }
    
    #selection {
      text-align: center;
      position: fixed;
      top: 44%;
      right: 3%;
      width: 15%; /* 필요에 따라 너비를 조절하세요 */
      height: 40%;
      padding: 10px;
      border: 1px solid rgb(220, 220, 220);
    }
    #snack-selection-container {
      padding: 20px;
      height: 70%;
      overflow-y: auto;
    }
    
    #send-btn {
    	text-align: center;
    }
    .upper-div {
        display: flex;
    }
    .lower-div {
        display: flex;
    }
	.lower-div > * {
		margin-right: 10px;
	}
	.snack-selected {
		margin-bottom: 10px;
	}
    .snack-info-wrapper {
    }
    .snack-name-wrapper {
      width: 200px;
      color: black;
      white-space: nowrap;
      overflow: hidden;
      box-sizing: border-box;
    }
    .snack-name:hover {
      display: inline-block;
      animation: snack-name-wrapper 15s linear infinite;
    }
    @keyframes snack-name-wrapper {
      0%   { transform: translate(0, 0); }
      100% { transform: translate(-100%, 0); }
    }
    .snack-brand {
      color: 404040;;
    }
    .upper-div {
    	display: flex;
    	justify-content: space-between;
    }
</style>
<body>
<div id="header">
<jsp:include page="./header.jsp">
    <jsp:param name="pageTitle" value="간식 투표" />
  </jsp:include>
  </div>
  

  <div id="hacker-list">
    <div class="form-group">
      <input type="text" placeholder="Search" class="search form-control" />
    </div>

    <div class="list display-snack-list">
      <c:forEach var="item" items="${snacks}" varStatus="status">
        <div id="${item.snackId}" class="display-each-snack">
          <div class="snack-img-wrapper">
            <img src="${item.imgUrl}" id="snack-img" />
          </div>
          <div class="snack-info-wrapper">
          	<h5 class="snack-brand" id="${item.brand}">${item.brand}</h5>
            <div class="snack-name-wrapper">
              <h4 class="snack-name" id="${item.snackId}">${item.name}</h4>
            </div>
          </div>
        </div>

        <!-- 매 4번째 아이템일 때 줄 바꾸기 -->
        <c:if test="${status.index % 4 == 3}">
          <hr>
        </c:if>
      </c:forEach>
    </div>
    
    <div id="selection">
    	<span style="font-size: 20px;">투표함</span>
    	<hr>
      <div id="snack-selection-container">
      </div>
      <div id="send-btn">
          <button class="btn btn-primary" type="button">VOTE!!</button>
      </div>
    </div>

   </div>

</body>
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>

<script>
    const options = {
        valueNames: ['snack-name', 'snack-brand']
    };
    const hackerList = new List('hacker-list', options);

    let snackList = document.getElementById("snack-selection-container");

    let objList = [];

    function post() {
        const settings = {
            "url": "http://localhost:9999/api/voteSnack.do",
            "method": "POST",
            "timeout": 0,
            "headers": {
                "Content-Type": "application/json",
            },
            "data": JSON.stringify(objList),
        };
        $.ajax(settings).done(function (response) {
            // console.log(response);
            location.reload();
        });
    }

    function deleteSnack(event) {
        const elem = event.target.parentElement.parentElement;
        const delId = elem.getAttribute('id');
        // console.log(delId);
        $('#snack-selection-container #' + String(delId)).remove()
    }

    $(function () {
        $("button").click(function (e) {
            e.preventDefault()
            // console.log("button clicked")

            const snackContainer = document.getElementById("snack-selection-container");
            const snackSelectionList = snackContainer.getElementsByClassName("snack-selected");

            for (i = 0; i < snackSelectionList.length; i++) {
                const curId = String(snackSelectionList[i].id)
                const obj = {};
                obj.snackId = Number(curId);
                objList.push(obj);
            }
            post();
        });
    });

    $(function () {
        $(".display-each-snack").on("click", function () {
            const snackContainer = document.getElementById("snack-selection-container");
            const snackSelectionList = snackContainer.getElementsByClassName("snack-selected");
            console.log(snackSelectionList.length);
            if (snackSelectionList.length >= 3) {
                return;
            }
            const curId = String(this.id);
            let snackName = "";

            const searchList = document.getElementsByClassName("display-each-snack");
            for (let i = 0; i < searchList.length; i++) {
                if (String(searchList[i].id) === curId) {
                    snackName = searchList[i].querySelector(".snack-name").innerText;
                    break;
                }
            }

            // console.log(curId);

            const selectedDiv = document.createElement("div");
            const spanDiv = document.createElement("div");
            const span = document.createElement("span");
            const upperDiv = document.createElement("div");
            const lowerDiv = document.createElement("div");

            spanDiv.id = "snackSpanDiv";
            span.innerText = snackName;

            spanDiv.appendChild(span);

            selectedDiv.id = curId;
            selectedDiv.className = "snack-selected";

            const delBtn = document.createElement("button");
            delBtn.innerText = 'X';
            delBtn.classList.add("btn")
            delBtn.classList.add("btn-danger")
            delBtn.classList.add("delBtn");
            delBtn.addEventListener("click", deleteSnack);

            upperDiv.classList.add("upper-div");
            lowerDiv.classList.add("lower-div");
            upperDiv.appendChild(spanDiv);
            upperDiv.appendChild(delBtn);

            selectedDiv.appendChild(upperDiv);
            selectedDiv.appendChild(lowerDiv);

            const created = document.getElementsByClassName("snack-selected");
            for (i = 0; i < created.length; i++) {
                if (String(curId) === created[i].id) return
            }

            snackList.appendChild(selectedDiv);

            let ssc = document.querySelector("#snack-selection-container");
            ssc.scrollTop = ssc.scrollHeight;
        })
    })
</script>