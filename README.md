# TechCareerSQL
Sql Bootcamp
---
# Tour Company Projesi  
Bu doküman geliştirilecek Tour Company adlı uygulamanın analizini içermektedir. Projenin amacı turizm 
sektöründe hizmet veren Tour Company isimli firmanın organizasyonunu yönetebilmesidir. <br/>
Tour Company isimli şirket, İstanbul’un çeşitli yerlerini rehberler eşliğinde turistlere gezdiren ve tanıtan 
bir şirkettir. Düzenlediği turlar günübirlik turlardır. <br/>
Uygulama ile düzenlenen turlar belirlenecek, belirlenen turların satışı yapılabilecektir. Şirketle çalışan 
rehberler de uygulama üzerinde tanımlanabilecektir. <br/>
 
• Uygulamayı sadece şirket yetkilisi kullanacaktır. 
• Uygulama üzerinde tur şirketinin hizmet verdiği bölgeler tanımlanmalıdır. Şirket yetkilisi tur 
tanımlaması yaparken gezilecek bölgeleri seçecektir. 
• Şirket farklı kanallardan yaptığı satışları da uygulama üzerinden sisteme girecektir. 
• Turlara katılacak turistlerin bilgileri girilecek ve ardından fatura oluşturulacaktır. 
• Şirket tur satışını uygulamaya girerken çalıştığı rehberlerden birini seçecektir. 
 
Kullanım Senaryoları  
Tur Tanımlama 
Şirket yetkilisi tur tanımlaması yaparken, sistemde kayıtlı hizmet verdiği yerlerden en az 1, en fazla 3 
tanesini seçebilir. Tura bir isim vererek tanımlamayı tamamlar. Tur ismi en fazla 150 karakter olabilir. 
Tur tanımlayabilmek için önceden hizmet verdiği bölgeleri sisteme girmelidir. İlgili ekrandan bu girişleri 
yaparken bölgenin adını ve bu bölge için verilecek hizmetin ücretini belirtmelidir. Turun ücreti de içerdiği 
bölgelerin ücretlerinin toplamıdır. Bölge adı en fazla 30 karakter olmalıdır. Bölge ücreti de min 20 TL’dir. 
Şirket yetkilisi yeni bölgeler girebilir, olan bölgeleri silebilir. Ayrıca bölgeler için geçerli hizmet ücretlerini 
değiştirebilir. Satışı yapılmamış turlar üzerinde değişiklik yapabilir veya turu iptal edebilir. 
 
Tur Satışı Yapma 
Şirket yetkilisi ilgili ekran üzerinden tur satışlarını sisteme girmelidir. Satışı yapılan turu ve bu tura 
katılacak turisti/turistleri belirtmelidir. Turun gerçekleşeceği tarihi ve bu turda görevlendireceği rehberi 
de yine bu ekran üzerinden girmelidir. 
Turisti/turistleri belirtirken ad, soyad, cinsiyet, doğum tarihi, uyruk ve geldiği ülke bilgilerini girmelidir. 
Eğer daha önce de tur sattığı bir turistse, bu bilgileri tekrar girmemeli ve turisti sistemden bulup 
eklemelidir. 
Ad en fazla 20, soyad ise en fazla 40 karakter olmalıdır.  
 
Rehber Tanımlama 
Şirket çalıştığı rehberlerin kaydını sistemde tutacaktır. Şirket yetkilisi rehber ekleyebilir, rehber bilgilerini 
düzenleyebilir ve çalışmayı sonlandırdığı rehberi sistemden kaldırabilir. 
Rehber eklerken ad, soyad, cinsiyet, telefon numarası bilgilerini girmelidir. Rehberler en az bir yabancı dil 
bilmektedir ve sisteme eklenirken bu bilgi de tanımlanmalıdır. Rehberlerin hepsi hizmet verilen tüm 
bölgeler hakkında bilgi sahibidir. 
Rehberlerin adı en fazla 20, soyadı en fazla 40 karakter olmalıdır. 
 
Fatura Oluşturma 
Satış yetkilisi, turların satışını sisteme girdikten sonra satın alan turist için fatura oluşturacaktır. Bir turist 
aynı anda birden fazla tur satın alabilir. Bu durumda her tur satışı birer fatura kalemi olmalıdır. 
Fatura ücreti içerdiği turların toplam ücretidir. Turların ücreti belirlenirken katılacak turistlerden 60 yaş 
üzeri olanlar için %15 indirim uygulanır.  
Satış yetkilisi sistemde kayıtlı faturaları görüntüleyebilir. Fatura numarası, fatura kesilme tarihi, faturanın 
kesildiği turist ve toplam ücret bilgileri gösterilmelidir. Fatura numarası “FTR20220110001”, 
“FTR20220110002” şeklinde bir bilgidir. Yetkili istediği faturayı bu bilgi ile arayarak bulabilmelidir. 
 
Raporlar 
Şirket yetkilisi rapor ekranından aşağıda listelenen raporların sonucunu görmelidir. 
1. En çok gezilen yer/yerler neresidir? 
2. Ağustos ayında en çok çalışan rehber/rehberler kimdir/kimlerdir? 
3. Kadın turistlerin gezdiği yerleri, toplam ziyaret edilme sayılarıyla beraber listeleyin 
4. İngiltere’den gelip de Kız Kulesi’ni gezen turistler kimlerdir? 
5. Gezilen yerler hangi yılda kaç defa gezilmiştir? 
6. 2’den fazla tura rehberlik eden rehberlerin en çok tanıttıkları yerler nelerdir? 
7. İtalyan turistler en çok nereyi gezmiştir? 
8. Kapalı Çarşı’yı gezen en yaşlı turist kimdir? 
9. Yunanistan’dan gelen Finlandiyalı turistin gezdiği yerler nerelerdir? 
10.  Dolmabahçe Sarayı’na en son giden turistler ve rehberi listeleyin.
