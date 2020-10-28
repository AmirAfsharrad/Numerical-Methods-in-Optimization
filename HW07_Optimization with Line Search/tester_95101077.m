%% Rosenbrock/SD
global func_count;
func_count = 0; 

global grad_count;
grad_count = 0;

global Hess_count;
Hess_count = 0;

f = @rosenbrock_95101077;
gf = @rosenbrock_grad_95101077;
Hf = @rosenbrock_Hess_95101077;

[x_min, f_min, iter] = SD_Wolfe_95101077(f, gf, [1;2], 10^-3)

func_count
grad_count
Hess_count
%% Rosenbrock/Newton
global func_count;
func_count = 0; 

global grad_count;
grad_count = 0;

global Hess_count;
Hess_count = 0;

f = @rosenbrock_95101077;
gf = @rosenbrock_grad_95101077;
Hf = @rosenbrock_Hess_95101077;

[x_min, f_min, iter] = Newton_Wolfe_95101077(f, gf, Hf, [1;2], 10^-3)

func_count
grad_count
Hess_count
%% Powel/SD
global func_count;
func_count = 0; 

global grad_count;
grad_count = 0;

global Hess_count;
Hess_count = 0;

f = @powel_95101077;
gf = @powel_grad_95101077;
Hf = @powel_Hess_95101077;

[x_min, f_min, iter] = SD_Wolfe_95101077(f, gf, [1;2;2;2], 10^-3)

func_count
grad_count
Hess_count
%% Powel/Newton
global func_count;
func_count = 0; 

global grad_count;
grad_count = 0;

global Hess_count;
Hess_count = 0;

f = @powel_95101077;
gf = @powel_grad_95101077;
Hf = @powel_Hess_95101077;

[x_min, f_min, iter] = Newton_Wolfe_95101077(f, gf, Hf, [1;2;2;2], 10^-3)

func_count
grad_count
Hess_count

