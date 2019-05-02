//
//  NewsViewController.swift
//  TabBar Custom
//
//  Created by Syamsul Falah on 26/04/19.
//  Copyright © 2019 Syamsul Falah. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var newsTableView: UITableView!
    
    let cellReuseIdentifier = "newsCell"
    
    var newsList = [String]()
    var newsTitle = [String]()
    var newsDatePublished = [String]()
    var newsUrl = [String]()
    
    var url = "https://newsapi.org/v2/everything?q=%22plastic%20waste%22&from="
    
    var fromDateNews = Date().description.prefix(10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = "\(url)\(fromDateNews)&sortBy=publishedAt&apiKey=a7b4ac71ee6640f4aecdabc90edc5304"
        
        newsTableView.estimatedRowHeight = 200
        newsTableView.rowHeight = UITableView.automaticDimension

        getNewsJSON()
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! NewsTableViewCell
        
        cell.newsTitleNewLabel.text = newsTitle[indexPath.row]
        cell.datePublishedLabel.text = newsDatePublished[indexPath.row]
        cell.contentLabel.text = newsList[indexPath.row]
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: newsUrl[indexPath.row])
        
        if url != nil {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            print("Incorrect URL")
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func getNewsJSON(){
        Alamofire.request(url, method: .get).responseJSON { response in
            if response.result.isSuccess {
                let json = JSON(response.result.value!)
                
                self.updateNews(json: json)
            } else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }
    
    func updateNews(json: JSON){
        let temp =  json["articles"]
        
        for i in 0 ..< temp.count {
            newsList.append(temp[i]["description"].stringValue)
            newsTitle.append(temp[i]["title"].stringValue)
            newsDatePublished.append(dateNewsPublishedFormatter(dateInput: temp[i]["publishedAt"].stringValue))
            newsUrl.append(temp[i]["url"].stringValue)
        }
        newsTableView.reloadData()
    }
    
    
    func dateNewsPublishedFormatter(dateInput: String) -> String{
        var dateResult: String = ""
        
        let dateFormatGet = DateFormatter()
        dateFormatGet.dateFormat = "yyyy-MM-dd"
        
        let dateFormatResult = DateFormatter()
        dateFormatResult.dateFormat = "MMM, dd yyyy"
        
        if let date = dateFormatGet.date(from: String(dateInput.prefix(10))) {
            dateResult = dateFormatResult.string(from: date)
        } else {
            dateResult = "There was an error decoding the string"
        }
        return dateResult
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fromDateNews = Date().description.prefix(10)
        
        url = "\(url)\(fromDateNews)&sortBy=publishedAt&apiKey=a7b4ac71ee6640f4aecdabc90edc5304"
        getNewsJSON()
    }
}
