% Swedish color map

% gnuplot equivalent:
% set palette model RGB defined ( 0 'white', 10 'white', 1500 '#005293', 6500 '#FECB00', 9999 '#FECB00')

function S = svenska()

  % positions where colors are given
  X=[0 10 1500 6500 9999];

  % RGB values of the colors at the above positions
  R=[255 255   0 204 204]./255; %238-232-170, 255 255 153
  G=[255 255  82 104 104]./255;
  B=[255 255 146  0  0]./255;

  % interpolation between the defined colors above
  for i=1:length(X)-1
    S(X(i)+1:X(i+1)+1,1)=interp1([X(i) X(i+1)],[R(i) R(i+1)], X(i):X(i+1))';
    S(X(i)+1:X(i+1)+1,2)=interp1([X(i) X(i+1)],[G(i) G(i+1)], X(i):X(i+1))';
    S(X(i)+1:X(i+1)+1,3)=interp1([X(i) X(i+1)],[B(i) B(i+1)], X(i):X(i+1))';
  end

end
