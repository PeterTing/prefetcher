EXEC = time_test_naive time_test_sse time_test_sse_prefetch

CFLAGS = -msse2 --std gnu99 -O0 -Wall -Wextra -g

GIT_HOOKS := .git/hooks/applied

all: $(GIT_HOOKS) main.c
	$(CC) $(CFLAGS) -o time_test_naive -DNAIVE main.c
	$(CC) $(CFLAGS) -o time_test_sse -DSSE main.c
	$(CC) $(CFLAGS) -o time_test_sse_prefetch -DSSEPREFETCH main.c

$(GIT_HOOKS):
	@scripts/install-git-hooks
	@echo

clean:
	$(RM) main
