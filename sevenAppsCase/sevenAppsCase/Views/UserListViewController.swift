//
//  UserListViewController.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit      

// MARK: - UserListViewController
class UserListViewController: UIViewController {
    
    // Coordinator pattern için referans
    // Navigation işlemlerini yönetir
    var coordinator: UserCoordinator?
    
    // UI bileşenleri ve ViewModel
    private let tableView = UITableView()
    private let viewModel = UserListViewModel()
    private let disposeBag = DisposeBag()  // RxSwift memory management
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        
        // Küçük bir gecikme ile kullanıcıları getir
        // Bu gecikme UI'ın düzgün yüklenmesini sağlar
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.viewModel.fetchUsers()
        }
    }
    
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        // TableView'ı tam ekran yap
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Özel cell'i kaydet
        tableView.register(
            UserTableViewCell.self,
            forCellReuseIdentifier: UserTableViewCell.identifier
        )
    }
    
    // ViewModel ile UI bağlantılarını kur
    private func bindViewModel() {
        // Kullanıcı listesini TableView'a bağla
        viewModel.users
            .bind(to: tableView.rx.items(
                cellIdentifier: UserTableViewCell.identifier,
                cellType: UserTableViewCell.self)
            ) { _, user, cell in
                cell.configure(with: user)
            }
            .disposed(by: disposeBag)
        
        // Kullanıcı seçildiğinde detay sayfasına yönlendir
        tableView.rx.modelSelected(User.self)
            .subscribe(onNext: { [weak self] user in
                // Coordinator aracılığıyla detay sayfasına git
                self?.coordinator?.showUserDetail(userID: user.id)

                // TableView'daki seçili durumu temizle
                if let indexPath = self?.tableView.indexPathForSelectedRow {
                    self?.tableView.deselectRow(at: indexPath, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
}
