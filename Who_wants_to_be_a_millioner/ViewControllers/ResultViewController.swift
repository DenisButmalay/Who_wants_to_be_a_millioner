//
//  ResultViewController.swift
//  Who_wants_to_be_a_millioner
//
//  Created by Денис Бутмалай on 30.10.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ResultTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ResultViewController: UITableViewDelegate {
    
}

extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell
        else { return UITableViewCell() }
        
        let record = Game.shared.records[indexPath.row]
        cell.dateLabel.text = "Дата: \(record.date.description)"
        cell.percentLabel.text = "Процент правильных ответов: \(record.percent)"
        cell.sumLabel.text = "Выигрыш: \(record.sum)"
        return cell
    }
    
}

