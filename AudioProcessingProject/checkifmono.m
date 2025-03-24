function isMono = checkifmono(audioFile)
    % Check if the given audio file is mono or stereo
    % audioFile: Path to the audio file (WAV format)
    % Returns: true if mono, false if stereo

    % Read the audio file
    [x, ~] = audioread(audioFile);

    % Determine the number of channels
    [~, numChannels] = size(x);

    if numChannels == 1
        disp('Mono audio detected.');
        isMono = true;
    elseif numChannels == 2
        disp('Stereo audio detected.');
        isMono = false;
    else
        error('Unsupported audio format. Only mono or stereo files are supported.');
    end
end