%%This is simply a data-plotter of data generated by main_script.m
k_avg_set = 4;
N = 500;
gamma = 10;
ii = 100;
str=['N = ',num2str(N),char(10),'k = ',num2str(k_avg_set),char(10),'\gamma = ',num2str(gamma),char(10)]; %String for figure legend

phi_range = [0.1:0.1:0.8 0.825:0.025:0.95]; %Explicitly define this vector outside of the for-loop such that it can be used for plotting.
%op = zeros(length(phi_range));

%% Plot first graph
Var_tau = [];

for phi=phi_range
    str2=['N',num2str(N),'k',num2str(k_avg_set),'gamma',num2str(gamma),'Phi',num2str(phi),'Runs',num2str(ii)];
    load(['Data/',str2,'/AllFinVar.mat']);
    Var_tau = [Var_tau std(tt)/mean(tt)]; %Concatenate 
end
plot(phi_range, Var_tau, '-o') 
hold on;

%% Plot second graph
Var_tau = [];

for phi=phi_range
    str2=['N',num2str(N),'k',num2str(8),'gamma',num2str(gamma),'Phi',num2str(phi),'Runs',num2str(ii)];
    load(['Data/',str2,'/AllFinVar.mat']);
    Var_tau = [Var_tau std(tt)/mean(tt)]; %Concatenate 
end
plot(phi_range, Var_tau, '-o','Color','green') 
hold off;

%% Label graph
xlabel('Reconnection probability  \Phi');
ylabel('Variation of convergence time   \tau');
grid on;