//
//  News.swift
//  Navigation
//
//  Created by Алексей Заметаев on 26.02.2022.
//

struct News: Decodable {

    struct Article: Decodable {
        let author, description, image: String
        var likes, views: Int

        enum CodingKeys: String, CodingKey {
            case author, description, image, likes, views
        }
    }

    let articles: [Article]
}
