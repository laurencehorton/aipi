# Combine all Access to Information data files 1996-2006, 2007-2014, 2015-2019 ----
# Combine the three separate sources of data into one data frame of total source of requests by type each year.
source9619 <- rbind(source9606, source0714, source1519)

# Remove data frames no longer required
rm(source1519, source9606, source0714)