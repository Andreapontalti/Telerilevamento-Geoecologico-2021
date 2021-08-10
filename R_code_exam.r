#Sunto dei codici R per esame di Telerilevamente geo-ecologico

# 1. remote sensing summary first code
# 2. R code time series second code
# 3. R code dopernicus third code
# 4. R code knit R fourth code
# 5. R code multivariat analysis fifth code 
# 6. R code classification sixth code
# 7. R code ggplot2 seventh code
# 8. R code vegetation index eighth code 
# 9. R code land cover ninth code
# 10. R code variability tenth code
# 11. Codici esame Telerilevamento

----------------------------------------------------------------------
#### # 1. remote sensing summary first code


install.packages("raster")
#PERMETTE DI INSTALLARE PACCHETTI FUNZIONALI A VARI CODICI SU R. BISOGNA SEMPRE INSERIRE VIRGOLETTE IN QUANTO L'AZIONE NECESSITA DI USCIRE DAL SERVER

library(sp)
#PERMETTE DI ANDARE A PESCARE E ABILITARE IL PACCHETTO SULLA SCHERMATA ATTUALE DI R

setwd("C:/lab/") 
#CON QUESTA FUNZIONE SI SCEGLIE LA WORKING DIRECTORY, CHE IN QUESTO CASO SARà SETTATA ALL'INTERNO DELLA CARTELLA LAB

p224r63_2011 <- brick("p224r63_2011_masked.grd") 
#INSERISCE IL FILE .GRD SU R; TRAMITE LA FRECCIA SI PUò DECIDERE COME SOPRANNOMINARE IL FILE PER RICHIAMARLO IN ALTRE FUNZIONI, IN QUESTO CASO SI CHIAMA "p224r63_2011"

plot(p224r63_2011) 
#PERMETTE DI VISUALIZZARE (PLOTTARE) IL FILE .GDR INSERITO SU R. 7 MAPPE VENGONO VISUALIZZATE, CON BANDE DI COLORE DIVERSE


cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(p224r63_2011, col=cl)
#PERMETTE DI CAMBIARE LA VARIETà DI COLORI DELLE MAPPE VISUALIZZATE. DOPO AVER DECISO I COLORI BASTA RIPLOTTARE IL FILE .GDR INSERENDO LE VARIABILI "col"

dev.off()
#PERMETTE DI CHIUDERE LE FUNZIONI ATTIVE

plot(p224r63_2011$B1_sre)     
#PLOTTAGGIO DI UNA DETERMINATA BANDA DI COLORE USATA. VIENE VISUALIZZATA UNA SOLA MAPPA, DELLE 7 INIZIALI, OSSIA LA "B1_sre", VISTA TRAMITE LA LUCE BLU

# ALTRE POSSIBILI TIPOLOGIE DI BANDA
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

cl <- colorRampPalette(c("red", "pink", "light blue")) (100)
plot (p224r63_2011, col=cl)
#ALTRO CAMBIO DELLA VARIETà DI COLORI VISUALIZZATI NELLE 7 MAPPE. iN QUESGTO CASO LE MAPPE RISULTANO DELLE SFUMATURE DI ROSSO E ROSA


par(mfrow=c(4,2))      #4=RIGHE 2=COLONNE
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)
# PLOTTA LE PRIME QUATTRO BANDE DEI DATI LANDSAT

par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)
#ALTRO PLOTTAGGIO IN GRUPPO, MA CON ORDINAMENTO DIFFERENTE
    
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb) 
clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)
#ALTRO PLOTTAGGIO IN GRUPPO, CON LE TRE MAPPE INIZIALI CON COLORI MODIFICATI (LA PRIMA CON SFUMATURE DI BLU, L'ALTRA DI VERDE)


plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")   #VISUALIZZA LA MAPPA CON COLORI SCHEMA-RGB (SI DECIDE IL LIVELLO DI ROSSO, BLU E VERDE NELLA FOTO)
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")    #VISUALIZZA LA MAPPA CON COLORI RGB, MA CON SCHEMA DIFFERENTE (COLORE MOLTO PIU ROSSO)(lunghezze d'onda "sballate", non visibili per noi ad occhio nudo)
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")    #SCHEMA RGB PIU VERDE. DISCRIMINA MEGLIO LE ZONE FORESTALI


