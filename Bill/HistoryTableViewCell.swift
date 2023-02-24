//
//  HistoryTableViewCell.swift
//  Bill
//
//  Created by Никита Попов on 24.02.23.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    var summLabel:UILabel!
    var dateLabel:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCell(){
        summLabel = UILabel()
        dateLabel = UILabel()
        contentView.addSubview(summLabel)
        contentView.addSubview(dateLabel)
        summLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            summLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            summLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            summLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            summLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            dateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4)
        ])
        
        dateLabel.textAlignment = .right
    }
    
    func updeteInfo(target: HistoryBill){
        summLabel.text = target.summ
        dateLabel.text = target.timeAndDate
    }

}
