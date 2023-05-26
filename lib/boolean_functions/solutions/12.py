import random
from itertools import combinations


def generate_random_boolean_function(args):
    boolean_function_string = ''
    for i in range(2 ** args):
        boolean_function_string += str(random.randint(0, 1))
    return boolean_function_string


def generate_truth_table(n, bullfunc):
    truth_table = []
    for i in range(2**n):
        # преобразуем номер строки в двоичный вид, дополняя ведущими нулями до длины n
        input_values = [int(digit) for digit in format(i, f'0{n}b')]
        # вычисляем значение функции на данной строке
        output_value = int(bullfunc[i])
        # добавляем строку в таблицу истинности
        truth_table.append(input_values + [output_value])
    return truth_table


n = random.randint(1, 5)
bullfunc = generate_random_boolean_function(n)
size = len(bullfunc)
flipped_truth_table = generate_truth_table(n, bullfunc)
for i in range(0, len(flipped_truth_table) // 2):
    flipped_truth_table[i][n], flipped_truth_table[size - 1 - i][n] = flipped_truth_table[size - 1 - i][n], flipped_truth_table[i][n]
for i in range(len(flipped_truth_table)):
    for j in range(n):
        if flipped_truth_table[i][j] == 1:
            flipped_truth_table[i][j] = str("a" + str(j + 1))
        else:
            flipped_truth_table[i][j] = str("b" + str(j + 1))
formatted_truth_table = []
for i in range(len(flipped_truth_table)):
    temp = []
    for j in range(n):
        temp.append(flipped_truth_table[i][j])
    formatted_truth_table.append(temp)
DNF_table = []
for i in range(len(flipped_truth_table)):
    temp = []
    for l in range(1, len(formatted_truth_table[i]) + 1):
        temp += [list(j) for j in combinations(formatted_truth_table[i], l)]
    temp.append(flipped_truth_table[i][n])
    DNF_table.append(temp)
for i in (DNF_table):
    if i[len(i) - 1] == 0:
        while len(i) != 1:
            variable_to_remove = i[0]
            if variable_to_remove != 0 or variable_to_remove != 1:
                for l in DNF_table:
                    if variable_to_remove in l:
                        l.remove(variable_to_remove)
minimal_DNFs = set()
for i in DNF_table:
    if type(i[0]) == list:
        temp = len(i[0])
        for j in i:
            if j != 1 and j != 0 and temp == len(j):
                DNF_string = ""
                for l in j:
                    if l[0] == "a":
                        DNF_string += "-x"
                        DNF_string += l[1]
                        DNF_string += ' & '
                    else:
                        DNF_string += "x"
                        DNF_string += l[1]
                        DNF_string += ' & '
                minimal_DNFs.add('('+DNF_string[0:len(DNF_string)-3]+')')
minimal_DNFs_string = ""
for m in minimal_DNFs:
    minimal_DNFs_string += m
    minimal_DNFs_string += " | "
minimal_DNFs_string = minimal_DNFs_string[:len(minimal_DNFs_string) - 3]
if bullfunc == 2 ** n * "1":
    print(1)
elif bullfunc == 2 ** n * "0":
    print(0)
else:
    print(minimal_DNFs_string)