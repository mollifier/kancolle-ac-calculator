//
//  StageSelectorSell.swift
//  kancolle-ac-calculator
//
//  Created by mollifier on 2016/06/07.
//
//

import UIKit

protocol StageSelectorCellDelegate {
    func switchValue(sender: StageSelectorCell, didChage on: Bool)
}

class StageSelectorCell: UITableViewCell {
    var delegate: StageSelectorCellDelegate?
    
    var areaNumber: Int? {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var stageNumber: Int? {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var stageType: Stage.StageType? {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var cost: Int? {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    var on: Bool {
        get {
            return self.selectorSwitch.on
        }
        set {
            self.selectorSwitch.on = newValue
        }
    }
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let selectorSwitch = UISwitch()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bounds = self.contentView.bounds
        
        if let areaNumber = self.areaNumber, let stageNumber = self.stageNumber, let stageType = self.stageType {
            let stageTypeText = stageType == Stage.StageType.Normal ? "" : "追撃"
            self.titleLabel.text = "\(areaNumber)-\(stageNumber) \(stageTypeText)"
        }
        if let cost = self.cost {
            self.descriptionLabel.text = "\(cost) GP"
        }
        
        self.titleLabel.frame = CGRect(x: 20, y: 0, width: 100, height: bounds.size.height)
        self.descriptionLabel.frame = CGRect(x: bounds.size.width - 140, y: 0, width: 60, height: bounds.size.height)
        self.selectorSwitch.center = CGPoint(x: bounds.width - 42, y: bounds.height / 2)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
    }
    
    func switchChanged(sender: UISwitch) {
        self.delegate?.switchValue(self, didChage: sender.on)
    }
    
    private func initUI() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.selectorSwitch)
        self.selectorSwitch.addTarget(self, action: #selector(StageSelectorCell.switchChanged(_:)), forControlEvents: .ValueChanged)
    }
}
