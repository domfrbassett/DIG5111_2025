function [b, a] = biquadEQCoefficients(Fs, fc, Q, dBgain, filterType, customSpecs)
    % Check if customSpecs are provided
    if nargin < 6
        customSpecs = [];
    end

    % If customSpecs are given, use fdesign to create the filter
    if ~isempty(customSpecs)
        Fp = customSpecs.Fp / (Fs / 2);  % Normalized passband frequency
        Fst = customSpecs.Fst / (Fs / 2); % Normalized stopband frequency
        Apass = customSpecs.Apass;        % Passband ripple (dB)
        Astop = customSpecs.Astop;        % Stopband attenuation (dB)
        filterMethod = customSpecs.Method; % Filter design method (e.g., 'butter')

        % Switch based on filter type for fdesign usage
        switch filterType
            case 'LPF'
                filtspec = fdesign.lowpass('Fp,Fst,Ap,Ast', Fp, Fst, Apass, Astop);
            case 'HPF'
                filtspec = fdesign.highpass('Fst,Fp,Ast,Ap', Fst, Fp, Astop, Apass);
            case 'BPF'
                filtspec = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2', ...
                    Fst(1), Fp(1), Fp(2), Fst(2), Astop(1), Apass, Astop(2));
            case 'Notch'
                filtspec = fdesign.bandstop('Fp1,Fst1,Fst2,Fp2,Ap,Ast,Ap', ...
                    Fp(1), Fst(1), Fst(2), Fp(2), Apass, Astop, Apass);
            otherwise
                error('Unsupported filter type for custom design.');
        end

        % Create the filter specification object
        filtObj = design(filtspec, filterMethod);

        % Convert filter object to coefficients
        [b, a] = tf(filtObj);
        return;
    end

    w0 = 2 * pi * fc / Fs;
    cos_w0 = cos(w0);
    sin_w0 = sin(w0);
    alpha = sin_w0 / (2 * Q);
    A = 10^(dBgain/40);

    if strcmp(filterType, 'LPF')
        b0 = (1 - cos_w0) / 2;
        b1 = 1 - cos_w0;
        b2 = (1 - cos_w0) / 2;
        a0 = 1 + alpha;
        a1 = -2 * cos_w0;
        a2 = 1 - alpha;
    elseif strcmp(filterType, 'HPF')
        b0 = (1+cos_w0) / 2;
        b1 = -(1 + cos_w0);
        b2 = (1 + cos_w0) / 2;
        a0 = 1 + alpha;
        a1 = -2 * cos_w0;
        a2 = 1 - alpha;
    elseif strcmp(filterType, 'BPF (Const Skirt Gain)')
        b0 = (sin_w0/2);
        b1 = 0;
        b2 = -(sin_w0/2);
        a0 = 1 + alpha;
        a1 = -2*cos_w0;
        a2 = 1 - alpha;
    elseif strcmp(filterType, 'BPF (0dB Peak Gain)')
        b0 = alpha;
        b1 = 0;
        b2 = -alpha;
        a0 = 1 + alpha;
        a1 = -2*cos_w0;
        a2 = 1 - alpha;
    elseif strcmp(filterType, 'Notch')
        b0 = 1;
        b1 = -2*cos_w0;
        b2 = 1;
        a0 = 1 + alpha;
        a1 = -2*cos_w0;
        a2 = 1 - alpha;
    elseif strcmp(filterType, 'APF')
        b0 = 1 - alpha;
        b1 = -2*cos_w0;
        b2 = 1 + alpha;
        a0 = 1 + alpha;
        a1 = -2*cos_w0;
        a2 = 1 - alpha;
    elseif strcmp(filterType, 'peakingEQ')
        b0 = 1 + (alpha*A);
        b1 = -2*cos_w0;
        b2 = 1 - (alpha*A);
        a0 = 1 + (alpha/A);
        a1 = -2*cos_w0;
        a2 = 1 - (alpha/A);
    elseif strcmp(filterType, 'lowShelf')
        b0 = A * ((A+1) - (A-1) * cos_w0 + 2 * sqrt(A) * alpha);
        b1 = 2 * A * ((A-1) - (A+1) * cos_w0);
        b2 = A * ((A+1) - (A-1) * cos_w0 - 2 * sqrt(A) * alpha);
        a0 = (A+1) + (A-1) * cos_w0 + 2 * sqrt(A) * alpha;
        a1 = -2 * ((A-1) + (A+1) * cos_w0);
        a2 = (A+1) + (A-1) * cos_w0 - 2 * sqrt(A) * alpha;
    elseif strcmp(filterType, 'highShelf')
        b0 = A * ((A+1) + (A-1) * cos_w0 + 2 * sqrt(A) * alpha);
        b1 = -2 * A * ((A-1) + (A+1) * cos_w0);
        b2 = A * ((A+1) + (A-1) * cos_w0 - 2 * sqrt(A) * alpha);
        a0 = (A+1) - (A-1) * cos_w0 + 2 * sqrt(A) * alpha;
        a1 = 2 * ((A-1) - (A+1) * cos_w0);
        a2 = (A+1) - (A-1) * cos_w0 - 2 * sqrt(A) * alpha;
    end

    a = [a0, a1, a2] / a0;
    b = [b0, b1, b2] / a0;
end