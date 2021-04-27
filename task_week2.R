# Import library for load excel file
library(openxlsx)

# Load dataset
df <- read.xlsx("Sekolah Tangsel.xlsx")

# [1] Slicing kolom npsn,nama_sp,alamat_jalan,desa_kelurahan,kec,prov,jenjang,status_sekolah menggunakan index kolom
sekolah <- df[,c(1,2,3,4,5,7,8,9)]

# Print variabel sekolah
print(sekolah)


# [2] Tampilkan jumlah seluruh sekolah  yang jenjang SMP status sekolah NEGERI dan SWASTA   
sekolah1 <- subset(sekolah, jenjang == 'SMP')
# Print variabel sekolah1
print(sekolah1)

# Hitung jumlah sekolah jenjang SMP 
jml_sekolah <- length(sekolah1$nama_sp)

# Print jumlah sekolah SMP
print(paste("Jumlah sekolah SMP = ", jml_sekolah))


# [3] Tampilkan data berbentuk file excel siswa yang beragama BUDHA di SD dan SMA di KEC PAMULANG
sekolah2 <- subset(df, pd_agama_budha > 0 & jenjang == c('SD', 'SMA') & kec_ == 'Kec. Pamulang')

# Slicing kolom npsn, nama_sp, pd_agama_budha, prov_
sekolah2 <- sekolah2[,c("npsn", "nama_sp", "pd_agama_budha", "prov_")]

# Print variabel sekolah2
print(sekolah2)


# [4] Data sekolah swasta di Kec. Serpong
sekolah3 <- df[df$status_sekolah == 'Swasta' & df$kec_ == 'Kec. Serpong', ]

# Summary sekolah swasta di Kec. Serpong 
summary(sekolah3)


# [5] Data sekolah dengan daya listrik < 2200, di wilayah terpencil, status sekolah negeri dan waktu pelenggaraan pagi 
sekolah4 <- subset(df, daya_listrik < 2200 & wilayah_adat_terpencil == 'Ya' & status_sekolah == 'Negeri' & waktu_penyelenggaraan  == 'Pagi')

# Print variabel sekolah4
print(sekolah4)


# [6] Jumlah SMK dengan SK IZIN OPERASIONAL yang masih belum ada  
sekolah5 <- subset(df, sk_izin_operasional == '-' & jenjang == 'SMK')

# Hitung SMK dengan SK IZIN OPERASIONAL belum ada
jml_sekolah_smk <- length(sekolah5$nama_sp)

# Print jumlah SMK 
print(paste("Jumlah SMK yang belum mempunyai SK IZIN OPERASIONAL = ", jml_sekolah_smk))

