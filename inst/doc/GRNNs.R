## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(GRNNs)

## -----------------------------------------------------------------------------
data("met")
data("physg")

## ----eval = FALSE-------------------------------------------------------------
#  data("met")
#  data("physg")
#  results_kfold<-grnn.kfold(physg,met,10,"euclidean",scale=TRUE)

## ----eval = FALSE-------------------------------------------------------------
#  data("met")
#  data("physg")
#  best.spread<-findSpread(physg,met,10,"bray",scale=TRUE)

## -----------------------------------------------------------------------------
data("met")
data("physg")
best.spread<-c(0.33,0.33,0.31,0.34,0.35,0.35,0.32,0.31,0.29,0.35,0.35)
predict<-physg[1,]
physg.train<-physg[-1,]
met.train<-met[-1,]
prediction<-grnn(predict,physg.train,met.train,fun="euclidean",best.spread,scale=TRUE)

## -----------------------------------------------------------------------------
data("physg")
physg.train<-physg[1:10,]
physg.test<-physg[11:30,]
distance<-grnn.distance(physg.test,physg.train,"bray")

