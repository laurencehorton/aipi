install.packages("ggplot2")
library(ggplot2)

# Merge the ATI requests dataset and the Datasets Published datasets into a data frame
mergeddata <- merge(source9619, datapub9718, by = "Year")

# Scatter graph of ATI requests against Datasets Published
ggplot(mergeddata, aes(x=Total, y=Datasets)) +
  geom_point(color="Orange", size = 4) + 
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE, color='Black') +
  labs(y="Datasets published", x="ATI requests",
         title = "ATI requests and Open Government Datasets, 1996-2018", 
       caption = "Source: Government of Canada Treasury Board Secretariat")
 
# Basic line plot with points for annual ATI  requests
ggplot(mergeddata, aes(x=Year, y=Total, group=1)) +
  geom_line(color="Orange", size=2, alpha=0.9, linetype=1) +
  theme_bw() +
  labs(title = "Access to Information requests, 1996-2019", 
       subtitle = "Total number of requests made under the Federal Access to Information Act by year", 
       caption = "Source: Government of Canada Treasury Board Secretariat") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  theme(axis.title.x = element_blank(), axis.title.y = element_blank())+
  theme(panel.grid.minor.x=element_blank(), panel.grid.major.x=element_blank())

# Basic line plot with points for number of datasets published
ggplot(mergeddata, aes(x=Year, y=Datasets, group=1)) +
  geom_line(color="Orange", size=2, alpha=0.9, linetype=1) +
  theme_bw() +
  labs(title = "Number of datasets published, 1996-2019", 
       subtitle = "Total number of datasets published in Canada's Open Government Data portal by year", 
       caption = "Source: Government of Canada Treasury Board Secretariat") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  theme(axis.title.x = element_blank(), axis.title.y = element_blank())+
  theme(panel.grid.minor.x=element_blank(), panel.grid.major.x=element_blank())