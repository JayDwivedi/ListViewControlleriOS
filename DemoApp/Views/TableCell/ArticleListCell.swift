//
//  ArticleListCell.swift
//  DemoApp
//
//  Created by Jay on 23/09/22.
//

import UIKit

class ArticleListCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.addShadow()
        }
    }
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var subHeadingLable: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleImageView.image = nil
    }
    func setUpData(article: Article) {
        if let heading = article.article_section {
            headingLabel.text = heading
        }
        
        if let description = article.article_title {
            subHeadingLable.text = description
        }
        
        if let imageUrl = article.article_image {
            articleImageView?.imageFromServerURL(urlString: imageUrl)
        }
    }
}

extension UIImageView {

 public func imageFromServerURL(urlString: String) {

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }}
