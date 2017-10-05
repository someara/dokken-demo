describe command('echo "hello" | nc -q 1 one.computers.biz 9001') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/hello/) }
end

describe command('echo "hello" | nc -q 1 two.computers.biz 9001') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/hello/) }
end
