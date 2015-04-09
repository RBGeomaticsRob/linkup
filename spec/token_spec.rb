describe Token do
  it 'can create a random string' do
    expect(subject.hash).to be_a String
    expect(subject.hash.length).to be 6
  end

  it 'can timestamp' do
    expect(subject.timestamp).to be_between(Time.now - 10, Time.now)
  end
end