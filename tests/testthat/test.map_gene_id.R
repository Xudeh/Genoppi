context('map_gene_id')

# read in test data
df <- data.frame(accession_number=c('Q96DR7', 'Q13148', 'P17948'), rep1=1:3, rep2=4:6)
outDf <- data.frame(df,gene=c('ARHGEF26','TARDBP', 'FLT1'))

df2 <- data.frame(accession_number=c('Q96DR7','Q96DR7-3'))
outDf2 <- data.frame(accession_number=c('Q96DR7','Q96DR7-3'),gene=c('ARHGEF26','ARHGEF26'))

df3 <- data.frame(accession_number=c('BADNAME'))

test_that('map_gene_id correctly maps acession_number (uniprot) to HGNC' ,{
  
  # typical cased
  result <- map_gene_id(df)
  result$gene <- as.factor(result$gene)
  outDf$gene <- as.factor(outDf$gene)
  expect_equal(result, outDf)
  
  # valid Uniprot ID but with isoform
  result <- map_gene_id(df2)
  result$gene <- as.factor(result$gene)
  outDf2$gene <- as.factor(outDf2$gene)
  expect_equal(result, outDf2)
  
  # invalid uniprot ID
  result <- map_gene_id(df3)
  expect_true(is.na(result$gene))
  
})

