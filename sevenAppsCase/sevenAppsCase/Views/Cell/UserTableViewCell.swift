//
//  UserTableViewCell.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import UIKit
import SnapKit     

// MARK: - UserTableViewCell
// Kullanıcı bilgilerini gösteren özel TableViewCell sınıfı
class UserTableViewCell: UITableViewCell {
    
    // Cell'i tanımlamak için kullanılan benzersiz kimlik
    // TableView'da register ve dequeue işlemlerinde kullanılır
    static let identifier = "UserTableViewCell"
    
    // Kullanıcı adını gösteren label
    // Private olarak tanımlanıp dışarıdan erişim engelleniyor
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)   
        label.textColor = .black
        return label
    }()
    
    // Kullanıcı emailini gösteren label
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    // Programmatik olarak cell oluşturulduğunda çağrılan initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()  // UI elemanlarını yerleştir
    }
    
    // Interface Builder kullanılmadığı için bu initializer'ı fatalError ile işaretliyoruz
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UI elemanlarının yerleşimini yapan fonksiyon
    private func setupUI() {
        // Label'ları contentView'a ekle
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
        
        // SnapKit ile nameLabel constraint'lerini ayarla
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-10)
        }
        
        // SnapKit ile emailLabel constraint'lerini ayarla
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    // Cell'i kullanıcı verisi ile dolduran fonksiyon
    func configure(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
