using JuMP, GLPK
#모델 설정
m = Model(GLPK.Optimizer)
#변수 설정
@variable(m, 0<=x<=2)
@variable(m, 0<=y<=30)
#목적함수 설정
@objective(m, Max, 5x+3*y) # *기호 안써도되는데 웬만하면 쓰자
#제약조건 설정
@constraint(m, 1x+5y<=3.0)

JuMP.optimize!(m)
println("Objective value: ", JuMP.objective_value(m))
println("x = ", JuMP.value(x))
println("y = ", JuMP.value(y))
