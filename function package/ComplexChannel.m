function h=ComplexChannel(theta, r)

  for m=1:length(theta)
    h(m)=r(m)*exp(i*theta(m));
  end

end