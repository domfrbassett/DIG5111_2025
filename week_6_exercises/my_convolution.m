function Output = my_convolution (Signal, IR)

    lenSignal = length(Signal);
    lenIR = length(IR);

    Output = zeros(1, lenSignal + lenIR -1);

    for i = 1:lenSignal
        for ii = 1:lenIR
            Output(i+ii-1) = Output(i+ii-1) + Signal(i).*IR(ii);
        end
    end
end