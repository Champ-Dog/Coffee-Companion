# This module provides custom calculation functions to the app; and currently includes only one method. The module has been
# created as future-proofing, as future version of the app are planned to include several calculators as an additional
# feature.
module Calculators
    def calculate_extraction(dose, out, tds)
    solids = (tds / 100) * out
    ext = solids / dose
    return (ext * 100).round(2)
    end
end