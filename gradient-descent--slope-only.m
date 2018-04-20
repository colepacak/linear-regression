data = load('./data/data--one-feature.txt');
x = data(:,1);
y = data(:,2);
m = length(y);

% the result i want is a matrix with values for theta_one and J

% Set the first value to try for theta
theta = [8];
J = [];
iters = 500;
alpha = 0.001;

for i = 1:iters
  % First, find the result of the cost function for theta
  theta_current = theta(i);
  h = x * theta_current;
  error = h - y;
  J(i) = (1 / (2 * m)) * sum(error.^2);

  % Next, use gradient descent to calculate the next value for theta using the derivative of J to find the slope at theta.
  slope = (1 / m) * (theta_current * x - y)' * x;

  if (slope < 0.001)
    % Print the index to the terminal to know how long it needed to run.
    fprintf('Last iteration index: %i\n', i);
    break;
  endif


  theta(i + 1) = theta_current - alpha * slope;
end

% Remove extra theta value so that the lengths of theta and J are equal.
% This is only necessary if a break takes place in the for loop that calculates gradient descent.
if (length(theta) != length(J))
  theta = theta(:, 1:end - 1);
endif

fprintf('Minimum for theta: %i\n', theta(length(theta)));

plot(theta, J, 'x');
