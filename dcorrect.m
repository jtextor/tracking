

N=100 % amount of pictures
sc=.5

% fpat = '~/textor2/nienke/JAZ017II_fotos/PosControl/statfeature/%d.png'
f = imread( sprintf( fpat , 1 ) );

%ucname = 'uncorrected.gif';
%cname = 'corrected.gif';

%imwrite(imresize( f , sc ), ucname,'gif', 'Loopcount',inf);
%imwrite(imresize( f , sc ), cname,'gif', 'Loopcount',inf);
f1 = imcomplement( f );
imwrite( f1 , sprintf( opat, 1 ) )
imHistAvg = imhist(f1);

% add all images intensity histograms and average it by N
for i = 2:N
	g = imread( sprintf( fpat , i ) );
    g1 = imcomplement( g );
    imHistAvg = imHistAvg + imhist(g1); %add at all level 
end
imHistAvg % = imHistAvg/N

% loops trough all images to find one whose intensity histogram's mean is
% closest to the average one
% imHistFinal = imhist(imcomplement( imread( sprintf( fpat , 1 ) ) ) )
imHistFinal = imhist(f1); 
diff = abs(mean(imHistAvg) - mean(imHistFinal))
for i = 2:N
	g = imread( sprintf( fpat , i ) );
    g1 = imcomplement( g );
    graph = imhist(g1);
    delta = abs(mean(imHistAvg) - mean(imhist(g1))); %ends up being always the same number
    if delta < diff 
        imHistFinal = imhist(g1);
        diff = delta
        n = i
    end
end
imHistFinal

% loops through all images to set their instensity histogram as 
% imHistFinal and remove the jittering
for i = 1:N
	g = imread( sprintf( fpat , i ) );
	fout = 	sprintf( opat, i )
	[out Greg] = dftregistration( fft2(f), fft2(g), 5 );	
	Greg = imcomplement( mat2gray( abs( ifft2( Greg ) ) ) );
    Greg = histeq(Greg, imHistFinal);
	imwrite( Greg, fout, 'png' );
    %imwrite( imresize( g , sc ) ,ucname,'gif','WriteMode','append');
	%imwrite( imresize( Greg , sc ) ,cname,'gif','WriteMode','append');
end