library("Rlab")

#soal no 1 : Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya. 
#a) Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi ? (distribusi Geometrik)
x = 3
p = 0.20
paste("peluang : ", dgeom(x, p))

#b) mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
n = 10000
paste("mean : ", mean(rgeom(n, p) == 3))

#c) Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
paste("hasil dari poin a adalah nilai konstan 0.1024, sedangkan hasil dari poin b bernilai random atau selalu berubah-ubah namun selalu mendekati nilai dari poin a, kesimpulannya adalah mean dari distribusi geometrik yang menggunakan n data random akan berubah-ubah namun selalu mendekati nilai peluang distribusi geoemetriknya")

#d) Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama
hist(rgeom(n,p), col = blues9)

#e) Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.
mean = 1/p
varians = (1-p)/p^2
paste("µ  : ", mean)
paste("σ² : ", varians)

#******************************************************************

#soal no 2 : Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
#a) Peluang terdapat 4 pasien yang sembuh.
x = 4
n = 20
p = 0.2
paste("peluang : ", dbinom(x,n,p))

#b) Gambarkan grafik histogram berdasarkan kasus tersebut.
hist(rbinom(4,20,0.2), col = blues9)

#c) Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.
mean = n*p
varians = n*p*(1-p)
paste("µ  : ", mean)
paste("σ² : ", varians)

#******************************************************************

#soal no 3 : Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)
#a) Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
x = 6
λ = 4.5
paste("peluang : ", dpois(x,λ))

#b) simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)
n = 365
hist(rpois(n,λ), col = blues9)

#c) dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
paste("hasil dari poin a akan selalu bernilai konstan 0.128120143864584, sedangkan hasil dari poin b menunjukan sebaran nilai yang mendekati nilai λ dan apabila dicari meannya, hasilnya akan sama dengan λ, kesimpulannya adalah mean dari hasil sebaran data poin b akan sama dengan λ di poin a sehingga apabila dicari peluang distribusi poisson dari mean yang didapat dari poin b, hasilnya akan sama dengan poin a")

#d) Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
mean = λ
varians = λ
paste("µ  : ", mean)
paste("σ² : ", varians)

#******************************************************************

#soal no 4 : Diketahui nilai x = 2 dan v = 10. Tentukan:
#a) Fungsi Probabilitas dari Distribusi Chi-Square.
x = 2
v = 10
paste("pdf : ", dchisq(x,v))

#b) Histogram dari Distribusi Chi-Square dengan 100 data random.
n = 100
hist(rchisq(100,v,ncp=0), col = blues9)

#c) Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.
mean = v
varians = 2*v
paste("µ  : ", mean)
paste("σ² : ", varians)

#******************************************************************

#soal no 5 : Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan
#a) Fungsi Probabilitas dari Distribusi Exponensial 
λ = 3
paste(dexp(10,λ))

#b) Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
par(mfrow = c(2,2))
hist(rexp(10,λ), col = blues9)
hist(rexp(100,λ), col = blues9)
hist(rexp(1000,λ), col = blues9)
hist(rexp(10000,λ), col = blues9)

#c) Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
#petunjuk : Gunakan set.seed(1) ; Gunakan fungsi bawaan R
set.seed(1)
paste("rataan : ", mean(rexp(100,λ)))
set.seed(1)
paste("varian : ", var(rexp(100,λ)))

#******************************************************************

#soal no 6 : Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan
#a) Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
#keterangan : X1 = Dibawah rata-rata ; X2 = Diatas rata-rata
n = 100
µ = 50
sd = 8
paste("pdf : ", dnorm(n,µ,sd))
par(mfrow = c(1,1))
set.seed(1)
random <- rnorm(n,µ,sd)
x1 = floor(mean(random))
x2 = ceiling(mean(random))
z1 = (x1 - µ)/sd
z2 = (x2 - µ)/sd
paste("z1 : ", z1)
paste("z2 : ", z2)
plot(random, col="blue")

#b) Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan: NRP_Nama_Probstat_{Nama Kelas}_DNhistogram
par(mfrow = c(1,1))
hist(rnorm(n,µ,sd), breaks = 50, main = "5025211142_Mohammad Zhafran Dzaky_Probstat_A_DNhistogram", col = blues9)

#c) Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
set.seed(1)
paste("varian : ", var(rnorm(n,µ,sd)))
