//
//  Part2.swift
//  Receipe App
//
//  Created by DCS on 24/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part2: UIViewController {
    
    private let searchBar=UISearchBar()
    private let tableView=UITableView()
    private var dishArray = ["Jalebi","Fafda","Dabeli","VadaPav","Khaman"]
    private var searchData = [String]()
    private var arrToUse = [String]()
    private var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Recipe List"
        view.backgroundColor = .white
        view.addSubview(searchBar)
        searchBar.delegate = self
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData))
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        searchBar.frame = CGRect(x:20,y:view.safeAreaInsets.top,width: view.width-40,height: 50)
        tableView.frame = CGRect(x:20, y: searchBar.bottom+20, width: view.width-40, height: view.height-view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}

extension Part2: UITableViewDataSource, UITableViewDelegate {
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CityCell.self, forCellReuseIdentifier: "CityCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searching {
            arrToUse = searchData
        } else {
            arrToUse = dishArray
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
//        cell.textLabel?.text = arrToUse[indexPath.row]
        cell.setup(title: dishArray[indexPath.row], and: indexPath.row)
        cell.button.addTarget(self, action: #selector(openReceipeDetails), for: .touchUpInside)
        return cell
    }
    
    // For Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            dishArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(dishArray[indexPath.row])
    }
    
    @objc private func refreshData() {
        dishArray.shuffle()
        tableView.reloadData()	
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return  120 //For Setting Up the height of the each row
    }
    
}

extension Part2: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            searching = false
        } else {
        searching = true
            searchData = dishArray.filter({ $0.lowercased().hasPrefix(searchText.lowercased()) })
        }
        tableView.reloadData()
    }
    
    @objc private func openReceipeDetails(_ sender:UIButton) {
        let vc = ReceipeDetailsVC()
        vc.food_item = dishArray[sender.tag]
        vc.food_no = Int32((sender.tag))
        navigationController?.pushViewController(vc, animated: true)
    }
}
