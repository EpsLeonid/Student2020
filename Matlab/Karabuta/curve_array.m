function curve_array = expa(tau1, tau2, A, t)
    for i = 1:length(t)
        if(t(i) < 0)
            curve_array(i) = 0;
        else
            curve_array(i) = A * (exp(-t(i)/tau1) - exp(-t(i)/tau2));
        end
    end