//
//  ViewController.swift
//  ScreenStat
//
//  Created by Rodrigo Cerqueira Reis on 11/08/25.
//

import UIKit


class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel: HomeViewModelProtocol
    
    private var homeView: HomeView {
        return view as! HomeView
    }
    
    // MARK: - Initializers
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.titleLabel.text = viewModel.title
        
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
        
        viewModel.loadData()
        homeView.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let record = viewModel.records[indexPath.row]
        cell.textLabel?.text = "\(record.appName) - \(Int(record.usageTime))s"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
}
