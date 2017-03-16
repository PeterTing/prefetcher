EXEC = time_test_naive time_test_sse time_test_sse_prefetch test

CFLAGS = -msse2 --std gnu99 -O0 -Wall -Wextra -g

GIT_HOOKS := .git/hooks/applied

default: $(GIT_HOOKS) impl_test.o
	$(CC) $(CFLAGS) impl_test.o main_test.c -o test
#	$(CC) $(CFLAGS) -o time_test_naive -DNAIVE main.c
#	$(CC) $(CFLAGS) -o time_test_sse -DSSE main.c
#	$(CC) $(CFLAGS) -o time_test_sse_prefetch -DSSEPREFETCH main.c

%.o: %.c
	$(CC) -c $(CFALGS) $< -o $@

$(GIT_HOOKS):
	@scripts/install-git-hooks
	@echo

clean:
	$(RM) $(EXEC) main 