par(mfrow=c(2,2))  
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
#SOLITA FUNZIONE PAR() CHE PERMETTE DI VEDERE I TRE PLOT ASSIEME

pdf("il_mio_primo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
#PERMETTE DI CREARE UN PDF NELLA CARTELLA LAB (NOMINATO "il_mio_primo_pdf_con_R.pdf") CHE MOSTRA LE TRE IMMAGINI CON CHEMI RGB ASSIEME


plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")   
#VISUALIZZAZIONE IMMAGINE "LINEARE", MENO DETTAGLIATA

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")  
#VISUALIZZAZIONE A ISTOGRAMMA, CON COLORI MOLTI PIù DETTAGLIATI (SI DISTINGUONO VARI SOTTO HABITAT IN MANIERA PIU DISCRIMINANTE)


par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")
# FUNZIONE PAR CON 3 MAPPE CON SCHEMA RGB CON COLORE NATURALE, FALSI COLORI E FALSI COLORI CON LO STRETCH ISTOGRAMMA 

install.packages("RStoolbox") 
library(RStoolbox)
#INSTALLAMENTO DI NUOVO PACCHETTO (per l'elaborazione e l'analisi delle immagini di telerilevamento come il calcolo degli indici spettrali, unsupervised classification, etc.)

p224r63_1988 <- brick("p224r63_1988_masked.grd")     
#CARICAMENTO SU R DI NUOVO FILE

plot(p224r63_1988)
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")  
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
#FUNZIONI PAR SIMILI A QUELLE EFFETTUATE CON IL PRIMO FILE .GDR 

par(mfrow=c(2,1))                                      
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")    
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")   


par(mfrow=c(2,2)) 
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")     #hist=histoogramma
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")     #altri codici per comparare le mappe 1988 e 2011
#CONFRONTO FRA L'IMMAGINE DEL 1998 E DEL 2011 TRAMITE LE DUE FUNZIONI PAR SOPRASTANTI CON PIU O MENO IMMAGINI E VARIABILI MODIFICATE

pdf("il_mio_secondoo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")     #hist=histoogramma
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
#CREAZIONE DI NUOVO PDF NELLA CARTELLA LAB

#--------------------------------------------------------------------------------------------------------
####### 2. R code time series second code
#DATI E CODICI A CURA DI Emanuela Cosma


library(raster)
setwd("C:/lab/greenland")
library(raster)
library(RStoolbox)
install.packages("rasterVis")    #INSTALLAZIONE NUOVO PACCHETTO CHE PERMETTE DI OTTIMIZZARE LA VISUALIZZAZIONE DEI DATI RASTER
library(rasterVis) 
#LA WORKING DIRECTORY è IMPOSTATA NELLA CARTELLA GREENLAND, ALL'INTERNO DELLA CARTELLA LAB

lst_2000 <- raster("lst_2000.tif")   #(per importare il dataset su R)
plot(lst_2000)                    #(per plottare e far comparire l'immagine)
lst_2005 <- raster("lst_2005.tif")    
plot(lst_2005) 
lst_2010 <- raster("lst_2010.tif")    
plot(lst_2010) 
lst_2015 <- raster("lst_2015.tif")    
plot(lst_2015) 
#FUNZIONI PER IMPORTARE E POI PLOTTARE LE IMMAGINI TIF SULLA GROENLANDIA

par(mfrow=c(2,2))    
plot(lst_2000)  
plot(lst_2005) 
plot(lst_2010) 
plot(lst_2015) 
#PLOTTA LE 4 IMMAGINI ASSIEME

rlist <- list.files(pattern="lst")     #PERMETTE DI CREARE UNA LISTA DI FILE(SONO RAGGRUPATI IN QUESTO CASO TUTTI I FILE LST)
rlist                                     #MOSTRA I FILE INSERITI NELLA LISTA SULLA SCHERMATA DI R
import <- lapply(rlist,raster)                 #IMPORTA SINGOLARMENTE I FILE CONTENUTO IN RLIST
import                                 #MOSTRA INFO SUI FILE IMPORTATI
TGr <- stack(import)                  #METTE ASSIEME TTUTTI I FILE SOTTO IL NOME DI "TGr"
plot(TGr)         #PLOTTA LA LISTA DI FILE                    


plotRGB(TGr, 1, 2, 3, stretch="Lin")             #UNISCE LE PRIME TRE MAPPE DI TGr USANDO UNA SCALA RGB


rlist <- list.files(pattern="lst")
rlist
import <- lapply(rlist,raster)
import
TGr <- stack(import)
levelplot(TGr) #CON IL LEVEL PLOT SI VISUALIZZANO COLORI MOLTO PIU DETTAGLIATI RISPETTO AD UN NORMALE PLOT E INOLTRE SONO INSERITI I PLOT DI CONTORNO
TGr
#COMANDI DI BASE PER EFFETTUARE LA CREAZIONE, IMPORTAZIONE E VISUALIZZAZIONE DI UNA LISTA DI FILE SU R, COME GIA VISTO NELL'ESEMPIO PRECEDENTE

levelplot(TGr$lst_2000)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr, col.regions=cl)
#VISIONE DELLA LISTA TRAMITE SCELTA DEI COLORI RampPalette

