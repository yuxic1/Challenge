#Read and Process the Raw Data
#Just support txt files for now
#Would develop functions to support other files later
library(tm)
test <- readLines("test.txt")
docs <- Corpus(VectorSource(test))
#Remove punctuations and white spaces
docs <- tm_map(docs, removePunctuation)
#convert remaining letters to lowercase
docs <- tm_map(docs, content_transformer(tolower))
#Determine the Weight for Each Word
#Use word count for now
#Consider other weights later
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)
View(d)

#Stuck on the bounding box...
bounding_box