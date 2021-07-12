//
//  CovidStatisticListViewController.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 12.07.2021.
//

import UIKit

class CovidStatisticListViewController: UIViewController {

    weak var coordinator: CovidStatisticListCoordinator?
    var viewModel: CovidStatisticListViewModel!
    let tableView = UITableView()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCovidStatisticList()
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
        
        self.tableView.register(UINib(nibName: "CovidStatisticListTableViewCell", bundle: nil), forCellReuseIdentifier: CovidStatisticListTableViewCell.identifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func fetchCovidStatisticList() {
        self.activityIndicator.startAnimating()
        
        viewModel.fetchCovidData { isFinish in
            if isFinish {
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidesWhenStopped = true
                    self.configureTableView()
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
}

extension CovidStatisticListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CovidStatisticListTableViewCell.identifier, for: indexPath) as? CovidStatisticListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.configure(with: viewModel, indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