meltlist <- list.files(pattern="melt")
melt_import <- lapply(meltlist,raster)
melt <- stack(melt_import)
melt
#FUNZIONI PER EFFETTUARE IL MELTING, OSSIA LA FUSIONE DELLA LISTA DEI FILE
levelplot(melt)

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
#PERMETTE DI SOTTRARRE I COLORI DELLA MAPPA x CON MAPPA y 

clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)
#CAMBIO COLORI RampPalette DEL MELT

levelplot(melt_amount, col.regions=clb)
#MOSTRA I PIU LIVELLI DEI PLOT
#-----------------------------------------------------------------------------------------------------------
#################################### 3. R code dopernicus third code


install.packages("ncdf4")   #bisogna installare prima sto pacchetto
library(ncdf4)
library(raster)    #ci serviranno la libreria Raster per leggere i raster come sempre, ma anche la libreria NCD per leggere i file ncd; non serve mettere le "" perché il file ncdf4 è già stato installato
setwd("C:/lab/")

lswt <- raster("c_gls_LSWT_202104010000_GLOBE_SLSTRAB_v1.1.0.nc")  #caricamento di un nuovo file .nc su R
lswt      #permette di avere info sul file caricato

cl <- colorRampPalette(c('light blue','green','red','yellow'))(100)
plot(lswt, col=cl)
lswt <- raster::reclassify(lswt, cbind(252:255, NA), right=TRUE) #permette di riclassificare i colori dell'immagine

lswtres <- aggregate(lswt, fact=100)#QUESTA FUNZIONE MODIFICA LA QUANTITA DI PIXEL/RISOLUZIONE DELL'IMMAGINE (RICAMPIONAMENTO), PER RIDURRE ANCHE IL PESO DEL FILE CHE IN QUESTO CASO è MOLTO PESANTE
#quel 100 corrisponde al numero di celle raggruppate per formare delle mega-celle più grandi. Con 50 si diminuisce di 2500 volte la risoluzione

plot(lswtres, col=cl) #plottaggio nuovi colori

albedo <- raster("albedobello.nc")     
#CARICAMENTO DI UN SINGOLO LAYER SU R (SE SE NE FOSSE USATO PIU DI UNO SI AVREBBE USATO LA FUNZIONE "BRICK" e non "RASTER")

cl<-colorRampPalette(c('light blue', 'green', 'red'))(100)
plot(albedo, col=cl)  #PLOTTA L'IMMAGINE DELL'ALBEDO PRESO DA COPERNICUS

albedores <- aggregate(albedo, fact=100) #effettuiamo un ricampionamento come si era fatto con "lwst", per ridurre la pesantezza del file "albedo"
plot(albedores, col=cl) #plottaggio della immagine ricampionata
#----------------------------------------------------------------------------------------------------------------------------------




################ 4. R code knit R fourth code

setwd("C:/lab/")   #vuol dire SET WORKING DIRECTORY
install.packages("knitr")   ##pacchetto da scaricare. Permette di usare le funzioni e codici knit R

library(knitr)   
library(raster)
library(rasterVis)    ###apriamo le librerie che ci serviranno per usare le prossime funzioni

