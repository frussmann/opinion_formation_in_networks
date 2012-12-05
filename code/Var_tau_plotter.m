%%This is a simple a data-plotter of data generated by main_script.m

N_range = [500 200];           %Choose curves to be compared
%k_range = [4 8];                %Choose curves to be compared
col=hsv(length(N_range));       %Creates as many colors as there are curves to be plotted
j=1;                            %Manually create integer counter for the Phi-loop
legcell=cell(1,length(N_range));%Create string cell for legend in graph

for N = N_range             %Choose curves to be compared
    %k_avg_set = k_range 
    %Make sure to comment the variable that is varied in the loop. These
    %variables are merely necessary for reading the proper data and not
    %used for caculations.
    
    %N = 500;
    k_avg_set = 4;
    gamma = 10;
    ii = 100;
    phi_range = [0.1:0.1:0.9]; %Explicitly define this vector outside of the for-loop such that it can be used for plotting.
    
    %This loop extracts the order parameter op from each data set and puts
    %it into Var_tau
    Var_tau = [];    %Initialize explanatory variable, the order parameter.
    for phi=phi_range
        str2=['N',num2str(N),'k',num2str(k_avg_set),'gamma',num2str(gamma),'Phi',num2str(phi),'Runs',num2str(ii)];
        load(['Data/',str2,'/AllFinVar.mat']);
        Var_tau = [Var_tau std(tt)/mean(tt)]; %Concatenate the value of the size of the biggest cluster for a given phi. The command finds the 1 last non-zero entry of s.
    end
    
    %Plot curves into graph that is held open.
    plot(phi_range, Var_tau, '-o','color',col(j,:)) 
    legcell{j}=['N = ',num2str(N)]; %Create cell for data range (e.g. N_range or k_range)
    j=j+1;      %Manually increment loop counter. This is just for getting different colors in the plot.
    hold on;
end
hold off;   

%%Add labels and legend to graph
xlabel('Reconnection probability \Phi');
ylabel('Variation of convergence time   \tau');
legend(legcell);
grid on;