require "csv"
class PagesController < ApplicationController
  skip_authorization_check

  def show
    render action: params[:id]
  rescue ActionView::MissingTemplate
    head 404
  end

  def results
    @results = []
    file = File.expand_path('../../../../consul/app/assets/doc/results.csv', __FILE__)
    CSV.foreach(file, :headers => true) do |row|
      @results.push(project_ligne(row))
    end
  end

  private

  def project_ligne(row)
    {site: row[0],
      win: row[20],
      name: row[4],
      id: row[1].to_i,
      accepted: row[9],
      cost: row[7],
      paper_vote: row[17],
      electronic_vote: Budget::Ballot::Line.where(investment_id: row[1]).count,
      total: row[19],
      color: row[21]}
  end
end