require(knitr) #funzione analoga a library
stitch("R_code_greenland.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))   #crea automaticamente un report basato su uno script di R e un template

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

################ 5. R code multivariat analysis fifth code

setwd("C:/lab/")
library(raster)    #inseriamo le librerie necessarie
library(RStoolbox) 

#### LAVORIAMO CON LE IMMAGINI DELL'AMMAZZONIA
#Si possono vedere file/immagini con diversa varianza/variabilità utilizzando delle funzioni. Queste prendono il nome di ANALISI MULTIVARIATE
p224r63_2011 <- brick("p224r63_2011_masked.grd")  #brickiamo come solito per caricare l'immagine
plot(p224r63_2011)  #solita funzione che permette di plottare l'immagine

plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)  #plottiamo in una banda 1 e 2 la foto. Uscirà un piano cartesiano XY con una scia di punti che studiano la varianza dei colori
pairs(p224r63_2011)  #mette in correlazione tutte le variabili (ossia le bande) della figura. Ne esce un insieme di diagrammi e numeri

pairs(p224r63_2011)  #MOSTRA LO SCHEMA VISTO NELL'ESERCIZIO PRECEDENTE, con indici di correlazione e variazione vari
p224r63_2011res <- aggregate(p224r63_2011, fact=10)  #aggrega i pixel per diminuire la risoluzione della mappa( ma almeno puoi usare R senza aspettare 5 ore che il pc carica)


par(mfrow=c(2,1))            #questo serviva per aprire più immagini in una singola icona/mappa, non so se ti ricordi dai plot preedenti
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")        #le plottiamo usando i colori RGB
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="lin")  


p224r63_2011res_pca <- rasterPCA(p224r63_2011res)    #dovrebbe generare una nuova immagine tramite questa funzione
summary(p224r63_2011res_pca$model)   #spiega quasi la totalità della varianza in questo modello (è praticamente un riassunto)
p224r63_2011res_pca  
plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="lin")  #plottaggio con colori RGB
plot(p224r63_2011res_pca$map$PC1,p224r63_2011res_pca$map$PC2)  #plotaggio della banda PC1 rispetto alla banda PC2 

str(p224r63_2011res_pca)  #visualizza in modo compatto la struttura di un oggetto R arbitrario
#-------------------------------------------------------------------------------------------------------------------------



###### 6. R code classification sixth code



setwd("C:/lab/")
library(raster)
library(RStoolbox)

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")     #brick serve per pescare un'immagine (o comunque un pacchetto di dati) esterna e inserirla all'interno a R (e gli da anche un nome più semplificato che decidiamo noi usando sta freccia)
plot(so) #plotta normalmente l'immagine
plotRGB(so, 1, 2, 3, stretch="lin")     #plotta in base ai colori RGB
plotRGB(so, 1, 3, 2, stretch="lin")

   #UNSUPERVISED CLASSIFICATION: Tecnica che consiste nel fornire al sistema informatico una serie di input che egli riclassificherà ed organizzerà sulla base di caratteristiche comuni per cercare di effettuare ragionamenti e previsioni sugli input successivi
   #permette di classificare ad esempio quando una determinata patch del suolo risulta essere X (es. acqua) o Y (es. bosco)

soc <- unsuperClass(so, nClasses=3)  #creiamo una unsupervised classification con 3 classi di colore. il risultante si chiamerà "soc"
plot(soc$map)   #plottiamo "soc"
set.seed(16)
soc <- unsuperClass(so, nClasses=5) #ora lo stesso, ma con 5 classi di colore

#Unsupervised classification però con 20 classi
socca <- unsuperClass(so, nClasses=20)    #uso socca e non soc perché se no mi autoelimina quella con 3 classi
plot(socca$map)

######PROVIAMO QUESTA NUOVA FUNZIONE CON IL FILE DEL GRAN CANYON, SCARICATO DA VIRTUALE.UNIBO

gc <- brick("gran_canyon.jpg")   #brickiamo l'immagine del gran canyon e chiamiamola gc
plotRGB(gc, r=1, g=2, b=3, stretch="lin")  #modifichiamo un po' lo stretch dei colori
plotRGB(gc, r=1, g=2, b=3, stretch="hist") #qui usiamo lo stretch modalità istogramma
gc2 <- brick("canyon.jpg")
plotRGB(gc2, r=1, g=2, b=3, stretch="lin")  #modifichiamo un po' lo stretch dei colori
plotRGB(gc2, r=1, g=2, b=3, stretch="hist") #qui usiamo lo stretch modalità istogramma (sembra più scura, c'è più contrasto)

gcc2 <- unsuperClass(gc2, nClasses=2)  #funzione utilizzata per classificare i colori in due classi (in questo caso)
plot(gcc2$map)
gcc4 <- unsuperClass(gc, nClasses=4)  #qui classifica su 4 classi
plot(gcc$map)


