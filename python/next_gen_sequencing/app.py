import csv
import time

t1 = time.time()
read_list = {}
coverage_list = {}
loci_list = []

print("parsing reads.csv...")
with open('python/next_gen_sequencing/puzzle_data/reads.csv') as csvfile:
    reads_reader = csv.reader(csvfile)
    next(reads_reader, None)
    for row in reads_reader:
        if f'{row[0]},{row[1]}' in read_list:
            read_list[f'{row[0]},{row[1]}'] = read_list.get(f'{row[0]},{row[1]}') + 1
        else:
            read_list[f'{row[0]},{row[1]}'] = 1

print("parsing loci.csv...")
with open('python/next_gen_sequencing/puzzle_data/loci_test.csv') as csvfile:
    loci_reader = csv.reader(csvfile)
    next(loci_reader, None)
    for row in loci_reader:
        loci_list.append(int(row[0]))
        coverage_list[int(row[0])] = 0

def binarySearch(inputList, position, read_length):
    low = 0
    high = len(inputList)
    middle = int((low + high)/2)
    while low <= high:
        middle = int((low + high)/2)
        try:
            inputList[middle]
        except IndexError:
            return None

        if int(inputList[middle]) >= position and int(inputList[middle]) < position+read_length:
            return middle

        if int(inputList[middle]) < position:
            low = middle + 1
        else:
            high = middle - 1



def coverageFinder(read_list, loci_list, coverage_list):
    for key, value in read_list.items():
        array = key.split(",")
        loci_list.sort()
        bookend = binarySearch(loci_list, int(array[0]), int(array[1]))

        if bookend:
            counter = 0
            while loci_list[bookend + counter] >= int(array[0]) and loci_list[bookend + counter] < int(array[0]) + int(array[1]):
                coverage_list[loci_list[bookend + counter]] += value
                counter += 1
                if bookend + counter >= len(loci_list):
                    break
            counter = -1
            while loci_list[bookend + counter] >= int(array[0]) and loci_list[bookend + counter] < int(array[0]) + int(array[1]):
                coverage_list[loci_list[bookend + counter]] += value
                counter -= 1
                if bookend + counter < 0:
                    break

    return coverage_list

print("calculating coverage...")
output = coverageFinder(read_list, loci_list, coverage_list)

print("writing loci.csv...")
with open('python/next_gen_sequencing/puzzle_data/loci_test.csv', 'w') as csvfile:
    writer = csv.writer(csvfile, delimiter=',')
    writer.writerow(["position","coverage"])
    for key, value in output.items():
        writer.writerow([key,value])

t2 = time.time()
time = t2 - t1
print(time)
