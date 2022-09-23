//
//  ArticleRepository.swift
//  DemoApp
//
//  Created by Jay on 23/09/22.
//

import Foundation

//https://node-ai.summitmedia-digital.com/api-v2/getjswidgetdata?domain=pep&slug=https://www.pep.ph/news/local/168543/dennis-padilla-karen-davila-interview-a718-20220919?ref=node_article&clientid=123pep

class ArticleRepository {
    
    func fetchLocalArticles(completion: @escaping ([Article])-> Void) {
       let url = URL(string: "https://node-ai.summitmedia-digital.com/api-v2/getjswidgetdata?domain=pep&slug=https://www.pep.ph/news/local/168543/dennis-padilla-karen-davila-interview-a718-20220919?ref=node_article&clientid=123pep")
        let urlRequest = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: urlRequest) { data, URLResponse, error in
            if error == nil {
                do {
                    if let data = data, let jsonDict = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        let articles = jsonDict["result"] as? [[String: Any]] ?? []
                        let articleData = try JSONSerialization.data(withJSONObject: articles)
                        let articlesList = try JSONDecoder().decode([Article].self, from: articleData)
                        completion(articlesList)
                    }
                } catch  {
                    
                }
            }
        }
        dataTask.resume()
    }
}
