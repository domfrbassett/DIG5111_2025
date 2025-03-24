function dft_analysis(audioFile, plotType, channel, savePath)
    % Read the audio file
    [x, fs] = audioread(audioFile);

    % Check if the audio is mono or stereo using the checkifmono function
    isMono = checkifmono(audioFile);
    
    % Determine left and right channels
    if isMono
        leftChannel = x;
        rightChannel = [];
        disp('Mono audio detected.');
    else
        leftChannel = x(:, 1);
        rightChannel = x(:, 2);
        disp('Stereo audio detected.');
    end

    % Choose the channel to analyze
    switch channel
        case 'combined'
            % Combine left and right channels if stereo, otherwise just the mono channel
            signal = leftChannel;
            if ~isMono
                signal = (leftChannel + rightChannel) / 2;
                disp('Performing DFT on combined stereo channels.');
            else
                disp('Performing DFT on mono signal.');
            end
            analyze_channel(signal, fs, plotType, savePath, 'Overall');
        
        case 'left'
            % Use left channel directly
            analyze_channel(leftChannel, fs, plotType, savePath, 'Left');
        
        case 'right'
            % Check for mono and throw error if right channel is requested
            if isMono
                error('Right channel requested, but audio is mono.');
            end
            analyze_channel(rightChannel, fs, plotType, savePath, 'Right');
        
        otherwise
            error('Invalid channel specification. Use "combined", "left", or "right".');
    end
end

function analyze_channel(x, fs, plotType, savePath, channelName)
    % Length of the signal
    N = length(x);

    % Preallocate DFT output
    X = zeros(1, N);
    
    % Compute DFT
    for k = 1:N
        for n = 1:N
            X(k) = X(k) + x(n) * exp(-1i * 2 * pi * (k-1) * (n-1) / N);
        end
    end

    % Compute frequency vector
    f = (0:N-1) * (fs / N);

    % Compute magnitude and phase spectra
    Xmag = abs(X);
    Xphase = angle(X);

    % File prefix for saving plots
    filePrefix = fullfile(savePath, strcat(channelName, '_'));

    % Plot the magnitude spectrum
    if strcmp(plotType, 'magnitude') || strcmp(plotType, 'both')
        figure('Visible', 'off'); % Do not display the plot
        plot(f, Xmag);
        title(['Magnitude Spectrum (' channelName ' Channel)']);
        xlabel('Frequency (Hz)');
        ylabel('Magnitude');
        xlim([0 fs/2]);
        saveas(gcf, [filePrefix 'magnitude.png']);
        close;
    end

    % Plot the phase spectrum
    if strcmp(plotType, 'phase') || strcmp(plotType, 'both')
        figure('Visible', 'off'); % Do not display the plot
        plot(f, Xphase);
        title(['Phase Spectrum (' channelName ' Channel)']);
        xlabel('Frequency (Hz)');
        ylabel('Phase (radians)');
        xlim([0 fs/2]);
        saveas(gcf, [filePrefix 'phase.png']);
        close;
    end

    % Print information
    disp(['Processed ', channelName, ' channel.']);
    disp(['Sampling Frequency: ', num2str(fs), ' Hz']);
    disp(['Signal Length: ', num2str(N), ' samples']);
    disp(['Frequency Resolution: ', num2str(fs / N), ' Hz']);
end
