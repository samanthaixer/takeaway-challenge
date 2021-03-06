require 'message'

describe Message do
  let(:message) { Message.new }

  it "should create a useful text message with a delivery window an hour later" do
    time = Time.now + 60 * 60
    delivery_time = "#{time.strftime('%H')}:#{time.strftime('%M')}"
    allow(message).to receive(:connect) { "Message sent" }
    expect(message.send_text).to eq "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end

  # CURRENTLY REMOVED SO THAT WE DON'T SEND MESSAGES
  # it "successfully creates a connection to Twilio" do
  #   time = Time.now + 60 * 60
  #   delivery_time = "#{time.strftime('%H')}:#{time.strftime('%M')}"
  #   expect(message.send_text).to eq "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  # end
end
