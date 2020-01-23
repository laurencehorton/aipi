# Access to information and privacy statistics by source of requests, 1996-1997 to 2018-2019
# https://www.canada.ca/en/treasury-board-secretariat/services/access-information-privacy/statistics-atip.html

# Importing years 1996-1997 to 2005-2006 ----
# These data have been keyed into a .csv file from a combination of pdf and html copes of Access to Information and Privacy reports.

#Install packages ----
# Run ati-packages first.

# Create path to file
source9606 <- ("https://raw.githubusercontent.com/laurencehorton/inf1005-3/master/ati-source9606.csv")

# Import .csv file droppping the data sources references
source9606 <- read.csv(source9606, skip = 13)

# Add a decline to answer column "Decline"
source9606[, "Decline"] <- NA

# Create a sum total accross for all types of request
source9606$Total = rowSums(source9606[, c(2:6)])
names(source9606)