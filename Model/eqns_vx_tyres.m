syms xdot a b psidot psi ydot vxR vxF delta


vxR = (xdot + b*psidot*sin(psi))*cos(psi) + (ydot - b*psidot*cos(psi))*sin(psi);

vxF = (xdot - b*psidot*sin(psi))*cos(psi+delta) + (ydot + a*psidot*cos(psi))*sin(psi+delta);

simplify(vxR)
simplify(vxF)
