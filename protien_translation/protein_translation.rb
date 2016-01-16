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

  def self.of_rna(rna)
    final_strand = []
    new_rna = rna.scan(/.{3}/)
    new_rna.each do |value|
      PROTEINS.keys.each do |key|
        if PROTEINS[key].include?(value)
          if key == 'STOP'
            return final_strand
          else
            final_strand << key
          end
        end
      end
    end
    final_strand
  end
end
