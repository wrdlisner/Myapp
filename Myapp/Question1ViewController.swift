//
//  Question1ViewController.swift
//  Myapp
//
//  Created by 袖川航平 on 2018/06/02.
//  Copyright © 2018 袖川航平. All rights reserved.
//

import UIKit

class Question1ViewController:UIViewController,
    UITableViewDataSource, UITableViewDelegate
    {
    
    let emotions = ["喜","怒","哀","楽"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emotions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "choices", for: indexPath)
     
        cell.textLabel!.text = emotions[indexPath.row]
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var tableView: UITableView!
    


}
