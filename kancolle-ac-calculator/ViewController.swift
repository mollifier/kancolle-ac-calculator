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
    // 海域ごとのステージを並べた配列
    private var tableData: [[Stage]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        mainTableView = UITableView(frame: self.view.bounds)
        mainTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        mainTableView.dataSource = self
        mainTableView.delegate = self
        self.view.addSubview(mainTableView)
        
        self.tableData = (1...StageCreater.areaCount()).map { StageCreater.stages($0) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.tableData.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData[section].count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "海域\(self.tableData[section][0].areaNumber)"
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // TODO : 未実装
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        updateTableViewCell(cell, cellForRowAtIndexPath: indexPath)
        return cell
    }
    
    private func updateTableViewCell(cell: UITableViewCell, cellForRowAtIndexPath indexPath: NSIndexPath) {
        // TODO::
        let stage = self.tableData[indexPath.section][indexPath.row]
        let stageTypeText = stage.stageType == Stage.StageType.Normal ? "　　" : "追撃"
        cell.textLabel?.text = "\(stage.areaNumber)-\(stage.stageNumber) \(stageTypeText): \(stage.cost)"
    }
}

