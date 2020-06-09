require 'pry'

class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(new_domain, new_name)
        @domain = new_domain
        self.name = new_name
    end

    def self.find_by_founder(founder_name)
        self.all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end
    
    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end

    def num_founding_rounds
        num = FundingRound.all.collect do |fr|
            fr.startup == self
        end
            num.count
    end


    def total_funds
        list = FundingRound.all.select do |fr|
            fr.startup == self
        end
        total = list.map do |fr|
            fr.investment
        end
        total.inject(:+)
    end

    def investors
        list = FundingRound.all.select do |fr|
            fr.startup == self
        end
        final = list.map do |fr|
            fr.venture_capitalist.name
        end
        final.uniq
    end

    def big_investors
        list = FundingRound.all.select do |fr|
            fr.startup == self
        end
        investors = list.map do |fr|
            fr.venture_capitalist.name
        end
        big_investors = []
        investors.each do |inv|
            if VentureCapitalist.tres_commas_club.include?(inv)
                big_investors << inv
            end
        end
        big_investors.uniq
    end

end
