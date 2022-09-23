//
//  ViewController.swift
//  DemoApp
//
//  Created by Jay on 23/09/22.
//

import UIKit

class ArticleListVC: UIViewController {
    
    @IBOutlet var articleListTable: UITableView!
    
    let viewModel = ArticleListViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseViewModelCallbacks()
        viewModel.fetchArticles()
        // Do any additional setup after loading the view.
    }
    
    func initialiseViewModelCallbacks() {
        viewModel.updateCallback = {
            DispatchQueue.main.async {
                self.articleListTable.reloadData()
            }
        }
    }
}

extension ArticleListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleListCell
        cell?.setUpData(article: viewModel.articlesList[indexPath.row])
        return cell!
    }
}

extension ArticleListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.articlesList[indexPath.row]
        if let articleUrl = article.article_url, let url = URL(string: articleUrl) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}
