function filter_audio(inputFile, outputFile, filterType, fc, Q, dBgain, Fs)
    % Read the audio file
    [signal, fs] = audioread(inputFile);
    if nargin < 7
        Fs = fs; % Use audio file's sample rate if not specified
    end
    
    % Design the filter using biquad function
    [b, a] = biquadEQCoefficients(Fs, fc, Q, dBgain, filterType);

    % Apply the filter to the audio signal
    filteredSignal = filter(b, a, signal);

    % Write the filtered audio to file
    audiowrite(outputFile, filteredSignal, Fs);

    % Plot frequency response
    plot_filter_response(signal, filteredSignal, Fs);
end