data = load('./data/data--one-feature.txt');
x = data(:,1);
y = data(:,2);
m = length(y);

% Create candidate values for theta_one
theta_one = [-10:0.1:10];

% Initialize results of cost function J
J = zeros(length(theta_one), 1);

% Calcuate cost and plot results

for i = 1:length(theta_one)
  theta = theta_one(i);
  h = x * theta;
  error = h - y;
  J(i) = (1 / (2 * m)) * sum(error.^2);
end

hold on;
plot(theta_one, J);
hold off;