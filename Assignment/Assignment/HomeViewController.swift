//
//  ViewController.swift
//  Assignment
//
//  Created by DuyLoc on 9/21/17.
//  Copyright © 2017 Codebox Solutions Ltd. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class HomeViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableChannel: UITableView!
    var channelList: [Quote] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.title = "Home"
        self.tableChannel.dataSource = self;
        self.fetchAllQuotes { (Quotes) in
            self.channelList = Quotes!
            self.tableChannel.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //UITableView Delegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as! ChannelTableViewCell
        let channel = self.channelList[indexPath.row] as Quote
        cell.configureCellWithObject(object: channel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.channelList.count
    }
    
    func fetchAllQuotes(completion: @escaping ([Quote]?) -> Void) {
        Alamofire.request(
            URL(string: "https://boiling-temple-34338.herokuapp.com/api/v1/quote")!,
            method: .get)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(response.result.error!)")
                    completion(nil)
                    return
                }
                guard let value = response.result.value as? [String: Any],
                    let rows = value["results"] as? [[String: Any]] else {
                        print("Malformed data received from fetchAllRooms service")
                        completion(nil)
                        return
                }
                
                let rooms = rows.flatMap({ (roomDict) -> Quote? in
                    return Quote.init(roomDict)
                })
                
                completion(rooms)
        }
    }
}

