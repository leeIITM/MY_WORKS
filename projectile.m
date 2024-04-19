%making simulation of trajectory of projectile
g = 9.81;
u = input("Enter the velocity: ");
thet = input("Enter the angle of projection in degree: ");
theta=thet*2*pi/180

t = linspace(0, (2 * u * sin(theta)) / g, 100); % Changed the third argument to 1000 for a smoother plot

mypic_filenames = cell(length(t), 1); % Initialize the cell array
max_x=u*cos(theta)*max(t);
max_y=max((u * sin(theta) * t) - 0.5 * g * (t.^2));

for i = 1:length(t)
    x = u * cos(theta) * t(i);
    y = (u * sin(theta) * t(i)) - 0.5 * g * (t(i) * t(i));

    plot(x, y, "ro");
    xlabel('Distance');
    ylabel('Height');
    title('Simulation of Projectile Motion');
    axis([0 max_x 0 max_y]);

    % Create the filename dynamically
    filename = sprintf('mypic_%03d.jpg', i); % Padded the index with leading zeros

    % Save the plot as an image with the dynamic filename
    print('-djpeg', '-r80', filename);

    % Store the filename in the cell array
    mypic_filenames{i} = filename;
end
% Initialize VideoWriter object
v = VideoWriter('output.mp4', 'MPEG-4');
open(v);

% Loop through image sequence
for i = 1:length(mypic_filenames)
    % Read image from file
    img = imread(mypic_filenames{i});

    % Write image to video
    writeVideo(v, img);
end

% Close the video writer
close(v);

