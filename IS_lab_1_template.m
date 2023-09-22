% Classification using perceptron

% Reading apple images
A1=imread('apple_04.jpg');
A2=imread('apple_05.jpg');
A3=imread('apple_06.jpg');
A4=imread('apple_07.jpg');
A5=imread('apple_11.jpg');
A6=imread('apple_12.jpg');
A7=imread('apple_13.jpg');
A8=imread('apple_17.jpg');
A9=imread('apple_19.jpg');

% Reading pears images
P1=imread('pear_01.jpg');
P2=imread('pear_02.jpg');
P3=imread('pear_03.jpg');
P4=imread('pear_09.jpg');

% Calculate for each image, colour and roundness
% For Apples
% 1st apple image(A1)
hsv_value_A1=spalva_color(A1); %color
metric_A1=apvalumas_roundness(A1); %roundness
% 2nd apple image(A2)
hsv_value_A2=spalva_color(A2); %color
metric_A2=apvalumas_roundness(A2); %roundness
% 3rd apple image(A3)
hsv_value_A3=spalva_color(A3); %color
metric_A3=apvalumas_roundness(A3); %roundness
% 4th apple image(A4)
hsv_value_A4=spalva_color(A4); %color
metric_A4=apvalumas_roundness(A4); %roundness
% 5th apple image(A5)
hsv_value_A5=spalva_color(A5); %color
metric_A5=apvalumas_roundness(A5); %roundness
% 6th apple image(A6)
hsv_value_A6=spalva_color(A6); %color
metric_A6=apvalumas_roundness(A6); %roundness
% 7th apple image(A7)
hsv_value_A7=spalva_color(A7); %color
metric_A7=apvalumas_roundness(A7); %roundness
% 8th apple image(A8)
hsv_value_A8=spalva_color(A8); %color
metric_A8=apvalumas_roundness(A8); %roundness
% 9th apple image(A9)
hsv_value_A9=spalva_color(A9); %color
metric_A9=apvalumas_roundness(A9); %roundness

%For Pears
%1st pear image(P1)
hsv_value_P1=spalva_color(P1); %color
metric_P1=apvalumas_roundness(P1); %roundness
%2nd pear image(P2)
hsv_value_P2=spalva_color(P2); %color
metric_P2=apvalumas_roundness(P2); %roundness
%3rd pear image(P3)
hsv_value_P3=spalva_color(P3); %color
metric_P3=apvalumas_roundness(P3); %roundness
%2nd pear image(P4)
hsv_value_P4=spalva_color(P4); %color
metric_P4=apvalumas_roundness(P4); %roundness

%selecting features(color, roundness, 3 apples and 2 pears)
%A1,A2,A3,P1,P2
%building matrix 2x5
x1=[hsv_value_A1 hsv_value_A2 hsv_value_A3 hsv_value_P1 hsv_value_P2];
x2=[metric_A1 metric_A2 metric_A3 metric_P1 metric_P2];
% estimated features are stored in matrix P:
P=[x1;x2];

%A4,A5,A6,A7,A8,A9,P3,P4
xt1=[hsv_value_A4 hsv_value_A5 hsv_value_A6 hsv_value_A7 hsv_value_A8 hsv_value_A9 hsv_value_P3 hsv_value_P4];
xt2=[metric_A4 metric_A5 metric_A6 metric_A7 metric_A8 metric_A9 metric_P3 metric_P4];
% estimated features are stored in matrix Ptest for validation:
PTest=[xt1;xt2];

%Desired output vector
T=[1;1;1;-1;-1];

%% train single perceptron with two inputs and one output

% generate random initial values of w1, w2 and b
w1 = randn(1);
w2 = randn(1);
b = randn(1);

% calculate weighted sum with randomly generated parameters
e = zeros(1, 5);
% estimation equation for 5 pictures
for counter = 1:5
    cal = P(1, counter)*w1+P(2, counter)*w2+b;
    if cal > 0
        y = 1;
    else
        y = -1;
    end

    % calculate the error
    e(counter) = T(counter) - y;
end

% calculate the total error for these 5 inputs
eTotal = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));
% write training algorithm
counter = 1; % go through 5 pictures
totalCounter = 1; % how much interations for sucessful training
eta = 0.5; % training step

while eTotal ~= 0 % executes while the total error is not 0
    % calculate output for current example
    cal = P(1, counter)*w1+P(2, counter)*w2+b;
    if cal > 0
        y = 1;
    else
        y = -1;
    end

    % calculate error for current example
    eCur = T(counter) - y;
    % update parameters using current inputs ant current error
    w1 = w1 + eta*eCur*P(1, counter);
    w2 = w2 + eta*eCur*P(2, counter);
    b = b + eta*eCur;

    counter = counter + 1;
    if counter > 5
        % test how good are updated parameters (weights) on all examples used for training
        for counter = 1:5
            cal = P(1, counter)*w1+P(2, counter)*w2+b;
            if cal > 0
      	       y = 1;
            else
                y = -1;
            end

            % calculate the error
            e(counter) = T(counter) - y;
        end
        % calculate the total error for these 5 inputs
        eTotal = abs(e(1)) + abs(e(2)) + abs(e(3)) + abs(e(4)) + abs(e(5));
        counter = 1;
    end
    % increase interation counter
    totalCounter = totalCounter +1;
end
% display coeficients
disp(w1)
disp(w2)
disp(b)
disp(totalCounter)
% test coefficients on other pictures
y = zeros(1, 8);
for counter = 1:8
    cal = PTest(1, counter)*w1+PTest(2, counter)*w2+b;
    if cal > 0
        y(counter) = 1;
    else
        y(counter) = -1;
    end
end
% if these match then coefficients are correct
Ttest=[1,1,1,1,1,1,-1,-1];
if Ttest == y
    disp("It works!")
else
    disp("Bad coefficients!")
    disp(y)
end