#-------------------------------------------------------------------------------------------------------------------------------------------------


################ 7. R code ggplot2 seventh code

setwd("C:/lab/")
library(raster)
library(rasterVis)
library(rasterdiv)
library(RStoolbox) #solito settaggio della working directory e inserimento di library necessarie 

plot(copNDVI)  #fa vedere l'intero globo con un indice di copertura forestale

copNDVI <- reclassify(copNDVI, cbind(253:255, NA))   #permette di togliere la massa d'acqua blu dalla mappa originale
plot(copNDVI)    #mostra l'indice di vegetazione boschiva ma senza il macchione blu degli oceani e mari

levelplot(copNDVI)   #con questa mappa si denotano le zone più desertiche/senza vegetazione e più vegetate, usando come indice il livello di evotraspirazione (che sarà alto in ambienti vegetati e nullo in ambienti desertici)


install.packages("ggplot2")   #INSTALLAZIONE NUOVO PACCHETTO. PERMETTE DI USARE LE FUNZIONI GGPLOT
library(ggplot2)

defor1 <- brick("defor1.png")   #inseriamo con brick l'immagine defor1 (con sempre segnata anche la sua estensione, in questo caso png)
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

defor2 <- brick("defor2.png") 
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")   #inserisce le coordinate nell'immagine plottata

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

install.packages("gridExtra")   #INSTALLAZIONE NUOVO PACCHETTO (per lavorare/creare griglie, grafici e tabelle)
library(gridExtra)

# multiframe with ggplot2 and gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")     #mette le due immagini assieme con le griglie e ordinate in maniera differente
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)


#---------------------------------------------------------------------------------------------------------------------------------------------------
################### 8. R code vegetation index eighth code

install.packages("rasterdiv")
 #uso della riflessione della luce per capire l'indice di vegetazione di una determinata foto (si può estrapolare il tipo di vegetazione, lo status della vegetazione, etc)
 #In un pixel di vegetazione avremo il massimo di riflettanza nell'infrarosso vicino, mentre avremo il minimo di riflettanza nel rosso (ricontrolla sta roba perché non ho capito nulla)
 #massimo = 255   minimo = 0
 
setwd("C:/lab/")
library(raster)
library(RStoolbox)
defor1 <- brick("defor1.png")   #carichiamo le due immagini con i seguenti nomi
defor2 <- brick("defor2.png")
 
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")    #plotta le due immagini assieme con i colori RGB

unione <- defor1$defor1.1 - defor1$defor1.2   #in questo mdo vediamo lo stato della vegetazione della prima foto

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme  #scegliamo un colore un po' più roffo
plot(unione, col=cl)  


plot(unione, col=cl, main="nome codice generico")   
dvi2 <- defor2$defor2.1 - defor2$defor2.2  #mostra stato della vegetazione, ma della seconda mappa
plot(dvi2, col=cl, main="DVI at time 2")


    
par(mfrow=c(2,1))
plot(unione, col=cl, main="DVI at time 1")   #uniamo come solito le due mappe per compararle
plot(dvi2, col=cl, main="DVI at time 2")

difdvi <- unione - dvi2    #unisce le due mappe per compararle meglio

dev.off()        #facciamo dev.off per "riordinare" la mappa
cld <colorRampPalette(c('blue','white','red'))(100)   #qua decidiamo i colori come solito da usare nel plottaggio della mappa susseguente
plot(difdvi, col=cld)    #vabbè insomma, plottiamo come sempre


#COME SI CALCOLA IL DVI(difference vegetation index)? si fa (NIR-RED)/(NIR+RED). Lo scriviamo in questa maniera:
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1, col=cl) 


ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)    #creiamo un'altro DVI, per la seconda immagine però (quindi la defor2)
plot(ndvi2, col=cl) 

vi <- spectralIndices(defor1, green = 3, red = 2, nir = 1)   #con questo escono fuori vari indici spettrali  (15 in totale)
plot(vi, col=cl)


vi2 <- spectralIndices(defor2, green = 3, red = 2, nir = 1)  #facciamo la stessa roba come al solito con l'altra mappa, quindi defor2
plot(vi2, col=cl)

difndvi <- ndvi1 - ndvi2
dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)             #sottriamo i colori delle due mappe ndvi1 e ndvi2. La risultante sarà una mappa con macchié più rosse nelle zone più deforestate


