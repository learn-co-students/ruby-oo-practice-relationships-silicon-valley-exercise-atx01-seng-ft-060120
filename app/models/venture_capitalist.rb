class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []
    
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.tres_commas_club
        club = self.all.select do |vc|
            vc.total_worth > 1000000000
        end
        club.map do |vc|
            vc.name
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
    end

    def portfolio
        investments = FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
        startups = investments.map do |fr|
            fr.startup.name
        end
        startups.uniq
    end

    def biggest_investment
        investments = FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
        biggest_investment = investments.map do |fr|
            fr.investment
        end
        biggest_investment.max{|a, b| a <=> b}
    end

    def invested(domain)
        investments = FundingRound.all.select do |fr|
            fr.venture_capitalist == self
        end
        in_given_domain = investments.select do |fr|
            fr.startup.domain == domain
        end
        total = in_given_domain.map do |fr|
            fr.investment
        end
        total.inject(:+)
    end

            

end
