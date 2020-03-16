//
//  ViewController.swift
//  MyFriends
//
//  Created by 최은지 on 13/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellIdenfifier: String = "cell"
    
    var freinds: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        // json 통신
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else { return }
        
        do {
            self.freinds = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.freinds.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdenfifier, for: indexPath)
        
        let friend: Friend = self.freinds[indexPath.row]
        
        cell.textLabel?.text = friend.nameAndAge
        cell.detailTextLabel?.text = friend.fullAddress
        
        return cell
    }
    
    
    
}

