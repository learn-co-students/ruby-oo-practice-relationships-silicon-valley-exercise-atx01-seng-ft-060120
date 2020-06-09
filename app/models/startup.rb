class Startup

    attr_reader :founder, :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        self.class.all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
        self
    end 

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.select do |find|
            find.founder == founder_name
        end 
    end

    def self.domains
        self.all.map do |find|
            find.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def num_funding_rounds
        yoshiro = FundingRound.all.select do |yeet|
            yeet.startup == self
        end
        yoshiro.count
    end

    def total_funds
        yoshi = FundingRound.all.select do |yeet|
            yeet.startup == self
        end
        sheesh = yoshi.map do |yah|
            yah.investment
        end
        sheesh.inject(:+)
    end

    def investors
        suckers = FundingRound.all.select do |yeet|
            yeet.startup == self
        end
        suckers.map do |yah|
            yah.venture_capitalist
        end.uniq
    end

    def big_investors
        big_boy_energy = VentureCapitalist.tres_comma_club.map do |yeet|
            yeet.name 
        end
        shyt = self.investors.map do |yah|
            yah.name
        end
        heck = big_boy_energy & shyt
        heck
    end


end
