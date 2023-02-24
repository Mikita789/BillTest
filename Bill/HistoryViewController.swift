//
//  HistoryViewController.swift
//  Bill
//
//  Created by Никита Попов on 24.02.23.
//

import UIKit

class HistoryViewController: UIViewController {
    var table:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "История"
        
        tableSettings()
        self.table.delegate = self
        self.table.dataSource = self
        
    }

    private func tableSettings(){
        table = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        table.register(HistoryTableViewCell.self, forCellReuseIdentifier: "historyCell")
        
    }

}

extension HistoryViewController:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as? HistoryTableViewCell else { return UITableViewCell()}
        if indexPath.row == 0{
            cell.dateLabel.text = "Сумма"
            cell.dateLabel.font = .boldSystemFont(ofSize: 20)
            cell.summLabel.text = "Дата"
            cell.summLabel.font = .boldSystemFont(ofSize: 20)
        }else{
            cell.updeteInfo(target: history[indexPath.row - 1])
        }

        
        return cell
    }
}

extension HistoryViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
