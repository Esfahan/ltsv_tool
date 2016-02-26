require 'spec_helper'

describe LtsvTool do
  it 'has a version number' do
    expect(LtsvTool::VERSION).not_to be nil
  end


  describe '#parser' do
    before do
      @ltsv_line = 'Pref:Kanagawa' + "\t" + 'City:Yokohama' 
    end

    context 'when arg is ltsv format' do 

      it 'returns "Yokohama"' do
        hash = LtsvTool::send(:parser, @ltsv_line)
        expect(hash['City']).to eq 'Yokohama'
      end

    end

  end



  describe '# hashes' do
    before do
      @ltsv_lines = 'Pref:Kanagawa' + "\t" + 'City:Yokohama' + "\n" + 'Pref:Tokyo' + "\t" + 'City:Ginza'
    end

    context 'when arg is ltsv format in hash' do 

      it 'returns "Ginza"' do
        hash = LtsvTool::send(:hashes, @ltsv_lines)
        expect(hash[1]['City']).to eq 'Ginza'
      end

    end

  end

end
