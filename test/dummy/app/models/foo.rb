class Foo < ActiveRecord::Base
   
  validates :fld_acceptance, :acceptance => true
  validates :fld_confirmation, :confirmation => true
  validates :fld_exclusion_in, :exclusion => {:in => %w(Alto Médio Baixo)}
  validates :fld_format_with, :format => {:with => /\A[a-zA-Z]+\z/}
  validates :fld_format_without, :format => {:without => /\A[a-zA-Z]+\z/}
  validates :fld_inclusion_in, :inclusion => {:in => %w(Alto Médio Baixo)}
  validates :fld_length_minimum, :length => {:minimum => 5}
  validates :fld_length_maximum, :length => {:maximum => 5}
  validates :fld_length_within, :length => {:within => 3..5}
  validates :fld_length_in, :length => {:in => 2..3}
  validates :fld_numericality, :numericality
  validates :fld_numericality_only_integer, :numericality => {:only_integer => true}
  validates :fld_numericality_greater_than, :numericality => {:greater_than => 5}
  validates :fld_numericality_greater_than_or_equal_to, :numericality => {:greater_than_or_equal_to => 5}
  validates :fld_numericality_equal_to, :numericality => {:equal_to => 5}
  validates :fld_numericality_less_than, :numericality => {:less_than => 5 }
  validates :fld_numericality_less_than_or_equal_to, :numericality => {:less_than_or_equal_to => 5}
  validates :fld_numericality_odd, :numericality => {:odd => true}
  validates :fld_numericality_even, :numericality => {:even => true}
  validates :fld_presence,  :presence => true
  
end
