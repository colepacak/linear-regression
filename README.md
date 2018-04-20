# Linear Regression

![Plot for one feature](./images/plot--one-feature.jpg)

## Goal: Find the relationship between the x and y values.

## Cost Function
The purpose of the cost function is to measure the accuracy of various hypotheses. To start, we'll try out a range of values for the slope and skip the y-intercept for now, calling this range &theta;<sub>1</sub>. For every slope, we can sum the errors - or the distance between that line and each coordinate - and by comparing the sums derived from a wide variety of &theta;, we can then find the best fit.

Here's the equation:

<img src="https://latex.codecogs.com/svg.latex?J(\theta_{1})=\frac{1}{2m}\sum_{i=1}^{m}(x\cdot&space;\theta_{1}-y)^2" title="J(\theta_{1})=\frac{1}{2m}\sum_{i=1}^{m}(x\cdot \theta_{1}-y)^2" />

## Cost Function - Slope only
Using `./cost-function--slope-only.m`, I created a vector &theta;<sub>1</sub> using a range of -10 to 10 at increments of 0.1. For each one of these values, I calculated the mean squared error and loaded up the result vector, J. Now, we can plot the relationship between &theta;<sub>1</sub> and J.

![Plotting the relationship between theta and J](images/cost-function--slope-only--theta-one-vs-j.jpg)

The values at the bottom of the parabola are better fits than values higher up, because those results reflect lower sums when calculating the mean squared error. Just eyeballing it, we can see that when &theta;<sub>1</sub> is around 0.7, the sum of the errors from that line to all of the coordinates is the least.

![Eyeballing the best fit slope.](images/cost-function--slope-only--theta-one-vs-j--eyeballing-it.jpg)

Now, we could dig around in the result vector to find the lowest value, or we could make a machine do it.

## Gradient Descent
The goal of gradient descent is to find the minimum. In the case of plotting &theta;<sub>1</sub> vs J, just like our eye chooses a point on the graph and then follows it down until it finds the bottom, so gradient descent starts with a coordinate as its guess and then proceeds to update &theta;<sub>1</sub> as J gets lower and lower.

There are a few ways that this could conceivably be done. One way would be to take a guess at &theta;<sub>1</sub>, find its corresponding J, then subtract some constant value from &theta;<sub>1</sub>, calculate the new J and compare it to the previous J. If the new J is less than the old J, proceed. Once the new J is greater, you'd stop because you may have found a minimum.

Gradient descent is a bit more elegant in that it uses the derivative of J. When a local minimum is found, the derivative will equal 0 and prevent you from continuing. However, in my limited experience, I've found that adding a check to see if the derivative has reached a very small value can be helpful, in addition to limiting the iterations.

Here's the equation for updating &theta;<sub>1</sub>.

<img src="https://latex.codecogs.com/svg.latex?\theta_{1}:=\theta_{1}-\alpha&space;\frac{1}{m}\sum_{i=1}^{m}((x\cdot&space;\theta_{1}-y)x)" title="\theta_{1}:=\theta_{1}-\alpha \frac{1}{m}\sum_{i=1}^{m}((x\cdot \theta_{1}-y)x)" />

The meat of this is equation is the derivative of the cost function, which is shown below. Once that part is understood, you're on your way.

<img src="https://latex.codecogs.com/svg.latex?\frac{1}{m}\sum_{i=1}^{m}((x\cdot&space;\theta_{1}-y)x)" title="\frac{1}{m}\sum_{i=1}^{m}((x\cdot \theta_{1}-y)x)" />

The slope gradually decreases it approaches zero and ensures we won't overshoot the minimum. The &alpha; is there to reduce the value of the derivative so that we don't instantly overshoot the minimum. Using `./gradient-descent--slope-only.m`, we can visualize the result:

![Plotting gradient descent](images/gradient-descent--slope-only.jpg)

The program outputs to the terminal that the minimum for &theta;<sub>1</sub> is 0.802539, so not far off from our previous prediction.