import Data.List
coinSumTuples =length $ nub $ [(a,b,c,d,e,f,g,h) | a <- [0..200],b<-[0..100],c<-[0..40], d<-[0..20],e<-[0..10],f<-[0..4],g<-[0..2],h<-[0..1],(a + (2*b) + (5*c) + (10 * d) + (20 * e) + (50*f) + (100 * g) + (200*h)) == 200]

main :: IO()
main = print coinSumTuples
