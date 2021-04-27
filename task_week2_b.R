# Import library for load excel file
library(openxlsx)

# Load dataset
df1 <- read.xlsx("sekolah kota besar.xlsx")


# [1] Tampilkan sekolah di masing-masing jenjang
# Buat fungsi untuk membuat file excel
fungsi.jenjang <- function(var, tk, file_name){
  # Subsetting jenjang
  var = subset(df1, jenjang == tk)
  
  # Write variabel menjadi file excel
  write.xlsx(var, file_name)
  }
  

# jenjang SD
fungsi.jenjang(sd, 'SD', 'jenjang_sd.xlsx')
# jenjang SMP
fungsi.jenjang(smp, 'SMP', 'jenjang_smp.xlsx')
# jenjang SMA
fungsi.jenjang(sma, 'SMA', 'jenjang_sma.xlsx')
# jenjang SMK
fungsi.jenjang(smk, 'SMK', 'jenjang_smk.xlsx')
# jenjang SLB
fungsi.jenjang(slb, 'SLB', 'jenjang_slb.xlsx')
# jenjang SDLB
fungsi.jenjang(sdlb, 'SDLB', 'jenjang_sdlb.xlsx')
# jenjang SMPLB
fungsi.jenjang(smplb, 'SMPLB', 'jenjang_smplb.xlsx')
# jenjang SMLB
fungsi.jenjang(smlb, 'SMLB', 'jenjang_smlb.xlsx')
# jenjang SDTK
fungsi.jenjang(sdtk, 'SDTK', 'jenjang_sdtk.xlsx')
# jenjang SMPTK
fungsi.jenjang(smptk, 'SMPTK', 'jenjang_smptk.xlsx')
# jenjang SMPTK
fungsi.jenjang(smtk, 'SMTK', 'jenjang_smtk.xlsx')
# jenjang Satap
fungsi.jenjang(satap, 'Satap SD SMP SMA', 'jenjang_satap.xlsx')


# [2] Tampilkan jumlah sekolah berdasarkan provinsi 
group1 <- df1 %>% 
  # Grouping berdasarkan provinsi
  group_by(prov_) %>%
  # Hitung sekolah setiap provinsi
  summarise(jumlah_sekolah = n())
 

# [3] Tampilkan jumlah sekolah berdasarkan provinsi dan status sekolah
group2 <- df1 %>%
  # Grouping berdasarkan provinsi dan status sekolah
  group_by(prov_, status_sekolah) %>%
  
  # Hitung status sekolah setiap provinsi dan status sekolah
  summarise(jumlah_sekolah = n())
