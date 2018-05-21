require "csv"
class PagesController < ApplicationController
  skip_authorization_check
  require "google_drive"

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

  def live_results
    session = GoogleDrive::Session.from_config("secrets.yml")
    file = session.spreadsheet_by_key("1vrNdNlPyFRyhGDdJ9c4o6THUumyC2z4BYtfiNcRp0c0").worksheets[0]
    years = {}
    file.rows.each do |row|
      next if row == 0
      ligne = project_ligne_2(row)
      next unless ligne[:win] == "Lauréat"

      year = years[ligne[:year]] || {}
        site = year[ligne[:site]] || {}
          site[ligne[:id]] = ligne

        year[ligne[:site]] = site
      years[ligne[:year]] = year
    end
    @years = years
    @results = years
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
      color: row[21],
      status: row[23],
      year: row[24]}
  end

  def project_ligne_2(row)
  {site: row[0],
   win: row[20],
   name: row[4],
   id: row[1].to_i,
   accepted: row[9],
   cost: row[7],
   paper_vote: row[17],
   electronic_vote: Budget::Ballot::Line.where(investment_id: row[1]).count,
   total: row[19],
   color: row[21],
   step: row[23],
   year: row[24],
   actu: row[25]}
  end
end
