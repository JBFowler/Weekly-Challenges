class InvalidCodonError < StandardError
end

class Translation
  PROTEINS = { "Methionine" => ["AUG"], "Phenylalanine" => ["UUU", "UUC"], "Leucine" => ["UUA", "UUG"], "Serine" => ["UCU", "UCC", "UCA", "UCG"], "Tyrosine" => ["UAU", "UAC"], "Cysteine" => ["UGU", "UGC"], "Tryptophan" => ["UGG"], "STOP" => ["UAA", "UAG", "UGA"]}

  def self.of_codon(codon)
    codon_trans = ''
    # check_proteins(codon, codon_trans)
    PROTEINS.keys.each do |key|
      if PROTEINS[key].include?(codon)
        codon_trans = key
      end
    end
    codon_trans
  end

  def self.of_rna(rna)
    final_strand = []
    new_rna = rna.scan(/.{3}/)
    new_rna.each do |value|
      raise InvalidCodonError if PROTEINS.values.flatten.include?(value) == false
      # check_proteins(value, final_strand)
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

#   class InvalidCodonError < StandardError
# end
#
# module Translation
#   CODON_PROTEIN = {
#     'AUG' => 'Methionine',    'UUU' => 'Phenylalanine',
#     'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
#     'UUG' => 'Leucine',       'UCU' => 'Serine',
#     'UCC' => 'Serine',        'UCA' => 'Serine',
#     'UCG' => 'Serine',        'UAU' => 'Tyrosine',
#     'UAC' => 'Tyrosine',      'UGU' => 'Cystine',
#     'UGC' => 'Cystine',       'UGG' => 'Tryptophan',
#     'UAA' => 'STOP',          'UAG' => 'STOP',
#     'UGA' => 'STOP'
#   }

#   def self.of_codon(codon)
#     CODON_PROTEIN.fetch(codon) { fail InvalidCodonError }
#   end

#   def self.of_rna(strand)
#     strand.scan(/.../).take_while { |codon| of_codon(codon) != 'STOP' }
#                       .map { |codon| of_codon(codon) }
#   end
# end
end
