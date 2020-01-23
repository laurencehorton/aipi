accessinfo1415 <- readLines('https://www.canada.ca/content/dam/canada/tbs-sct/migration/hgw-cgf/oversight-surveillance/atip-aiprp/sr-rs/xmls/ATIP-2014-2015.xml')
file.create("/Users/laurencehorton/Github/1005/1005/file1415.txt")
raw_file1415 <- ("/Users/laurencehorton/Github/1005/1005/file1415.txt")
write.table(accessinfo1415, raw_file1415)
file.create("/Users/laurencehorton/Github/1005/1005/file1415.csv")
accessinfo <- read.csv(file = "/Users/laurencehorton/Github/1005/1005/file1415.csv")
accessinfo$x <- NULL
submedia <- subset(accessinfo, X.1 == "</Media>") 
subacademics <- subset(accessinfo, X.1 == "</Academia>")
subbusiness <- subset(accessinfo, X.1 == "</Business>")
suborgs <- subset(accessinfo, X.1 == "</Organizations>")
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

rm(accessinfo1415, raw_file1415, submedia, subacademics, subbusiness, suborgs, subpub, subdecline)

source1415 <- total[nrow(total),]
source1415$Total <- rowSums(source1415[, c(1:6)])
source1415$Year <- "2014-2015"
col_order <- c("Year", "Business", "Public", "Media", "Orginizations", "Academics", "Decline", "Total")
sum1415 <- source1415[, col_order]
names(sum1415)
rm(total, col_order, accessinfo)
