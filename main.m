clear
clf
addpath('PSO')
addpath('UAV')
addpath('SWARM')

% Save a gif with the results?
savegif = true;

% Particles count
N_Particles = 50;

% Iterations
N_Iterations = 750;

% Agent count (Physical count of robots, each particle consists of
% N_Agent agents)
N_Agents = 7;
%%
A=plotmap()
[coord,uas]=getboundary(A,N_Agents)
%%
%coord;
%[uas.x, uas.y]=ginput;
% N_Agents = size(x,1);
%%
% Starting point and Goal points moved to individual functions for clarity
%Path.Start = createPathStartingPoints(N_Agents,'calesita', 0.05);
Path.Start = startpoints(N_Agents,'startpso', .5);
Path.Goal = createPathGoals(N_Agents, uas.x,uas.y, 'startpso', .3, 0);
%axis([0 1 0 1]);
%axis square
h_goals = PlotStartingPointandGoals(N_Agents, Path);
%plotboundary(x,y)
%% Initialize the Swarm and PSO
s = SWARM();
for k = 1:N_Agents
    s.AddAgent(UAV(Path.Start.state(:, k)));
end

% Initialize PSO
p = PSO(s, N_Particles, Path.Goal, @CostFcn);

%% Iterate PSO

p.Iterate();
drawnow update
%%

if savegif
    filename = 'sample-PSO-run.gif';
end
for k = 1:N_Iterations
    p.Iterate();
    
    drawnow update
    %axis([0 1 0 1])
%get gif data
    if savegif
        frame = getframe(1);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if k == 1;
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append');
        end
    end
end

