EXEC = time_test_naive time_test_sse time_test_sse_prefetch time_test_avx

CFLAGS = -mavx2 -msse2 --std gnu99 -O0 -Wall -Wextra -g

#DEFINE = -DNAIVE -DSSE -DSSEPREFETCH

GIT_HOOKS := .git/hooks/applied

default: $(GIT_HOOKS) main.c
	$(CC) $(CFLAGS) -o time_test_naive -DNAIVE main.c
	$(CC) $(CFLAGS) -o time_test_sse -DSSE main.c
	$(CC) $(CFLAGS) -o time_test_sse_prefetch -DSSEPREFETCH main.c
	$(CC) $(CFLAGS) -o time_test_avx -DAVX main.c
	
#%.o: %.c
#	$(CC) -c $(CFALGS) $< -o $@

$(GIT_HOOKS):
	@scripts/install-git-hooks
	@echo

clean:
	$(RM) $(EXEC) 
