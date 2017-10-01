Ballot line for an invest
Budget::Ballot::Line.where(investment_id: 46)

Count nb ballot of one heading
Budget::Ballot::Line.select(:ballot_id).distinct.where(heading_id: 9).count
