function x = BFGSsolve(critFunc,init,gradTolerance,displayIter)
    x = init;
    [o,g] = critFunc(x);
    iter = 1;
    invHess = eye(numel(init));
    if displayIter == true
        fprintf('|Iteration|Function value|Step size|Gradient size|\n');
        fprintf('|---------|--------------|---------|-------------|\n');
    end
    while (norm(g) > gradTolerance)
        % search direction
        dir = - invHess*g;
        % line search
        alpha = 1;
        beta = 0.5;
        sigma = 0.0001;
        step = dir*alpha;
        xNew = x+step;
        [oNew,gNew] = critFunc(xNew);
        %cond = -sigma*g'*dir;
        cond = sigma*(g'*g);
        while (o - oNew < alpha*cond)
            alpha = alpha*beta;
            step = dir*alpha;
            xNew = x + step;
            [oNew,gNew] = critFunc(xNew);
        end
        % Hessian approx. update
        y = gNew - g;
        scale = step'*y;
        invHess = invHess + (scale+y'*invHess*y)/(scale^2)*(step*step') - ...
            (invHess*y*step'+step*y'*invHess)/scale;
        % status
        if displayIter == true
            fprintf('|%9d|%14.4f|%9.5f|%13.4e|\n',iter,o,alpha,norm(gNew));
        end
        % next step
        o = oNew;
        g = gNew;
        x = xNew;
        iter = iter + 1;
    end
end