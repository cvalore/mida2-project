syms vdot v psi alfa psidot alfadot FxF FxR FyF FyR delta m Fa a b I ALFAF ALFAR Fr
eqs = [    vdot*cos(psi+alfa)-v*(psidot+alfadot)*sin(psi+alfa)== ... 
            (FxF*cos(psi+delta)+FxR*cos(psi)-FyF*sin(psi+delta)-FyR*sin(psi)-Fa*cos(alfa+psi)-Fr*cos(psi)*0.5-Fr*cos(psi+delta)*0.5)/m , ...
            ...
            vdot*sin(psi+alfa)+v*(psidot+alfadot)*cos(psi+alfa)== ... 
            (FxF*sin(psi+delta)+FxR*sin(psi)+FyF*cos(psi+delta)+FyR*cos(psi)-Fa*sin(alfa+psi)-Fr*sin(psi)*0.5-Fr*sin(psi+delta)*0.5)/m     ];
        
S = solve(eqs, [vdot alfadot]);

%body
VDOT = simplify(S.vdot)
ALFADOT = simplify(S.alfadot)
PSIDOTDOT = (FxF*a*sin(delta)+FyF*a*cos(delta)-FyR*b)/I

%tyres slip angles

ALFAF = atan((v*sin(alfa)+a*psidot)/(v*cos(alfa)))-delta
ALFAR = atan((v*sin(alfa)-b*psidot)/(v*cos(alfa)))