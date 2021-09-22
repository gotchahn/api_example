class InternetUsage < ApplicationRecord


  def self.filter(q, year)
    usages = all
    if q.present?
      usages = usages.where("region LIKE '%#{q}%'")
    end

    if year.present?
      usages = usages.where(year: year)
    end

    usages
  end
end
