# This module provides custom calculation functions to the app; and currently includes only one method. The module has
# been created as future-proofing, as future versions of the app are planned to include several calculators as an
# additional feature.
module Calculators
  # This returns the mass of coffee solids in the cup. This is calculated by comparing the yield (named as out in
  # parameters to prevent conflict) with the TDS. As per industry standard, TDS is rounded to one decimal point,
  # regardless of input.
  def self.calculate_solids(out, tds)
    solids = (tds.round(1) / 100) * out
    return solids.round(2)
  end

  # This returns a value indicating the extraction percentage. This is calculated by comparing the mass of extracted
  # coffee solids (calculated by calculate_solids) to the dry weight of coffee used (Dose).
  def self.calculate_extraction(dose, solids)
    ext = solids / dose
    return (ext * 100).round(2)
  end

  # This calls the two calculation methods to return a single value, representating the % extraction of a coffee.
  # This is shown to the user with an on-screen message.
  def self.return_extraction(dose, out, tds)
    solids = calculate_solids(out, tds)
    ext = calculate_extraction(dose, solids)
    puts "Your extraction is #{ext}"
    return ext
  end


end