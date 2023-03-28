<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생산지시</title>
</head>
<body>
<button onclick=""><i class="fa fa-search" aria-hidden="true"></i>조회</button>
<div id="grid"></div>
<script>
var gridData = [
    {
      name: 'Beautiful Lies',
      artist: 'Birdy',
      release: '2016-03-26',
      type: 'Deluxe',
      genre: 'Pop'
    },
    {
      name: 'X',
      artist: 'Ed Sheeran',
      release: '2014-06-24',
      type: 'Deluxe',
      genre: 'Pop'
    },
    {
      name: 'Moves Like Jagger',
      release: '2011-08-08',
      artist: 'Maroon5',
      type: 'Single',
      genre: 'Pop,Rock'
    },
    {
      name: 'A Head Full Of Dreams',
      artist: 'Coldplay',
      release: '2015.12.04',
      type: 'Deluxe',
      genre: 'Rock'
    },
    {
      name: '19',
      artist: 'Adele',
      release: '2008.01.27',
      type: 'EP',
      genre: 'Pop,R&B'
    },
    {
      name: '21',
      artist: 'Adele',
      release: '2011.01.21',
      type: 'Deluxe',
      genre: 'Pop,R&B'
    },
    {
      name: '25',
      artist: 'Adele',
      release: '2015.11.20',
      type: 'EP',
      genre: 'Pop'
    }
  ];
var grid = new tui.Grid({
    el: document.getElementById('grid'),
    data: gridData,
    scrollX: false,
    scrollY: false,
    rowHeaders: ['checkbox'],
    columns: [
      {
        header: '지시번호',
        name: 'name',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '상태',
        name: 'artist',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '유형',
        name: 'type',
        editor: {
          type: 'select',
          options: {
            listItems: [
              { text: '일반', value: '일반' },
              { text: '재작업', value: '재작업' },
              { text: '개발품(시재품)', value: '개발품(시재품)' }
            ]
          }
        }
      },
      {
        header: '지시일',
        name: 'release',
        sortingType: 'desc',
        sortable: true,
        editor: {
          type: 'datePicker',
          options: {
            format: 'yyyy-MM-dd'
          }
        }
      },
      {
        header: '완료일',
        name: 'genre',
        sortingType: 'desc',
        sortable: true,
        editor: {
          type: 'datePicker',
          options: {
            format: 'yyyy-MM-dd'
          }
        }
      },
      {
        header: 'ITEM코드',
        name: 'genre',
        sortingType: 'desc',
        sortable: true,
        editor: 'text'
      },
      {
        header: '품명',
        name: 'genre',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '품목코드',
        name: 'genre',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '규격',
        name: 'genre',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: 'lot_size',
        name: 'genre',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '수량',
        name: 'genre',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '창고',
        name: 'genre',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '창고명',
        name: 'genre',
        sortingType: 'desc',
        sortable: true
      },
    ]
  });
</script>
</body>
</html>