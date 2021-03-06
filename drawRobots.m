function drawRobots(robots, map, x, y, theta)
% Draws the two robots onto the world map. Assumes the figure is already
% created.
% 
% INPUTS
% robots: struct containing robot parameters.
% map: the world map.
% x, y: x-y position of the red robot in world coordinates.
% theta: angle of the linkage from North (in world frame) going clockwise.
% I.e pi/2 is directly East.
%
% USAGE
% robots.radius = 5;
% robots.linkage = 15;
% drawRobots(robots, 70, 70, pi/2);

    % Initialize constants.
    robot_radius = robots.radius*map.space(1);
    linkage_length = robots.linkage*map.space(1);
    
    % Scale the x and y to be in map coordinates.
    x = x*map.space(2);
    y = y*map.space(1);
    
    % Equations for a circular robot.
    t = 0:.1:2*pi+0.2;
    xs = robot_radius*sin(t);
    ys = robot_radius*cos(t);
        
    % Draw the first robot.
    plot(xs + x, ys + y, 'r');
    
    % Draw the second robot.
    x2 = x + linkage_length*sin(theta);
    y2 = y + linkage_length*cos(theta);
    plot(xs + x2, ys + y2, 'c');
    
    % Draw the linkage.
    plot([x x2], [y y2], 'bx-', 'LineWidth', 2);

end