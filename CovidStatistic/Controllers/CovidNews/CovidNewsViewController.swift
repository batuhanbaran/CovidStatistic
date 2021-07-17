//
//  CovidNewsViewController.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import UIKit

class CovidNewsViewController: UIViewController {
    
    weak var coordinator: CovidNewsCoordinator?
    var viewModel: CovidNewsViewModel!
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchCovidNews()
        configureTableView()
    }
    
    private func configureTableView() {
        self.view.addSubview(tableView)
        
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.tableView.register(UINib(nibName: "CovidNewsTableViewCell", bundle: nil), forCellReuseIdentifier: CovidNewsTableViewCell.identifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func fetchCovidNews() {
        viewModel.fetchCovidNews { success in
            if success {
                DispatchQueue.main.async {
                    self.configureTableView()
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
}


extension CovidNewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CovidNewsTableViewCell.identifier, for: indexPath) as? CovidNewsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.configure(with: viewModel, indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 345
    }
}
