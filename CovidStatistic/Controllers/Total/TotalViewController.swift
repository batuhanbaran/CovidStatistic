//
//  TotalViewController.swift
//  CovidStatistic
//
//  Created by Batuhan Baran on 17.07.2021.
//

import UIKit

class TotalViewController: UIViewController {
    
    weak var coordinator: TotalCoordinator?
    var viewModel: TotalViewModel!
    let tableView = UITableView()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchTotalData()
    }
    
    private func fetchTotalData() {
        self.activityIndicator.startAnimating()
        viewModel?.fetchTotalData(completion: { success in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.configureTableView()
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidesWhenStopped = true
                }
            }
        })
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
        
        self.tableView.register(UINib(nibName: "TotalTableViewCell", bundle: nil), forCellReuseIdentifier: TotalTableViewCell.identifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel?.viewDidDisappear()
    }

}

extension TotalViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TotalTableViewCell.identifier, for: indexPath) as? TotalTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.configure(with: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
}
