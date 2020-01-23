accessinfo0708 <- readLines('http://webarchive.bac-lac.gc.ca:8080/wayback/20140805210734/http://www.infosource.gc.ca/xml/ATIP%202007-2008.xml')
file.create("/Users/laurencehorton/Github/1005/1005/file0708.txt")
raw_file0708 <- ("/Users/laurencehorton/Github/1005/1005/file0708.txt")
write.table(accessinfo0708, raw_file0708)
file.create("/Users/laurencehorton/Github/1005/1005/file0708.csv")
accessinfo <- read.csv(file = "/Users/laurencehorton/Github/1005/1005/file0708.csv")
accessinfo$x <- NULL
submedia <- subset(accessinfo, X.1 == "</media>") 
subacademics <- subset(accessinfo, X.1 == "</academia>")
subbusiness <- subset(accessinfo, X.1 == "</business>")
suborgs <- subset(accessinfo, X.1 == "</organization>")
subpub <- subset(accessinfo, X.1 == "</Public>")
subdecline <- subset(accessinfo, X.1 == "</DeclineToIdentify>")

colnames(submedia)[colnames(submedia)=="X"] <- "Media"
colnames(subacademics)[colnames(subacademics)=="X"] <- "Academics"
colnames(subbusiness)[colnames(subbusiness)=="X"] <- "Business"
colnames(suborgs)[colnames(suborgs)=="X"] <- "Orginizations"
colnames(subpub)[colnames(subpub)=="X"] <- "Public"
colnames(subdecline)[colnames(subdecline)=="X"] <- "Decline"

submedia[2] <- NULL
subacademics[2] <- NULL
subbusiness[2] <- NULL
suborgs[2] <- NULL
subpub[2] <- NULL
subdecline[2] <- NULL

# Convert to numeric
submedia$Media <- as.numeric(levels(submedia$Media))[as.integer(submedia$Media)]
subacademics$Academics <- as.numeric(levels(subacademics$Academics))[as.integer(subacademics$Academics)]
subbusiness$Business <- as.numeric(levels(subbusiness$Business))[as.integer(subbusiness$Business)]
suborgs$Orginizations <- as.numeric(levels(suborgs$Orginizations))[as.integer(suborgs$Orginizations)]
subpub$Public <- as.numeric(levels(subpub$Public))[as.integer(subpub$Public)]
subdecline$Decline <- as.numeric(levels(subdecline$Decline))[as.integer(subdecline$Decline)]

# Add a total
submedia <- rbind(submedia, data.frame(Media = sum(submedia$Media)))
subacademics <- rbind(subacademics, data.frame(Academics = sum(subacademics$Academics)))
subbusiness <- rbind(subbusiness, data.frame(Business = sum(subbusiness$Business)))
suborgs <- rbind(suborgs, data.frame(Orginizations = sum(suborgs$Orginizations)))
subpub <- rbind(subpub, data.frame(Public = sum(subpub$Public)))
subdecline <- rbind(subdecline, data.frame(Decline = sum(subdecline$Decline)))

total <- cbind(submedia, subacademics, subbusiness, suborgs, subpub, subdecline)

rm(accessinfo0708, raw_file0708, submedia, subacademics, subbusiness, suborgs, subpub, subdecline)

source0708 <- total[nrow(total),]
source0708$Total <- rowSums(source0708[, c(1:6)])
source0708$Year <- "2007-2008"
col_order <- c("Year", "Business", "Public", "Media", "Orginizations", "Academics", "Decline", "Total")
sum0708 <- source0708[, col_order]
names(sum0708)
rm(total, col_order, accessinfo)
