# Access to information and privacy statistics by source of requests, 1996-1997 to 2018-2019
# https://www.canada.ca/en/treasury-board-secretariat/services/access-information-privacy/statistics-atip.html
# For CSV data 2015-2019

#Install packages ----
# Run ati-packages first.

# Data sources by year ----
accessinfo1516 <-
  "https://www.canada.ca/content/dam/tbs-sct/documents/access-information-privacy/20152106-ati-eng.csv"
accessinfo1617 <-
  "https://www.canada.ca/content/dam/tbs-sct/documents/access-information-privacy/20171219-ati-eng.csv"
accessinfo1718 <-
  "https://www.canada.ca/content/dam/tbs-sct/documents/access-information-privacy/20181218-ati-eng.csv"
accessinfo1819 <-
  "https://www.canada.ca/content/dam/tbs-sct/documents/access-information-privacy/2018-19-ati-eng.csv"

# 2015-2016 ----
# Load .csv dropping the first 4 rows of the .csv file
accessinfo1516 <-
  read_csv(accessinfo1516, skip = 4)

# Create a copy for working on
accessinfo <- (accessinfo1516)

# Check to see no authority is duplicated
duplicated(accessinfo$X1)

# Keep only the sources of requests for that reporting period
source <-
  subset(
    accessinfo,
    select = c(
      "Media",
      "Academia",
      "Business (private sector)",
      "Organization",
      "Public",
      "Decline to Identify"
    )
  )

# Add up the totals for each department or agency
sum <- colSums(source)

# Convert to a data.frame
sum <- as.data.frame(sum)

# Transpose from rows to columns
sum <- as.data.frame(t(as.matrix(sum)))

# Create a sum total accross for all types of request
sum$Total = rowSums(sum[, c(1:6)])

# Create a df for that year
sum1516 <- (sum)

# Add column variable for for the year
sum1516$Year <- "2015-2016"

# 2016-2017 ----
# Load .csv dropping the first 4 rows of the .csv file
accessinfo1617 <-
  read_csv(accessinfo1617,    skip = 4)

# Create a copy for working on
accessinfo <- (accessinfo1617)

# Check to see no authority is duplicated
duplicated(accessinfo$X1)

# Keep only the sources of requests for that reporting period
source <-
  subset(
    accessinfo,
    select = c(
      "Media",
      "Academia",
      "Business (private sector)",
      "Organization",
      "Public",
      "Decline to Identify"
    )
  )

# Add up the totals for each department or agency
sum <- colSums(source)

# Convert to a data.frame
sum <- as.data.frame(sum)

# Transpose from rows to columns
sum <- as.data.frame(t(as.matrix(sum)))

# Create a sum total accross for all types of request
sum$Total = rowSums(sum[, c(1:6)])

# Create a df for that year
sum1617 <- (sum)

# Add column variable for for the year
sum1617$Year <- "2016-2017"

# Remove as no longer needed
rm(accessinfo, sum, source)

# 2017-2018----
# Load .csv dropping the first 4 rows of the .csv file
accessinfo1718 <-
  read_csv(accessinfo1718,    skip = 4)

# Create a copy for working on
accessinfo <- (accessinfo1718)

# Check to see no authority is duplicated
duplicated(accessinfo$X1)

# Keep only the sources of requests for that reporting period
source <-
  subset(
    accessinfo,
    select = c(
      "Media",
      "Academia",
      "Business (private sector)",
      "Organization",
      "Public",
      "Decline to Identify"
    )
  )

# Add up the totals for each department or agency
sum <- colSums(source)

# Convert to a data.frame
sum <- as.data.frame(sum)

# Transpose from rows to columns
sum <- as.data.frame(t(as.matrix(sum)))

# Create a sum total accross for all types of request
sum$Total = rowSums(sum[, c(1:6)])

# Create a df for that year
sum1718 <- (sum)

# Add column variable for for the year
sum1718$Year <- "2017-2018"

# Remove as no longer needed
rm(accessinfo, sum, source)

# 2018-2019 ----
# Load .csv dropping the first 4 rows of the .csv file
accessinfo1819 <-
  read_csv(accessinfo1819,    skip = 4)

# Create a copy for working on
accessinfo <- (accessinfo1819)

# Check to see no authority is duplicated
duplicated(accessinfo$X1)

# Keep only the sources of requests for that reporting period
source <-
  subset(
    accessinfo,
    select = c(
      "Media",
      "Academia",
      "Business (private sector)",
      "Organization",
      "Public",
      "Decline to Identify"
    )
  )

# Add up the totals for each department or agency
sum <- colSums(source)

# Convert to a data.frame
sum <- as.data.frame(sum)

# Transpose from rows to columns
sum <- as.data.frame(t(as.matrix(sum)))

# Create a sum total accross for all types of request
sum$Total = rowSums(sum[, c(1:6)])

# Create a df for that year
sum1819 <- (sum)

# Add column variable for for the year
sum1819$Year <- "2018-2019"

# Remove as no longer needed
rm(accessinfo, sum, source)

# Combine 2015-2019 ----
# Combine the years 2015-2019 into one data frame of total source of requests by type each year.
source1519 <- rbind.data.frame(sum1516, sum1617, sum1718, sum1819)

# Rename columns
colnames(source1519)[1:6] <-
  c("Business",
    "Public",
    "Media",
    "Orginizations",
    "Academics",
    "Decline")
names(source1519)

# Reorder columns
col_order <-
  c(
    "Year",
    "Business",
    "Public",
    "Media",
    "Orginizations",
    "Academics",
    "Decline",
    "Total"
  )
source1519 <- source1519[, col_order]
names(source1519)

# Remove data frames no longer required
rm(col_order, sum1516, sum1617, sum1718, sum1819)