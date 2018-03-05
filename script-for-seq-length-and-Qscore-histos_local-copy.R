# Feb 7th, 2018
# Curtis Kapsak
# Here I'll document how I made the q-score and read length histograms for the Nanopore data.
# The data that is used here was the output file from Albacore "sequencing_summary.txt". This
# file was generated when the Nanopore was basecalled by Albacore v2.1.10 on Jan29. I manually
# separated out the file based on the "barcode arrangment" which provides what the is the final
# barcode assigment determined by Albacore. So I have 7 CSV files containing all metadata from
# running Albacore.

# import the ggplot2 package
library(ggplot2)

# create variables called BC[x]data and read in the data from the CSV file
BC1data <- read.csv(file = "C:\\Users\\biology\\Dropbox\\RESEARCH HERRICK\\GRADUATE THESIS\\thesis sequence data analysis stuff\\albacorev2.1.10runJan29\\sequencing-summary-barcode-arrangement-1.csv", header = TRUE)
BC2data <- read.csv(file = "C:\\Users\\biology\\Dropbox\\RESEARCH HERRICK\\GRADUATE THESIS\\thesis sequence data analysis stuff\\albacorev2.1.10runJan29\\sequencing-summary-barcode-arrangement-2.csv", header = TRUE)
BC3data <- read.csv(file = "C:\\Users\\biology\\Dropbox\\RESEARCH HERRICK\\GRADUATE THESIS\\thesis sequence data analysis stuff\\albacorev2.1.10runJan29\\sequencing-summary-barcode-arrangement-3.csv", header = TRUE)
BC4data <- read.csv(file = "C:\\Users\\biology\\Dropbox\\RESEARCH HERRICK\\GRADUATE THESIS\\thesis sequence data analysis stuff\\albacorev2.1.10runJan29\\sequencing-summary-barcode-arrangement-4.csv", header = TRUE)
BC5data <- read.csv(file = "C:\\Users\\biology\\Dropbox\\RESEARCH HERRICK\\GRADUATE THESIS\\thesis sequence data analysis stuff\\albacorev2.1.10runJan29\\sequencing-summary-barcode-arrangement-5.csv", header = TRUE)
BC6data <- read.csv(file = "C:\\Users\\biology\\Dropbox\\RESEARCH HERRICK\\GRADUATE THESIS\\thesis sequence data analysis stuff\\albacorev2.1.10runJan29\\sequencing-summary-barcode-arrangement-6.csv", header = TRUE)
BCNoneData <- read.csv(file = "C:\\Users\\biology\\Dropbox\\RESEARCH HERRICK\\GRADUATE THESIS\\thesis sequence data analysis stuff\\albacorev2.1.10runJan29\\sequencing-summary-barcode-arrangement-none.csv", header = TRUE)

#check to make sure the data was read correctly by showing the first 20 or so lines
head(BC1data)
head(BC2data)
head(BC3data)
head(BC4data)
head(BC5data)
head(BC6data)
head(BCNoneData)

#assign variables to specific coulmns within the sequencing_summary.txt
qscore1 <- BC1data$mean_qscore_template
seqlen1 <- BC1data$sequence_length_template

#check to make sure these variables were assigned properly with the data
head(qscore1)
head(seqlen1)

# assign for the rest of the datasets
qscore2 <- BC2data$mean_qscore_template
seqlen2 <- BC2data$sequence_length_template

qscore3 <- BC3data$mean_qscore_template
seqlen3 <- BC3data$sequence_length_template

qscore4 <- BC4data$mean_qscore_template
seqlen4 <- BC4data$sequence_length_template

qscore5 <- BC5data$mean_qscore_template
seqlen5 <- BC5data$sequence_length_template

qscore6 <- BC6data$mean_qscore_template
seqlen6 <- BC6data$sequence_length_template

qscoreNone <- BCNoneData$mean_qscore_template
seqlenNone <- BCNoneData$sequence_length_template



# code to make q-score histogram for BC1 
ggplot(data = BC1data) +
  geom_histogram(mapping = aes(x=qscore1),
                 bins = 70,
                 col = I("black")) +
  labs(x="Q-score", y="Number of Reads") +
  ggtitle("Barcode 1 Q-scores")

# code to make q-score histogram for BC2
ggplot(data = BC2data) +
  geom_histogram(mapping = aes(x=qscore2),
                 bins = 70,
                 col = I("black")) +
  labs(x="Q-score", y="Number of Reads") +
  ggtitle("Barcode 2 Q-scores")

# code to make q-score histogram for BC3
ggplot(data = BC3data) +
  geom_histogram(mapping = aes(x=qscore3),
                 bins = 70,
                 col = I("black")) +
  labs(x="Q-score", y="Number of Reads") +
  ggtitle("Barcode 3 Q-scores")

