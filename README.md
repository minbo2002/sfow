# sfow (기업 협업프로젝트)

<br>

**1. 프로젝트 기술 스택**

- Backend  :  `Java`, `Spring`, `Mybatis`
- Frontend  :  `JSP`, `HTML`, `CSS`, `JS`, `BootStrap`, `Tui Grid`
- DB  :  `MariaDB`
- Infra  :  `AWS RDS`

**2. 프로젝트 특징**

- 실제 현장에서 운영되고있는 MES 시스템을 다운그레이드하여 구현
- Tui Grid 라이브러리를 사용한 화면구성
- Ajax로 JSON 데이터를 비동기방식으로 처리
- 비지니스 로직이 구현된 Service단에서 Transaction을 통해 오류발생시 rollback 처리
- AWS RDS를 활용하여 팀원들간의 DB테이블 및 더미데이터 참조

**3. 기능 설명**

- 사용자관리 (개인정보관리, 거래처정보관리, 사용자 정보 엑셀 다운로드 기능, 공지사항 게시판) 구현
- 기준정보 (원자재, 반제품, 제품 품목관리, 생산BOM 관리, 창고관리) 구현
- 영업관리 (견적서 및 수주서 관리, 출하 관리, 반품관리) 구현
- 자재구매 (발주, 구매입고) 구현
- 생산관리 (작업지시 및 작업등록) 구현
- 재고관리 (품목별, 창고별 재고관리) 구현

**4. 개인 성과**

1) 콜라비 협업툴을 활용하여 개발일정 및 계획수립
2) AWS RDS를 활용하여 팀원들에게 DB제공.
3) 영업관리중에서 출하관리를 담담. 견적서 및 수주서에 대한 데이터를 토대로 출하등록.

<br>

![image](https://github.com/minbo2002/sfow/assets/68101836/840f2e28-121e-4d81-aeef-d8a84c0859de)

![image](https://github.com/minbo2002/sfow/assets/68101836/6388fa0d-d41d-4706-bbc9-c7bf666c5d7b)

**5. DB 명세서**

![image](https://github.com/minbo2002/sfow/assets/68101836/d5e5dca5-28b0-4564-b69f-7470cb504e26)


