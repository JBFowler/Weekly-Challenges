class Translation
  PROTEINS = { "Methionin" => ["AUG"], "Phenylalanin" => ["UUU", "UUC"], "Leucine" => ["UUA", "UUG"], "Serine" => ["UCU", "UCC", "UCA", "UCG"], "Tyrosine" => ["UAU", "UAC"], "Cystine" => ["UGU", "UGC"], "Tryptophan" => ["UGG"], "STOP" => ["UAA", "UAG", "UGA"]}

  def initialize(codon = '', rna = '')
    @codon = codon
    @rna = rna
  end
end