CC = /usr/bin/gcc
CFLAGS = -Wall -g -O3 -Wextra -Wpedantic
LDLIBS = -lcrypto

SOURCES = params.c hash.c fips202.c hash_address.c randombytes.c wots.c  utils.c
HEADERS = params.h hash.h fips202.h hash_address.h randombytes.h wots.h  utils.h

TESTS = test/wots \
		test/wots \
		
all: tests ui

tests: $(TESTS)
ui: $(UI)

test: $(TESTS:=.exec)

test/xmss_fast: test/xmss.c $(SOURCES_FAST) $(OBJS) $(HEADERS_FAST)

.PHONY: clean test

test/%.exec: test/%
	@$<


clean:
	-$(RM) $(TESTS)
	-$(RM) test/vectors
	-$(RM) $(UI)
