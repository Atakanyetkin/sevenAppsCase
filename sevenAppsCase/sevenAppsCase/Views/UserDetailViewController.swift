//
//  UserDetailViewController.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit       

// MARK: - UserDetailViewController
class UserDetailViewController: UIViewController {
    
    // UI Bileşenleri
    private let cardView = UIView()  // Kullanıcı bilgilerini içeren kart view
    
    // Bilgi etiketleri
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let websiteLabel = UILabel()
    private let addressLabel = UILabel()
    private let companyLabel = UILabel()
    private let geoLocationLabel = UILabel()
    
    // Yükleme göstergesi
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // ViewModel ve RxSwift için gerekli özellikler
    private let viewModel: UserDetailViewModel
    private let disposeBag = DisposeBag()
    
    // Constructor - userID ile başlatılıyor
    init(userID: Int) {
        self.viewModel = UserDetailViewModel()
        super.init(nibName: nil, bundle: nil)
        viewModel.fetchUserDetail(userID: userID)  // Kullanıcı detaylarını getir
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    
    // UI kurulumu
    private func setupUI() {
        view.backgroundColor = UIColor.systemBackground

        // Kart view'ın görsel özellikleri
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 12
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowOffset = CGSize(width: 2, height: 2)
        cardView.layer.shadowRadius = 5
        view.addSubview(cardView)
        
        // Label'ların ayarlanması
        configureLabel(nameLabel, text: "👤 Ad: ")
        configureLabel(emailLabel, text: "📧 E-posta: ")
        configureLabel(phoneLabel, text: "📞 Telefon: ")
        configureLabel(websiteLabel, text: "🌍 Web: ")
        configureLabel(addressLabel, text: "🏡 Adres: ")
        configureLabel(companyLabel, text: "🏢 Şirket: ")
        configureLabel(geoLocationLabel, text: "📍 Konum: ")

        // StackView oluşturma ve yapılandırma
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel, emailLabel, phoneLabel, websiteLabel,
            addressLabel, companyLabel, geoLocationLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
        cardView.addSubview(stackView)
        
        view.addSubview(activityIndicator)

        // SnapKit ile constraint'lerin ayarlanması
        cardView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.greaterThanOrEqualTo(250)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    // ViewModel ile UI bağlantılarının kurulması
    private func bindViewModel() {
        // Kullanıcı detaylarını label'lara bağla
        viewModel.userDetail
            .compactMap { $0 }  // nil değerleri filtrele
            .subscribe(onNext: { [weak self] user in
                // Label'ları kullanıcı bilgileriyle doldur
                self?.nameLabel.text = "👤 Ad: \(user.name)"
                self?.emailLabel.text = "📧 E-posta: \(user.email)"
                self?.phoneLabel.text = "📞 Telefon: \(user.phone)"
                self?.websiteLabel.text = "🌍 Web: \(user.website)"
                self?.addressLabel.text = "🏡 Adres: \(user.address.street), \(user.address.city) - \(user.address.zipcode)"
                self?.companyLabel.text = "🏢 Şirket: \(user.company.name) | \(user.company.catchPhrase)"
                self?.geoLocationLabel.text = "📍 Konum: Lat: \(user.address.geo.lat), Lng: \(user.address.geo.lng)"
            })
            .disposed(by: disposeBag)
        
        // Loading durumunu activity indicator'a bağla
        viewModel.isLoading
            .subscribe(onNext: { [weak self] isLoading in
                self?.activityIndicator.isHidden = !isLoading
                isLoading ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
            })
            .disposed(by: disposeBag)
    }
    
    // Label'ları yapılandıran yardımcı fonksiyon
    private func configureLabel(_ label: UILabel, text: String) {
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 0  // Çok satırlı metin desteği
    }
}
