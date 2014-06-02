require 'spec_helper'

describe MineField do

  describe "#hint_field" do

    {
      "" => "",
      "*" => "*",
      "." => "0",
      ".." => "00",
      "**" => "**",
      "*." => "*1",
      "*\n*" => "*\n*",
      ".\n." => "0\n0",
      "**\n**" => "**\n**",
      "*.\n**" => "*3\n**",
      "*.\n.*" => "*2\n2*",
      "*.\n.." => "*1\n11",
    }
    .each do |field, hint_field|
      it "should return '#{hint_field}' for '#{field}'" do
        field = MineField.new field

        expect(field.hint_field).to eq hint_field
      end
    end

  end

end
