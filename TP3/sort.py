import random
matricula = [3858, 3886, 3897]
to_do = ["adder", "alu", "data_memory", "imm_gen",
         "instruction_memory", "mux", "pc", "reg_file","control"]
select_matricula = random.choice(matricula)
matricula.remove(select_matricula)

select_component_1 = random.choice(to_do)
to_do.remove(select_component_1)
select_component_2 = random.choice(to_do)
to_do.remove(select_component_2)
select_component_3 = random.choice(to_do)
to_do.remove(select_component_3)

print(select_matricula, "tem que fazer = ", select_component_1+",",
      select_component_2+" e " + select_component_3)


select_matricula = random.choice(matricula)
matricula.remove(select_matricula)

select_component_1 = random.choice(to_do)
to_do.remove(select_component_1)
select_component_2 = random.choice(to_do)
to_do.remove(select_component_2)
select_component_3 = random.choice(to_do)
to_do.remove(select_component_3)

print(select_matricula, "tem que fazer = ", select_component_1+",",
      select_component_2+" e " + select_component_3)


select_matricula = random.choice(matricula)
matricula.remove(select_matricula)
select_component_1 = random.choice(to_do)
to_do.remove(select_component_1)
select_component_2 = random.choice(to_do)
to_do.remove(select_component_2)
select_component_3 = random.choice(to_do)
to_do.remove(select_component_3)

print(select_matricula, "tem que fazer = ", select_component_1+",",
      select_component_2+" e " + select_component_3)
