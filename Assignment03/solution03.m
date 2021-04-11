% Plot profiles
load pressure_displacement_profiles

fig1=figure;
%the groups of two are put as input for each of the y slots, while the x is the same
[hAx,hLine1,hLine2] = plotyy(initial.x,[-initial.cp -optimal.cp],initial.x,[initial.disp optimal.disp]); 
%these 4 lines of code set 
set(hAx(1),'YLim',[-1.2 1])             
%the vertical limits and tick frequency
set(hAx(2),'YLim',[-0.1 0.6])           
set(hAx(1),'ytick',[-1.2:0.2:1]);       
set(hAx(2),'ytick',[-0.1:0.1:0.6]);     

%set the lines to the given style 
set(hLine1(1),'linestyle','-','Color','b','linewidth',2);       
set(hLine1(2),'linestyle',':','Color','b','linewidth',2);     
%[0 0.5 0] is rgb for dark green, b is blue
%- is solid line and : is dotted line
set(hLine2(1),'linestyle','-','Color',[0 0.5 0],'linewidth',2); 
set(hLine2(2),'linestyle',':','Color',[0 0.5 0],'linewidth',2);

%label is written in latex format.
ylabel(hAx(1),'$-C_p$','interpreter','latex') 
% label is written in latex format.
ylabel(hAx(2),'Distance transverse to air foil','interpreter','latex') 
 % sets the color of vertical limits and ticks.
set(hAx,{'ycolor'},{'b';[0 0.5 0]})    
 % the legend (the part where the names for lines is written) is written in latex format.
legend([hLine1(1);hLine2(1);hLine1(2);hLine2(2)],'Initial $(C_p)$','Initial (Shape)','Optimal $(C_p)$','Optimal (Shape)','interpreter','latex','Location','best');


