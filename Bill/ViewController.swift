//
//  ViewController.swift
//  Bill
//
//  Created by Никита Попов on 23.02.23.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {
    
    var topView:UIView!
    var billLabel:UILabel!
    var billTextField:UITextField!
    
    var bottView:UIView!
    var persentLabel:UILabel!
    var countPersonLabel:UILabel!
    var currentCountPerson:UILabel!
    var stepperPerson:UIStepper!
    var selectCountPercent:UISegmentedControl!
    var historyScreenButton:UIButton!
    var resultButton:UIButton!
    
    var percents = ["0%", "5%", "10%", "20%"]
    var startValuePerson = 2.0
    var intPercents = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strPercents = percents.map{$0.split(separator: "").filter{Int($0) != nil}.map{String($0)}}
        intPercents = strPercents.map{Int($0.joined(separator: "")) ?? 1}
        
        
        topViewSettings()
        bottViewSettings()
        billLabelSettings()
        billTextFieldSettings()
        persentLabelSettings()
        selectCountPercentSettings()
        countPersonLabelSettings()
        currentCountPersonSettings()
        stepperPersonSettings()
        resultButtonSettings()
        historyScreenButtonSettings()
        upLoadData()
        
    }
    //скрывает клавиатуру при нажатии на другое место
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.billTextField.resignFirstResponder()
    }
    private func topViewSettings(){
        topView = UIView()
        self.view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        topView.backgroundColor = .white
    }
    
    private func bottViewSettings(){
        bottView = UIView()
        self.view.addSubview(bottView)
        bottView.translatesAutoresizingMaskIntoConstraints = false
        bottView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        bottView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        bottView.backgroundColor = UIColor(red: 0.57, green: 0.81, blue: 0.77, alpha: 0.5)
    }
    
    private func billLabelSettings(){
        billLabel = UILabel()
        topView.addSubview(billLabel)
        billLabel.translatesAutoresizingMaskIntoConstraints = false
        billLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        billLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 20).isActive = true
        billLabel.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.2).isActive = true
        billLabel.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.5).isActive = true
        
        billLabel.text = "Введите сумму счета"
        billLabel.textColor = .lightGray
    }
    
    private func billTextFieldSettings(){
        billTextField = UITextField()
        topView.addSubview(billTextField)
        billTextField.translatesAutoresizingMaskIntoConstraints = false
        billTextField.topAnchor.constraint(equalTo: billLabel.bottomAnchor, constant: 10).isActive = true
        billTextField.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 10).isActive = true
        billTextField.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        billLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: 10).isActive = true
        
        billTextField.placeholder = "∑"
        billTextField.textAlignment = .center
        billTextField.textColor = .systemGreen
        billTextField.font = .systemFont(ofSize: 50)
        billTextField.keyboardType = .numberPad
    }
    
    private func persentLabelSettings(){
        persentLabel = UILabel()
        self.view.addSubview(persentLabel)
        persentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            persentLabel.topAnchor.constraint(equalTo: bottView.topAnchor, constant: 10),
            persentLabel.leftAnchor.constraint(equalTo: bottView.leftAnchor, constant: 20),
            persentLabel.widthAnchor.constraint(equalTo: bottView.widthAnchor, multiplier: 0.5),
            persentLabel.heightAnchor.constraint(equalTo: billLabel.heightAnchor)
        ])
        
        persentLabel.text = "Выберите чаевые"
        persentLabel.textColor = .lightGray
    }
    
    private func selectCountPercentSettings(){
        selectCountPercent = UISegmentedControl(items: percents)
        bottView.addSubview(selectCountPercent)
        selectCountPercent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectCountPercent.topAnchor.constraint(equalTo: persentLabel.bottomAnchor, constant: 10),
            selectCountPercent.leftAnchor.constraint(equalTo: bottView.leftAnchor),
            selectCountPercent.centerXAnchor.constraint(equalTo: bottView.centerXAnchor),
            selectCountPercent.heightAnchor.constraint(equalToConstant: 30)

        ])
        selectCountPercent.selectedSegmentIndex = 0
    }
    
    private func countPersonLabelSettings(){
        countPersonLabel = UILabel()
        bottView.addSubview(countPersonLabel)
        countPersonLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countPersonLabel.topAnchor.constraint(equalTo: selectCountPercent.bottomAnchor, constant: 10),
            countPersonLabel.leftAnchor.constraint(equalTo: bottView.leftAnchor, constant: 20),
            countPersonLabel.heightAnchor.constraint(equalTo: persentLabel.heightAnchor),
            countPersonLabel.widthAnchor.constraint(equalTo: persentLabel.widthAnchor),
        ])
        
        countPersonLabel.textColor = .lightGray
        countPersonLabel.text = "Колличество друзей"
    }
    
    private func currentCountPersonSettings(){
        currentCountPerson = UILabel()
        bottView.addSubview(currentCountPerson)
        currentCountPerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentCountPerson.topAnchor.constraint(equalTo: countPersonLabel.bottomAnchor, constant: 10),
            currentCountPerson.heightAnchor.constraint(equalTo: bottView.heightAnchor, multiplier: 0.08),
            currentCountPerson.widthAnchor.constraint(equalTo: bottView.widthAnchor, multiplier: 0.09),
            currentCountPerson.rightAnchor.constraint(equalTo: bottView.centerXAnchor, constant: -20)
        ])
        currentCountPerson.text = "\(Int(self.startValuePerson))"
        currentCountPerson.textColor = .systemGreen
        currentCountPerson.font = .systemFont(ofSize: 30)
        currentCountPerson.textAlignment = .center
        
    }
    
    private func stepperPersonSettings(){
        stepperPerson = UIStepper()
        bottView.addSubview(stepperPerson)
        stepperPerson.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stepperPerson.centerYAnchor.constraint(equalTo: currentCountPerson.centerYAnchor),
            stepperPerson.leftAnchor.constraint(equalTo: bottView.centerXAnchor),
            stepperPerson.heightAnchor.constraint(equalTo: selectCountPercent.heightAnchor),
            stepperPerson.widthAnchor.constraint(equalTo: bottView.widthAnchor, multiplier: 0.3)
        ])
        
        stepperPerson.stepValue = 1
        stepperPerson.value = self.startValuePerson
        stepperPerson.addTarget(self, action: #selector(stepperTargetActions), for: .valueChanged)
    }
    
    private func resultButtonSettings(){
        resultButton = UIButton()
        bottView.addSubview(resultButton)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultButton.bottomAnchor.constraint(equalTo: bottView.bottomAnchor, constant: -30),
            resultButton.centerXAnchor.constraint(equalTo: bottView.centerXAnchor),
            resultButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            resultButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)
        ])
        
        resultButton.setTitle("Рассчитать", for: .normal)
        resultButton.setTitleColor(.white, for: .normal)
        resultButton.backgroundColor = .systemGreen
        resultButton.layer.cornerRadius = 20
        
        resultButton.addTarget(self, action: #selector(resultButtonAction), for: .touchUpInside)
    }
    
    private func historyScreenButtonSettings(){
        historyScreenButton = UIButton()
        bottView.addSubview(historyScreenButton)
        historyScreenButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            historyScreenButton.centerYAnchor.constraint(equalTo: resultButton.centerYAnchor),
            historyScreenButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            historyScreenButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.02),
            historyScreenButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.06)
        ])
        
        historyScreenButton.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        historyScreenButton.tintColor = .black
        historyScreenButton.addTarget(self, action: #selector(historyButtonAction), for: .touchUpInside)
    }
    
    private func calculateSumm(startSumm:Double, countPerson:Double, percent:Double) -> Double{
        let result = (startSumm + startSumm * percent / 100) / countPerson
        return Double(String(format: "%.2f", result)) ?? 0.0
    }
    
    private func saveBill(date:String, summBill: String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "HistoryBill", in: context) else { return }
        let object = HistoryBill(entity: entity, insertInto: context)
        object.summ = summBill
        object.timeAndDate = date
        do{
            try context.save()
            history.append(object)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
    
    private func upLoadData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let req:NSFetchRequest<HistoryBill> = HistoryBill.fetchRequest()
        do{
            history = try context.fetch(req)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    @objc func stepperTargetActions(){
        currentCountPerson.text = "\(Int(stepperPerson.value))"
    }
    
    @objc func resultButtonAction(){
        let currentIndexSegmentContol = selectCountPercent.selectedSegmentIndex
        guard let summ  = Double(billTextField.text ?? "0"), let countPerson = Double(currentCountPerson.text ?? "1") else { return }
        let percent = Double(intPercents[currentIndexSegmentContol])
        let resultSumm = calculateSumm(startSumm: summ, countPerson: countPerson, percent: percent)
        
        let alert = UIAlertController(title: "Счет на человека", message: "\(resultSumm)", preferredStyle: .alert)
        let act = UIAlertAction(title: "OK", style: .default)
        alert.addAction(act)
        present(alert, animated: true)
        
        let currentDate = Date()
        let dateFormater = DateFormatter()
        dateFormater.locale = Locale(identifier: "ru_RU")
        dateFormater.dateFormat = "d-MM-yy  HH:mm"
        let srtDate = dateFormater.string(from: currentDate)
        print(srtDate)
        
        saveBill(date: srtDate, summBill: String(resultSumm))
    }
    
    @objc func historyButtonAction(){
        let nextVC = HistoryViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    
}
