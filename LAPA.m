%Connor Warden
%PA_4

% Laplace Equation by iteration

side_x = 25; % Define the X dimension length
side_y = 25; % Define the Y dimension length
i_num = 1000; % Number of iterations
V = zeros(side_x,side_y);

% b_c = 0; % boundary conditions

for k = 1:i_num
    for i = 1:side_x
        for j = 1:side_y
            if i == 1 
                V(i, j) =  1;
            elseif i == side_x
                V(i, j) =  0;
            elseif j == 1 % consider 3 sides
                V(i, j) =  (V(i + 1, j) + V(i - 1, j)+ V(i, j + 1)) * 0.33;
            elseif j == side_y % consider 3 sides
                V(i, j) =  (V(i + 1, j) + V(i - 1, j)+ V(i, j - 1)) * 0.33;
            else
                V(i, j) = (V(i + 1, j) + V(i - 1, j)+ V(i, j + 1) + V(i, j - 1)) * 0.25; 
            end 
        end
    
        if mod(k,50) == 0
            surf(V')
            pause(0.05)
        end
    end
end

Z = imboxfilt(V,3);

[Ex,Ey] = gradient(Z);

figure 
quiver(-Ey', -Ex', 1)