#---------------------------------------------------------------------------------------------------------------------------------------------------------




######## 9. R code land cover ninth code

###### IMMAGINI AMAZZONIA

library(raster)
library(RStoolbox) 
library(ggplot2)
library(gridExtra)
setwd("C:/lab/") #inserimento delle appostie library e working directory

defor1 <- brick("defor1.png")
defor2 <- brick("defor2.png")
d1c <- unsuperClass(defor1, nClasses=2)  #mostra inidice vegetazionale, suddiviso in 2 classi
plot(d1c$map)

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)
#stessa funzione di quella precedente ma con l'immaigne "defor2"


freq(d1c$map)  #calcola la frequenza fra la prima e la seconda classe fra le due immagini (in questo caso, la frequenza totale di foreste è molto alto rispetto al resto (se si somano i due valori si raggiungono le dimensioni totali dell'immagine)
s1=341292   #s è la dimensione
 
freq(d2c$map) 
s2=342726   

s1 <- 341292 
prop1 <- freq(d1c$map) / s1
s2 <- 342726
prop2 <- freq(d2c$map) / s2   #in questo modo, abbiamo proporzionato i valori dimesnionali, in modo da essere più accurati e avere dati simili


#CON I SEGUENTI CODICI E FUNZIONI SI VUOLE CREARE UNA TABELLA/DATASET PER PARAGONARE I DATI PRE-DEFORESTAZIONE E POST-DEFORESTAZIONE
cover <- c("forest", "agriculture")
percent_1992 <- c(89.83, 10.16)  #qui inseriamo i valori dei dati che abbiamo recuperato da prop1
percent_2006 <- c(52.06, 47.93)  #stesso processo ma con prop2
percentages <- data.frame(cover, percent_1992, percent_2006) #crea una tabella raggruppando in questo caso i dati di cover, percent_1992 e percent_2006
percentages

#SI USA GGPLOT PER CREARE UNA RAPPRESENTAZIONE ILLUSTRATIVA DEL DATO
par(mfrow=c(1,2))
p1 <- ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
#ora scrivendo "p1" o "p2" ci verranno fuori dei grafici a barre con le percentuali di land cover

grid.arrange(p1, p2, nrow=1)  #con questa funzione si vedono i due grafici a barre assieme  #NON SI USA PAR PERCHE ESSO FUNZIONA PER I PLOT
 

###Ggplot, ndvi & CO con le immagini Sentinel

setwd("C:/lab/")
library(raster)
library(RStoolbox)
sent <- brick("sentinel.png") #carichiamo l'immagine png di Sentinel su R

plotRGB(sent) #con questo codice si vede l'immagine sentinel con colori di default (=di partenza)
plotRGB(sent, stretch="Lin")
plotRGB(sent, r=2, g=1, b=3, stretch="lin")  #colorata in modo da distinguere bene le praterie, i boschi e i laghi
 
##NDVI= (Nero Infra Red - Red)/(Nero Infra Red + Red)

nir <- sent$sentinel.1   #creazione dei due oggetti nir e red
red <- sent$sentinel.2

ndvi <- (nir-red) / (nir+red)  #il dato risultante è l'indice di vegetazione
plot(ndvi) #plottiamo la mappa ndvi

Similaun <- colorRampPalette(c('black','white','red', 'magenta','green'))(100) #cambiamo la colorazione rampalette di ndvi
plot(ndvi, col=Similaun)    

ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd) #formula per calcolare la deviazione standard della immagine
plot(ndvisd3)  

clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(ndvisd3, col=clsd)   #cambiamo i colori di base; la deviazione standard è più omogenea  nelle praterie alpine e foreste, mentre possiede valori più alti nelle zone rocciose (che sono molto più variabili)

# mean ndvi with focal
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #qua inseriamo un sacco di colori per distinguere bene la la deviazione standard media dell'NDVI
plot(ndvimean3, col=clsd)

ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvisd5, col=clsd)             #con questa funzione si allarga la dimensione dei quadrati, quindi si avranno informazioni più facili da caricare ma meno precise

sentpca <- rasterPCA(sent)   #analizza la componente princiapale del raster
plot(sentpca$map)
summary(sentpca$model)   #mostra il sommario dei dati della mappa sentpca

######altro progetto con immagini da Sentinel

