## Flutter API 통신 연습

<br/>

+ GDSC 모바일팀에서 Solution Challenge를 대비해 진행
+ Docker를 사용해 localhost:3000 환경에서 API통신을 연습

### package
+ get
+ dio
+ get_it
+ json_annotation
+ json_serializable
+ build_runner
+ get_storage

<br/>

### 주차별 과제
+ 1주차 : 인증번호 검증 후 성공시 홈 화면으로 이동
+ 2주차 : 검증 단계에서 가입 여부를 확인, 가입된 경우 홈 화면으로 이동
+ 3주차 : 미가입시에 회원가입 기능 구현
+ 4주차 : accessToken,refreshToken GetStorage에 저장, 스플레시 화면에서 로그인 여부 판단
+ 5주차 : 게시글 작성 후 리스트뷰에 추가 구현

<br/>

### 디렉토리 구조

```bash
├─common
├─controller
├─data
│  ├─model
│  │  ├─request
│  │  └─response
│  ├─network
│  │  └─api
│  │      ├─auth
│  │      ├─constant
│  │      ├─post
│  │      └─user
│  └─repository
├─di
├─pages
│  └─auth
└─util

```
+ common : 앱에 사용되는 color, dimen, string 이 위치
+ controller : 뷰의 상태관리 및 로직을 담당하는 컨트롤러 위치, GetxController 사용
+ data
  + model : 데이터 클래스 위치
  + network
    + api : 통신에 사용되는 DioClient, DioException, baseUrl 등이 위치
  + repository : 데이터의 예외처리, 가공을 담당하는 Repository 위치
+ di : GetIt을 통해 DI 관리
+ pages : UI로 보여지는 위젯들 위치
+ util : 토큰을 관리할 TokenUtil 위치

