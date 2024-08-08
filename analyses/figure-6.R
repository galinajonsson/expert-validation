# Load required package(s)
require(png)
# Load png picture files
A_urticae <- readPNG(source="../app_ExpertReviewForm/app_ExpertReviewForm/data/Aglais.urticae.png")
P_napi <- readPNG(source="../app_ExpertReviewForm/app_ExpertReviewForm/data/Pieris.napi.png")
P_rapae <- readPNG(source="../app_ExpertReviewForm/app_ExpertReviewForm/data/Pieris.rapae.png")
P_icarus <- readPNG(source="../app_ExpertReviewForm/app_ExpertReviewForm/data/Polyommatus.icarus.png")
M_jurtina <- readPNG(source="../app_ExpertReviewForm/app_ExpertReviewForm/data/Maniola.jurtina.png")

# create empty plot
plot(NA, xlim = c(0, 2.4), ylim = c(0, 5.5), main="Figure 6: Occupancy plots for the species with least plausible trends 1900-1976 ", cex.main=1, type = "n", xaxt = "n", yaxt = "n", xlab = "", ylab = "")
#Populate with png pics
rasterImage(A_urticae, 0, 3, 0.8, 5.5)
rasterImage(P_napi, 0.8, 3, 1.6, 5.5)
rasterImage(P_rapae, 1.6, 3, 2.4, 5.5)
rasterImage(P_icarus, 0, 0, 0.8, 2.5)
rasterImage(M_jurtina, 0.8, 0, 1.6, 2.5)
#add text
text(0.45,5.4, "Aglais urticae", cex=0.9, col="black", font = 3)
text(1.25,5.4, "Pieris napi", cex=0.9, col="black", font = 3)
text(2.05,5.4, "Pieris rapae", cex=0.9, col="black", font = 3)
text(0.45,2.5, "Polyommatus icarus", cex=0.9, col="black", font = 3)
text(1.25,2.5, "Maniola jurtina", cex=0.9, col="black", font = 3)