class Translation
  PROTEINS = { "Methionine" => ["AUG"], "Phenylalanine" => ["UUU", "UUC"], "Leucine" => ["UUA", "UUG"], "Serine" => ["UCU", "UCC", "UCA", "UCG"], "Tyrosine" => ["UAU", "UAC"], "Cysteine" => ["UGU", "UGC"], "Tryptophan" => ["UGG"], "STOP" => ["UAA", "UAG", "UGA"]}

  def self.of_codon(codon)
    str = ''
    PROTEINS.keys.each do |key|
      if PROTEINS[key].include?(codon)
        str = key
      end
    end
    str
  end
end