sent <- brick("sentinel.png")  #caricamento dell'immagine su R
sentpca <- rasterPCA(sent)   #mostra le 4 mappe con la metodologia pca (che serviva per notare il livello di variabilità) #Calculates R-mode PCA for RasterBricks or RasterStacks and returns a RasterBrick with multiple layers of PCA scores.
plot(sentpca$map)
summary(sentpca$model)

pc1 <- sentpca$map$PC1
 
Up <- focal(pc1,  w=matrix(1/25, nrow=5, ncol=5), fun=sd)     #Cacola i "valori focali" (moving window) utilizzando una matrice
Kek <- colorRampPalette(c('light blue','dark green','pink','magenta','orange','yellow','red'))(100) #si effetua lo studio della deviazione standard come negli scorsi esercizi e decidiamo colore e altre variabili della mappa risultante
plot(Up, col=Kek) 


# NB: c'è un modo per salvare un codice di R che possiamo poi riutilizzare o "regalare" a qualcuno. Scarichiamo il file R da virtuale e salviamolo in LAB. 
source("source_test_lezione.r")  #usando questa funzione R va a pescare quel file col codice R e lo plotta tutto ue se brav l m' guaglione

install.packages("viridis")
library(viridis)     #nuovo pacchetto necessario per i seguenti processi/funzioni

ggplot() + geom_raster(Up, mapping = aes(x = x, y = y, fill = layer))    #la funzione crea una mappa di calore, con le due variabili x e y ma anche una terza variabile che è il colore 

ggplot() + geom_raster(Up, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis()            #aggiunge la colorazione gialla nella mappa

ggplot() + geom_raster(Up, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis()  + ggtitle ("Standard deviation of PC1 by viridis colour scale")   #altra tipologia di sfumatura con un'altra legenda di colori
ggplot() + geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) + scale_fill_viridis(option ="magma")  + ggtitle("Standard deviation of PC1 by viridis colour scale")
#Altre colorazioni per la mappa a tre variabili


#-------------------------------------------------------------------------
############ 10. R code variability tenth code

setwd("C:/lab/EN")
library(raster)
# 2. Import the first image (single band)
# we will select band 1, but the raster function enables to select other single-bands
# [suggerimento studenti]
# https://www.rdocumentation.org/packages/raster/versions/3.4-10/topics/raster


EN01 <- raster("EN_0001.png")
 
cls <- colorRampPalette(c("red","pink","orange","yellow")) (200)
plot(EN01, col=cls)

par(mfrow=c(3,1))
plot(EN01, col=cls, main="NO2 in January")
plot(EN13, col=cls, main="NO2 in March")
plot(ENdif, col=cls, main="Difference (January - March)")

# list of files:
rlist <- list.files(pattern="EN")
rlist

import <- lapply(rlist,raster)
import  #importa le suddette foto e mostra varie info su di esse quali la classe, la banda, dimensioni, origine, etc.

EN <- stack(import)
plot(EN, col=cls)   #mostra TUTTE le immagini che sono state importate dalla lista creata


# 8. Replicate the plot of images 1 and 13 using the stack
par(mfrow=c(2,1))
plot(EN$EN_0001, col=cls)
plot(EN$EN_0013, col=cls)
 
##Lezione 16 giugno

setwd("C:/lab/")
library(raster)
library(rgdal)
library(ggplot2)
defor2 <-brick("defor2.png")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

library(rgdal) #nuova library 
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")  #Funzione CLICK: permette di inserire dei punti sulla mappa (si può scegliere  il colore, inserire la posizione, e numerazione del punto su R )

plotRGB(defor2, r=1, g=2, b=3, stretch="hist")
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow") 


##coi seguenti formule, si definiscono le colonne del dataset
 band<- c(1,2,3)
forest <- c(206,6,19)
water <- c(40,99,139)
spectrals <- data.frame(band, forest, water) #crea un nuovo dataframe

ggplot(spectrals, aes(x=band)) + 
geom_line(aes(y=forest), color="green") #plotta in maniera personalizzata le firme spettrali (in questo caso, mostrando forest e band)

ggplot(spectrals, aes(x=band)) +
 geom_line(aes(y=forest), color="green") +
 geom_line(aes(y=water), color="blue") 

defor1 <- brick("defor1.png")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="yellow")

band <- c(1,2,3)
time1 <- c(223,11,33)
time2 <- c(197,163,151)
spectralst <- data.frame(band, time1, time2)

