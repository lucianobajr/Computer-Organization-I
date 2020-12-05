all:
	gcc main.c menu.c assortment.c  -o main -fopenmp
run:
	./main

valgrind:
	valgrind --tool=cachegrind ./main	

perf:
	sudo perf stat -e task-clock,cycles,instructions,cache-references,cache-misses  ./main	

valgrind-2:
	valgrind --leak-check=full ./main

clean:
	rm main