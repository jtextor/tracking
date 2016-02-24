
fpat = 'banded/unreg/%04d.png'
opat = 'banded/reg/%04d.png'

N=100
sc=.5

% fpat = '~/textor2/nienke/JAZ017II_fotos/PosControl/statfeature/%d.png'

f = imread( sprintf( fpat , 1 ) );

%ucname = 'uncorrected.gif';
%cname = 'corrected.gif';

%imwrite(imresize( f , sc ), ucname,'gif', 'Loopcount',inf);
%imwrite(imresize( f , sc ), cname,'gif', 'Loopcount',inf);

imwrite( imcomplement( f ), sprintf( opat, 1 ) )

for i = 2:N
	g = imread( sprintf( fpat , i ) );
	fout = 	sprintf( opat, i )
	[out Greg] = dftregistration( fft2(f), fft2(g), 5 );	
	Greg = imcomplement( mat2gray( abs( ifft2( Greg ) ) ) );
	imwrite( Greg, fout, 'png' );
%	imwrite( imresize( g , sc ) ,ucname,'gif','WriteMode','append');
	%imwrite( imresize( Greg , sc ) ,cname,'gif','WriteMode','append');

end