ggplot(spectrals, aes(x=band)) +
 geom_line(aes(y=time1), color="red") +
 geom_line(aes(y=time2), color="gray") +
 labs(x="band",y="reflectance")


band <- c(1,2,3)
time1 <- c(223,11,33)
time1p2 <- c(218,16,38)
time2 <- c(197,163,151)
time2p2 <- c(149,157,133)
spectralst <- data.frame(band, time1, time2, time1p2, time2p2)

ggplot(spectralst, aes(x=band)) +
 geom_line(aes(y=time1), color="red") +
 geom_line(aes(y=time1p2), color="red") +
 geom_line(aes(y=time2), color="gray") +
 geom_line(aes(y=time2p2), color="gray") +
 labs(x="band",y="reflectance")


#------------------------------------------------------------------------------------------------
###################### 11. Codici esame Telerilevamento

library(raster)
library(RStoolbox) 
library(ggplot2)
library(gridExtra)
setwd("C:/lab/Aral") #settaggio come nostro solito della working directory e caricamento delle 4 library necessarie al funzionamento dei codici seguenti

a2001 <- brick("Aral2001.jpg")
a2004 <- brick("Aral2004.jpg")
a2008 <- brick("Aral2008.jpg")
a2012 <- brick("Aral2012.jpg")
a2014 <- brick("Aral2014.jpg")
a2018 <- brick("Aral2018.jpg")  #tramite funzione brickk carichiamo le 6 immagini su R con i suddetti nomi


Aral1 <- unsuperClass(a2001, nClasses=3)  
Aral2 <- unsuperClass(a2004, nClasses=3)  
Aral3 <- unsuperClass(a2008, nClasses=3)  
Aral4 <- unsuperClass(a2012, nClasses=3)  
Aral5 <- unsuperClass(a2014, nClasses=3)  
Aral6 <- unsuperClass(a2018, nClasses=3) #effettuiamo una categorizzazione in classi di colore per distinguere le zone con acqua, senza acqua e "altro"

plot(Aral1$map)
freq(Aral1$map)   #-> evaporated lake=140829  lake= 64533
plot(Aral2$map)
freq(Aral2$map)  #-> evaporated lake=151362  lake= 54327
plot(Aral3$map)
freq(Aral3$map)  #-> evaporated lake=176433  lake= 28463
plot(Aral4$map)
freq(Aral4$map)  #-> evaporated lake=171295  lake= 33566
plot(Aral5$map)
freq(Aral5$map)  #-> evaporated lake=180212  lake= 25097
plot(Aral6$map)
freq(Aral6$map)  #-> evaporated lake=172939  lake= 32383
AreaTOT=336015 #Somma superficie                 #troviamo la frequenza totale (=area totale) delle 3 classi di colore (che sarà ovviamente uguale in tutte le immagini in quanto sono della stessa dimensione) tramite la funzione freq


prop1 <- freq(Aral1$map)/ AreaTOT
prop2 <- freq(Aral2$map) / AreaTOT
prop3 <- freq(Aral3$map) / AreaTOT
prop4 <- freq(Aral4$map) / AreaTOT
prop5 <- freq(Aral5$map) / AreaTOT
prop6 <- freq(Aral6$map) / AreaTOT    #mettiamo in proporzione le frequenze per trovare dei valori in percentuale

#####calcolo le percentuali relative dell'area del solo Lago aral, escludendo la classe di colore di contorno 

Water_Percentage= c(31.3, 26.4, 14.2, 16.7, 12.2, 15.8)
No_water_Percentage= c(68.7, 73.6, 85.8, 83.3,87.8, 84.2)
Year= c(2001, 2004, 2008, 2012, 2014, 2018)     #caricamento dei dati ritrovati e già posseduti su R
datiacqua <- data.frame(Year, Water_Percentage, No_water_Percentage)  #creazione di una tabella coi dati prima inseriti

ggplot(datiacqua, aes(x=Year)) +
 geom_line(aes(y=Water_Percentage), color="blue")   #crea un grafico riguardante l'andamento in percentuale della superficie inondata del lago, con una linea blu
  
ggplot(datiacqua, aes(x=Year)) +
 geom_line(aes(y=No_water_Percentage), color="brown") #crea un grafico riguardante l'andamento in percentuale della superficie non più inondata del lago, con una linea marrone
  
