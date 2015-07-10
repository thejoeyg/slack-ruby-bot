require 'spec_helper'

describe SlackRubyBot::Commands do
  let! :command do
    Class.new(SlackRubyBot::Commands::Base) do
      command 'test'

      def self.call(data, _command, _arguments)
        send_message data.channel, nil
      end
    end
  end
  def app
    SlackRubyBot::App.new
  end
  it 'sends default text' do
    allow(Giphy).to receive(:random)
    expect(SlackRubyBot::Commands::Base).to receive(:send_message_with_gif).with('channel', 'Nothing to see here.', 'nothing')
    app.send(:message, text: "#{SlackRubyBot.config.user} test", channel: 'channel', user: 'user')
  end
end