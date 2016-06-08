//
//  ViewController.swift
//  kancolle-ac-calculator
//
//  Created by mollifier on 2016/06/06.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StageSelectorCellDelegate {

    private let CellReuseIdentifier = "StageSelectorSell"
    private var mainTableView: UITableView!
    // 海域ごとのステージを並べた配列
    private var tableData: [[Stage]]!
    // 海域ごとの選択状態を並べた配列
    private var selectedData: [[Bool]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        mainTableView = UITableView(frame: self.view.bounds)
        mainTableView.allowsSelection = false
        mainTableView.registerClass(StageSelectorCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        self.view.addSubview(mainTableView)
        
        self.tableData = (1...StageCreater.areaCount()).map { StageCreater.stages($0) }
        // 初期状態ではすべてのステージを「未選択」とします
        self.selectedData = self.tableData.map { (stages) in stages.map { _ in false } }
    }

    override func viewWillAppear(animated: Bool) {
        for cell in self.mainTableView.visibleCells {
            if let c = cell as? StageSelectorCell, let indexPath = self.mainTableView.indexPathForCell(cell) {
                self.updateTableViewCell(c, cellForRowAtIndexPath: indexPath)
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        self.mainTableView.flashScrollIndicators()
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
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellReuseIdentifier, forIndexPath: indexPath) as! StageSelectorCell
        cell.delegate = self
        updateTableViewCell(cell, cellForRowAtIndexPath: indexPath)
        return cell
    }
    
    func switchValue(sender: StageSelectorCell, didChage on: Bool) {
        if let indexPath = self.mainTableView.indexPathForCell(sender) {
            self.selectedData[indexPath.section][indexPath.row] = on
        }
    }
    
    private func updateTableViewCell(cell: StageSelectorCell, cellForRowAtIndexPath indexPath: NSIndexPath) {
        let stage = self.tableData[indexPath.section][indexPath.row]
        cell.areaNumber = stage.areaNumber
        cell.stageNumber = stage.stageNumber
        cell.stageType = stage.stageType
        cell.cost = stage.cost
        cell.on = self.selectedData[indexPath.section][indexPath.row]
    }
}