# code to make q-score histogram for BC4
ggplot(data = BC4data) +
  geom_histogram(mapping = aes(x=qscore4),
                 bins = 70,
                 col = I("black")) +
  labs(x="Q-score", y="Number of Reads") +
  ggtitle("Barcode 4 Q-scores")

# code to make q-score histogram for BC5
ggplot(data = BC5data) +
  geom_histogram(mapping = aes(x=qscore5),
                 bins = 70,
                 col = I("black")) +
  labs(x="Q-score", y="Number of Reads") +
  ggtitle("Barcode 5 Q-scores")

# code to make q-score histogram for BC6
ggplot(data = BC6data) +
  geom_histogram(mapping = aes(x=qscore6),
                 bins = 70,
                 col = I("black")) +
  labs(x="Q-score", y="Number of Reads") +
  ggtitle("Barcode 6 Q-scores")

# code to make q-score histogram for BCNone
ggplot(data = BCNoneData) +
  geom_histogram(mapping = aes(x=qscoreNone),
                 bins = 70,
                 col = I("black")) +
  labs(x="Q-score", y="Number of Reads") +
  ggtitle("No Barcode Q-scores")

#                                       #
#       Read Length Histograms          #
#                                       #
# code to make read length histogram for BC1
ggplot(data = BC1data) +
  geom_histogram(mapping = aes(x=seqlen1),
                 binwidth = 500,
                 center = 250,
                 col = I("black")) +
  labs(x="Read length (bp)", y="Number of Reads") +
  scale_x_continuous(breaks=seq(0,max(seqlen1) + 5000, by = 5000)) +
  scale_y_continuous(breaks=seq(0,4000, by = 500)) +
  ggtitle("BC1 Read Lengths")

# code to make read length histogram for BC2
ggplot(data = BC2data) +
  geom_histogram(mapping = aes(x=seqlen2),
                 binwidth = 500,
                 center = 250,
                 col = I("black")) +
  labs(x="Read length (bp)", y="Number of Reads") +
  scale_x_continuous(breaks=seq(0,(max(seqlen2) + 5000), by = 5000)) +
  scale_y_continuous(breaks=seq(0,9000, by = 500)) +
  ggtitle("BC2 Read Lengths")

# code to make read length histogram for BC3
ggplot(data = BC3data) +
  geom_histogram(mapping = aes(x=seqlen3),
                 binwidth = 500,
                 center = 250,
                 col = I("black")) +
  labs(x="Read length (bp)", y="Number of Reads") +
  scale_x_continuous(breaks=seq(0,(max(seqlen3) + 5000), by = 5000)) +
  scale_y_continuous(breaks=seq(0,1250, by = 250)) +
  ggtitle("BC3 Read Lengths")

# code to make read length histogram for BC4
ggplot(data = BC4data) +
  geom_histogram(mapping = aes(x=seqlen4),
                 binwidth = 250,
                 center = 125,
                 col = I("black")) +
  labs(x="Read length (bp)", y="Number of Reads") +
  scale_x_continuous(breaks=seq(0,(max(seqlen4) + 2500), by = 5000)) +
  scale_y_continuous(breaks=seq(0,9000, by = 1000)) +
  ggtitle("BC4 Read Lengths")

# code to make read length histogram for BC5
ggplot(data = BC5data) +
  geom_histogram(mapping = aes(x=seqlen5),
                 binwidth = 500,
                 center = 250,
                 col = I("black")) +
  labs(x="Read length (bp)", y="Number of Reads") +
  scale_x_continuous(breaks=seq(0,(max(seqlen5) + 5000), by = 5000)) +
  scale_y_continuous(breaks=seq(0,10000, by = 500)) +
  ggtitle("BC5 Read Lengths")

# code to make read length histogram for BC6
ggplot(data = BC6data) +
  geom_histogram(mapping = aes(x=seqlen6),
                 binwidth = 500,
                 center = 250,
                 col = I("black")) +
  labs(x="Read length (bp)", y="Number of Reads") +
  scale_x_continuous(breaks=seq(0,(max(seqlen6) + 5000), by = 10000)) +
  scale_y_continuous(breaks=seq(0,26000, by = 1000)) +
  ggtitle("BC6 Read Lengths")

# code to make read length histogram for BCNone
ggplot(data = BCNoneData) +
  geom_histogram(mapping = aes(x=seqlenNone),
                 binwidth = 500,
                 center = 250,
                 col = I("black")) +
  labs(x="Read length (bp)", y="Number of Reads") +
  scale_x_continuous(breaks=seq(0,(max(seqlenNone) + 5000), by = 5000)) +
  scale_y_continuous(breaks=seq(0,17000, by = 1000)) +
  ggtitle("No Barcode Read Lengths")