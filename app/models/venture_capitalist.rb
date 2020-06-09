class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.tres_comma_club
        VentureCapitalist.all.select do |oof|
            oof.total_worth > 1000000000
        end.uniq 
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        yoshiro = FundingRound.all.select do |yeet|
            yeet.venture_capitalist == self
        end
        yoshiro
    end

    def portfolio
        suckers = FundingRound.all.select do |yeet|
            yeet.venture_capitalist == self
        end
        suckers.map do |yah|
            yah.startup
        end.uniq
    end

    def biggest_investment
        wow = FundingRound.all.select do |yeet|
            yeet.venture_capitalist == self
        end
        wow.max_by do |yah|
            yah.investment
        end
    end

    def invested(domain_name)
        wow = self.funding_rounds.select do |yeet|
            yeet.startup.domain == domain_name
        end
        oof = wow.map do |y|
            y.investment
        end
        oof.sum
    end
    
end
