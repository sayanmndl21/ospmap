function  Start = startpoints(varargin)

N_Agents = varargin{1};
% InitialVelocity = 0.025;
InitialVelocity = 0.1;

if nargin == 1

if N_Agents == 3
    
    % Starting position, attitude and initial velocity
    Start.pos(:,1) = [0.1; 0.1; 0.5];
    Start.vel(:,1) = InitialVelocity ;
    Start.ang(:,1) = pi/2;
    Start.state(:,1) = [Start.pos(:,1); ...
        Start.vel(:,1); ...
        Start.ang(:,1)];
    
    % Starting position, attitude and initial velocity
    Start.pos(:,2) = [0.2; 0.1; 0.5];
    Start.vel(:,2) = InitialVelocity ;
    Start.ang(:,2) = pi/2;
    Start.state(:,2) = [Start.pos(:,2); ...
        Start.vel(:,2); ...
        Start.ang(:,2)];
    
    Start.pos(:,3) = [0.3; 0.1; 0.5];
    Start.vel(:,3) = InitialVelocity ;
    Start.ang(:,3) = pi/2;
    Start.state(:,3) = [Start.pos(:,3); ...
        Start.vel(:,3); ...
        Start.ang(:,3)];
    
else
    for k=1:N_Agents
        Start.pos(:,k) = [rand(1); rand(1); 0.5];
        Start.vel(:,k) = InitialVelocity * rand(1);
        Start.ang(:,k) = 2*pi*rand(1) - pi;
        Start.state(:,k) = [Start.pos(:,k); ...
            Start.vel(:,k); ...
            Start.ang(:,k)];
    end
end
else
        if strcmp(varargin{2}, 'startpso')
        r = varargin{3};
        d_alpha = 2*pi/N_Agents;
        for k = 1:N_Agents
            % Goal and goal size.
            
             Start.pos(:,k) = [0.5+r*cos(d_alpha*k); 0.5+r*sin(d_alpha*k); 0.5];
             Start.state(:,k) = [Start.pos(:,k);...
                 InitialVelocity * rand(1);...
                 2*pi*rand(1) - pi];

        end
    end
    
end