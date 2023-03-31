<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>Modal</title>

    <style>
      .modal {
        position: absolute;
        top: 0;
        left: 0;

        width: 100%;
        height: 100%;

        display: none;

        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal.show {
        display: block;
      }

      .modal_body {
        position: absolute;
        top: 50%;
        left: 50%;

        width: 400px;
        height: 600px;

        padding: 40px;

        text-align: center;

        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

        transform: translateX(-50%) translateY(-50%);
      }
    </style>
  </head>
  <body>
    <div class="modal">
      <div class="modal_body">Modal</div>
    </div>
    <button class="btn-open-popup">Modal 띄우기</button>
    <div>
		<script>
			var gridData2=[];
			var grid2 = new tui.Grid({
			  el: document.getElementById('modalGrid'),
			  data: gridData2,
			  scrollX: false,
			  scrollY: false,
			  rowHeaders: [{
				  type: 'rowNum',
				  header: "  ",
				  width: 50,
			  },{type : 'checkbox'}     ],
			  columns: [
				{
				  header: '창고코드',
				  name: 'warehouse_code',
				  sortable: true,
				  align:'center'
				},
				{
				  header: '창고명',
				  name: 'warehouse_name',
				  sortable: true,
				  align:'center'
				}
			  ]
			});
		</script>
    </div>
    <script>
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.btn-open-popup');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });
      
    </script>
  </body>
</html>
