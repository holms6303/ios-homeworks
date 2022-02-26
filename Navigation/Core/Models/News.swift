//
//  News.swift
//  Navigation
//
//  Created by Алексей Заметаев on 26.02.2022.
//

struct News {

    struct Article {
        let author, description, image: String
        let likes, views: Int


        enum CodingKeys: String, CodingKey {
            case author, description, image
        }
    }

    let articles: [Article]
}
