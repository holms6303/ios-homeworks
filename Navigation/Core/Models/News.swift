//
//  News.swift
//  Navigation
//
//  Created by Алексей Заметаев on 26.02.2022.
//

struct News: Decodable {

//    change likes and views to int
    struct Article: Decodable {
        let author, description, image, likes, views: String



        enum CodingKeys: String, CodingKey {
            case author, description, image, likes, views
        }
    }

    let articles: [Article]
}
