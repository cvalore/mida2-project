syms S0 S1 S2 S3 S4 S5
states = [S0, S1, S2, S3, S4, S5];

initState = S0;
finalState = S4;

num_episodes = 3;
episodes = [S0, S1, S3, S4; S0, S2, S5, S4; S0, S1, S2, S4; S0, S5, S3, S4];
reward = 1;
episode_counter = 1;


V_States = zeros(1, size(states, 2))

alfa = 1;
gamma = 1;
lambda = 1;

%%

for i = 1:num_episodes
    
   e = zeros(1, size(states, 2));
   s = initState;
   s_new = initState;
   
   while s ~= finalState
       s_new = episodes(1, find(episodes(episode_counter, :) == s)+1);
       delta = reward + gamma*V_States(1, find(states == s_new)) - V_States(1, find(states == s));
       e(1, find(states == s)) = 1;
       
       for j = 1:size(states, 2)
          
           V_States(1, find(states == states(1, j))) = V_States(1, find(states == states(1, j))) + alfa*delta*e(1, find(states == states(1, j)));
           e(1, find(states == states(1, j))) = gamma*lambda*e(1, find(states == states(1, j)));
       end
       
       s = s_new;
       
   end
    
end

V_States