//
//  Restaurant.swift
//  SeSACSecondWeek
//
//  Created by Jack on 1/8/25.
//

import Foundation

struct Restaurant {
    let image: String
    let latitude: Double
    let longitude: Double
    let name: String
    let address: String
    let phoneNumber: String
    let category: String
    let price: Int
    let type: Int
}

struct RestaurantList {
    let restaurantArray: [Restaurant] = [
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6533675,
            longitude: 127.0477088,
            name: "리얼파스타 창동점",
            address: "서울 도봉구 마들로11길 71 신한빌딩 203호",
            phoneNumber: "0507-1405-7722",
            category: "양식",
            price: 15000,
            type: 400
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6533675,
            longitude: 127.0477088,
            name: "박보영김밥",
            address: "서울 도봉구 마들로11길 71 1층",
            phoneNumber: "0507-1385-2002",
            category: "분식",
            price: 4000,
            type: 100
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6535259,
            longitude: 127.0476973,
            name: "꽈백최선생 본점",
            address: "서울 도봉구 마들로11길 65 1층",
            phoneNumber: "0507-1333-5445",
            category: "분식",
            price: 4000,
            type: 100
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6551649,
            longitude: 127.0480795,
            name: "스타벅스 창동역점",
            address: "서울 도봉구 마들로13길 61",
            phoneNumber: "1522-3232",
            category: "카페",
            price: 6000,
            type: 200
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6551649,
            longitude: 127.0480795,
            name: "애슐리퀸즈 창동씨드큐브점",
            address: "서울 도봉구 마들로13길 61 씨드큐브 창동 3층",
            phoneNumber: "02-994-0472",
            category: "양식",
            price: 25000,
            type: 400
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6551649,
            longitude: 127.0480795,
            name: "청담동샤브 씨드큐브창동점",
            address: "서울 도봉구 마들로13길 61 2층 201-4호",
            phoneNumber: "02-991-5559",
            category: "한식",
            price: 15000,
            type: 300
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6551649,
            longitude: 127.0480795,
            name: "송추가마골 인어반 창동점",
            address: "서울 도봉구 마들로13길 61 2층 201-7, 8호",
            phoneNumber: "02-999-2789",
            category: "한식",
            price: 15000,
            type: 300
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6543873,
            longitude: 127.0474787,
            name: "샐러디 창동역점",
            address: "서울 도봉구 노해로69길 26",
            phoneNumber: "02-999-2123",
            category: "샐러드",
            price: 9000,
            type: 400
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6543873,
            longitude: 127.0474787,
            name: "본죽&비빔밥cafe 창4동점",
            address: "서울 도봉구 노해로69길 26",
            phoneNumber: "02-993-6233",
            category: "한식",
            price: 9000,
            type: 300
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6543095,
            longitude: 127.0473553,
            name: "큰집한식뷔페",
            address: "서울 도봉구 노해로69길 21 지하1층",
            phoneNumber: "02-990-1100",
            category: "한식",
            price: 12000,
            type: 300
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6539443,
            longitude: 127.0474457,
            name: "마쯔무라돈까스 본점",
            address: "서울 도봉구 노해로63길 84 지하1층",
            phoneNumber: "02-995-3575",
            category: "일식",
            price: 12000,
            type: 300
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6539443,
            longitude: 127.0474457,
            name: "창동짬뽕",
            address: "서울 도봉구 노해로63길 84",
            phoneNumber: "02-994-8892",
            category: "중식",
            price: 8000,
            type: 300
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/placeholder.jpg",
            latitude: 37.6532157,
            longitude: 127.0477265,
            name: "빽다방 창동역점",
            address: "서울 도봉구 마들로11길 57",
            phoneNumber: "02-991-8778",
            category: "카페",
            price: 3000,
            type: 200
        )
    ]
}
