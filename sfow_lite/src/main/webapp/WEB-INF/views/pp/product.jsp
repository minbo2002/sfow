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
      name: '230317-003',
      artist: '저장',
      release: '2016-03-26',
      genre: '2016-03-27'
    },
    {
      name: '230317-001',
      artist: '저장',
      release: '2014-06-24',
      genre: '2014-06-25'
    },
    {
      name: '230317-002',
      artist: '저장',
      release: '2014-06-23',
      genre: '2014-06-24'
    },
    {
      name: '230303-006',
      artist: '저장',
      release: '2015-12-04',
      genre: '2015-12-05'
    },
    {
      name: '230227-005',
      artist: '저장',
      release: '2018-01-27',
      genre: '2018-01-28'
    },
    {
      name: '230227-003',
      artist: '저장',
      release: '2011-01-21',
      genre: '2011-01-22'
    },
    {
      name: '230227-007',
      artist: '저장',
      release: '2015-11-20',
      genre: '2015-11-21'
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
        name: '',
        sortingType: 'desc',
        sortable: true,
        editor: 'text'
      },
      {
        header: '품명',
        name: '',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '품목코드',
        name: '',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '규격',
        name: '',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: 'lot_size',
        name: '',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '수량',
        name: '',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '창고',
        name: '',
        sortingType: 'desc',
        sortable: true
      },
      {
        header: '창고명',
        name: '',
        sortingType: 'desc',
        sortable: true
      },
    ]
  });
</script>
</body>
</html>