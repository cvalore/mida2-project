syms vdot v psi beta psidot alfadot FxF FxR FyF FyR delta m Fa a b I ALFAF ALFAR Fr
eqs = [    vdot*cos(psi+beta)-v*(psidot+alfadot)*sin(psi+beta)== ... 
            (FxF*cos(psi+delta)+FxR*cos(psi)-FyF*sin(psi+delta)-FyR*sin(psi)-Fa*cos(beta+psi)-Fr*cos(psi)*0.5-Fr*cos(psi+delta)*0.5)/m , ...
            ...
            vdot*sin(psi+beta)+v*(psidot+alfadot)*cos(psi+beta)== ... 
            (FxF*sin(psi+delta)+FxR*sin(psi)+FyF*cos(psi+delta)+FyR*cos(psi)-Fa*sin(beta+psi)-Fr*sin(psi)*0.5-Fr*sin(psi+delta)*0.5)/m     ];
        
S = solve(eqs, [vdot alfadot]);

%body
VDOT = simplify(S.vdot)
ALFADOT = simplify(S.alfadot)
PSIDOTDOT = (FxF*a*sin(delta)+FyF*a*cos(delta)-FyR*b)/I

%tyres slip angles

ALFAF = atan((v*sin(beta)+a*psidot)/(v*cos(beta)))-delta
ALFAR = atan((v*sin(beta)-b*psidot)/(v*cos(beta)))