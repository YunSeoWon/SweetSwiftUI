# FruitMart

책 스윗한 SwiftUI에 있는 '실전 앱 구현하기' 에 대한 프로젝트입니다. 

```
- SwiftUI는 매 버전마다 계속 변하고 있어 실행 버전에 따라 동작이 상이한 경우가 많습니다.
- 책의 내용은 Xcode 11.3.1, iOS 13.3.1 기반으로 작성되었습니다.
- 코드는 iOS 14.0에서 동작하도록 수정하였으나 책의 설명과 UI나 동작이 일부 다를 수 있습니다.
```



## 탭

* 홈
* 레시피
* 갤러리
* 마이페이지



## 파일 구조

![image-20230112224802112](/Users/user/Library/Application Support/typora-user-images/image-20230112224802112.png)



### Source

소스코드를 저장하는 곳



### Resources

앱을 만들 때 사용되는 데이터들을 모아놓은 곳



#### Assets

assets.xcassets 에는 앱을 만드는 데 이용될 각종 이미지와 색에 대한 정보가 들어있다.



#### ProductData.json

앱에서 주로 사용할 데이터가 json 구조로 미리 작성되어 있다. 



### LaunchScreen

SwiftUI의 로고와 앱에서 사용할 메인색으로 런치스크린을 만들어 두었다.





# Architecture

Hexagonal architecture로 구현해보자.



## Domain

Domain model은 개념적 모델이며, 소프트웨어에서 구현해야 하는 의미있는 로직을 표현한다. 본질적으로 데이터 모델과 함께 애플리케이션의 비즈니스 로직이다.



## Ports

Port는 consumer에 구애받지 않는 항목이며 도메인 모델 사이의 종료 지점이다. port는 비즈니스 로직에 접근하는 매체이다. Swift에서 port는 애플리케이션의 사용 사례에 해당하는 `프로토콜` 이다. Port는 Adapter에 의해 소비된다.



## Adapters

Adapter는 도메인 모델과 애플리케이션에서 필요한 서비스 사이의 브릿지 역할을 한다. Adapter는 서로 독립적인 방식으로 다양한 외부 서비스와 비즈니스 로직 간의 통신을 수행하는 것을 목적으로 하는 레이어 역할을 한다.

Hexagonal achetecture에서 모든 외부 액터는 어댑터를 통해 포트와 상호작용한다. 
