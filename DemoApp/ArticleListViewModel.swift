//
//  ArticleListViewModel.swift
//  DemoApp
//
//  Created by Jay on 23/09/22.
//

import Foundation

class ArticleListViewModel {
    lazy var articleRepository = ArticleRepository()
    var updateCallback: (() -> Void)?
    var articlesList = [Article]()
    
    func fetchArticles() {
        articleRepository.fetchLocalArticles { articles in
            self.articlesList = articles
            if let callback = self.updateCallback {
                callback()
            }
        }
    }
}
