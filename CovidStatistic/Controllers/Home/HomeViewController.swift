//
//  HomeViewController.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 9.07.2021.
//

import UIKit

enum Menu: Int {
    case list = 0
    case total = 1
}

class HomeViewController: UIViewController {
    
    weak var coordinator: CovidStatisticListCoordinator?
    var menu: Menu?
    var viewModel: HomeViewModel!
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    private func configureTableView() {
        self.view.addSubview(tableView)
        
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorStyle = .none
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.configure(with: viewModel, indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = Menu(rawValue: indexPath.row)
        switch menu {
        case .list:
            viewModel.tappedMenu(menu: .list)
        case .total:
            viewModel.tappedMenu(menu: .total)
        default:
            print("none")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
