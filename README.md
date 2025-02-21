Case Study Uygulama Açıklaması ve Kullanılan Teknolojiler

Bu iOS uygulaması, JSONPlaceholder API'sinden kullanıcı verilerini alarak bir liste halinde gösterir ve kullanıcı seçildiğinde detaylı bilgilerini sunar. Uygulama, MVVM mimarisi, SnapKit, RxSwift, Alamofire gibi modern iOS teknolojileriyle geliştirilmiştir.

Kullanılan Teknolojiler ve Nedenleri 

MVVM (Model-View-ViewModel): Uygulama tasarımında katmanların net bir şekilde ayrılmasını sağladım. Model veriyi temsil ederken, ViewModel veri ile View arasındaki bağlantıyı yönetir.

SnapKit: Auto Layout işlemlerini daha anlaşılır ve hızlı hale getirmek için kullandım.

RxSwift: Asenkron veri akışlarını yönetmek ve UI güncellemelerini reaktif bir şekilde yapmak için tercih ettim.

Alamofire: API ile veri iletişimini sağlamak için kullanıldı. JSON verisini alıp model objelerine dönüştürmek için oldukça faydalı oldu

Coordinators: Navigasyonu merkezi bir noktada tutarak, uygulamanın modüler ve test edilebilir olmasını sağladım.

Unit Testler: Kodun doğruluğunu test etmek amacıyla temel testler yazdım.

Uygulama Akışı

Kullanıcı Listesi: API'den çekilen kullanıcı verileri UITableView'da görüntülenir.

Kullanıcı Detayı: Bir kullanıcı seçildiğinde, kullanıcı bilgileri (isim, e-posta, telefon) detay ekranında gösterilir.

Network Katmanı

APIError, APIService ve NetworkManager sınıfları ile API hataları ve veri alma işlemleri merkezi bir yapıda yönetilir.

Alamofire kullanarak API'den gelen veriyi doğru şekilde işledim.

Repositories Katmanı

UserRepository sınıfı, API'den alınan veriyi işler ve ViewModel'lere aktarır. Bu sayede Network ve UI katmanları arasındaki bağımlılığı azalttım.

Nereye Odaklandım?

Clean Code: Kodun sürdürülebilir ve okunabilir olmasına özen gösterdim. Her sınıfın belirli bir sorumluluğu oldu.

API Yönetimi: Alamofire ile API çağrılarını verimli şekilde yönettim.

Veri Geçişi: Kullanıcı listesi ve detay ekranları arasında veri geçişini doğru şekilde sağladım.

Benden Beklenen Ne İdi?

MVVM Mimarisi: Her katmanı sorumluluklarına uygun şekilde tasarlamak.

API Yönetimi: API çağrılarını düzgün ve hatasız yönetmek.

Veri Geçişi: Kullanıcı verilerini ekranlar arasında düzgün bir şekilde aktarabilmek.

Ne Yaptım?

Projede Alamofire kullanarak API'den veri çektim ve gelen veriyi JSONDecoder ile model objelerine dönüştürdüm. UserRepository aracılığıyla ViewModel'lere veri aktardım. NetworkManager sınıfı ile tüm ağ işlemleri merkezi bir noktada toplandı.

Ne Öğrendim?

MVVM mimarisini daha derinlemesine öğrendim ve ViewModel ile View arasındaki bağımlılığı azalttım.

API yönetimi ve hata yönetimi konusunda deneyim kazandım.

Clean Code yazma pratiği yaparak, kodun anlaşılabilirliğini artırmanın önemini fark ettim.

Unit Testler yazmanın doğruluğu artırmada ne kadar önemli olduğunu öğrendim.

Hatalı Testi Bıraktım Çünkü...

Test yazmaya yeni başladığım için, yazdığım ilk testlerin başarısız olmasını özellikle istedim. Çünkü bu, yanlış test yazımını ve hataların

nasıl oluştuğunu anlamamı sağladı. Ayrıca, AI'dan aldığım destekle testlerin nasıl yazıldığını gördüm. Hatalı testlerin ne gibi hatalar

yaptığını anlamak, yazılım geliştirme sürecinde çok önemli bir beceri.

Bu hatalı testle, doğru test yazma pratiği yaparak nasıl testlerin başarısız olacağını gözlemleyebileceğimi öğrendim. Ayrıca, testlerimin zamanla daha iyi olmasını sağlamak için bu başarısız testlerin gerçekçi senaryolara göre nasıl geliştirilmesi gerektiğini de fark ettim. 

