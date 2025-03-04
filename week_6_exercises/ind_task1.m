% Define an example input signal and impulse response
Signal = [2, 3, 1, 4]; % Example signal
IR = [1, -1, 2];       % Example impulse response

% Compute convolution using custom function
CustomOutput = my_convolution(Signal, IR);

% Compute convolution using MATLAB's built-in function
MatlabOutput = conv(Signal, IR);

% Display results
disp('Custom Convolution Output:');
disp(CustomOutput);

disp('MATLAB conv() Output:');
disp(MatlabOutput);

% Verify if both methods produce the same result
if isequal(CustomOutput, MatlabOutput)
    disp('Success: Custom function matches MATLAB''s conv() function!');
else
    disp('Error: Outputs do not match. Check implementation.');
end