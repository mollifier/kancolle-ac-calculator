//
//  ViewController.swift
//  kancolle-ac-calculator
//
//  Created by mollifier on 2016/06/06.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    private var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        mainTableView = UITableView(frame: self.view.bounds)
        mainTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        mainTableView.dataSource = self
        mainTableView.delegate = self
        self.view.addSubview(mainTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // TODO : 仮実装
        return 3
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // TODO : 仮実装
        return String(section)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // TODO : 未実装
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO : 仮実装
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        // TODO : update cell
        
        return cell
    }
}

