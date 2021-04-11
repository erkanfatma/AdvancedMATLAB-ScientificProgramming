
%X and Y is our 2d plane. 
[X,Y,R,P,V1,V2] = get_all_quantities(); 

 %this is taken from the previous question. The airfoil used in this question is been accessed here. 
load pressure_displacement_profiles
 
%there is data for every coordinate, however using all of them makes the plot too crowded. 
%So instead, spaces specified by k is used between coordinates which are selected for starting points of the arrows.
k=20; 

%this code makes plotting multiple things on top of them possible
hold on 
title('Flow Field')

%the arrows are created using k spaces between each of them (k spaces horizontally or vertically)
quiver(X(1:k:end),Y(1:k:end),V1(1:k:end),V2(1:k:end)) 

%the airfoil is plotted here.
plot(optimal.x,optimal.disp,'k-');

%inside the airfoil is filled, as there would be no air motion within the airfoil. 
fill(optimal.x,optimal.disp,'w'); 

%these are the  starting positions of the given streamlines(or the way air moves from the leftmost to the rightmost).
 %Because of the way the streamlines are created, there is one that needs to be deleted. Here this is done.
startx = -2;              
starty = [-0.6:0.1:0.6];  
starty(7)=[];      

 %all of the streamlines are drawn here using a loop
for i=1:12
    streamline(X,Y,V1,V2,startx,starty(i))
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Density%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

%this creates a new plot, so multiple plots can be shown.
figure 
title('Density')
hold on

%here the colormap is changed to the one at the question.
colormap(jet) 

%here the density is shown by different color shades.
contourf(X,Y,R); 

 %airfoil is drawn here
plot(optimal.x,optimal.disp,'k-');

 %flow field is drawn as requested by the question.
quiver(X(1:k:end),Y(1:k:end),V1(1:k:end),V2(1:k:end),'b')

 %airfoil's inside is filled here, as there would be no air within the airfoil
fill(optimal.x,optimal.disp,'w');

%this code makes the colorbar at the right appear.
hc = colorbar; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Pressure%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%pressure data instead of density data.
figure
title('Pressure')
hold on
colormap(jet)
contourf(X,Y,P);
plot(optimal.x,optimal.disp,'k-');
quiver(X(1:k:end),Y(1:k:end),V1(1:k:end),V2(1:k:end),'b')
fill(optimal.x,optimal.disp,'w');
hc = colorbar;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%Velocity Magnitude%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
figure
title('Speed')
hold on
colormap(jet)

%here the total magnitude is calculated
VM = sqrt(V1.^2.+V2.^2);   
contourf(X,Y,VM);
hold on
plot(optimal.x,optimal.disp,'k-');
quiver(X(1:k:end),Y(1:k:end),V1(1:k:end),V2(1:k:end),'b')
fill(optimal.x,optimal.disp,'w');
hc = colorbar;
