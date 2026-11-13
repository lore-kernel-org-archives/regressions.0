Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551114;
	b=VqN+eyABI967mXCkBrY3y2Syr9jcucQB3CixeSGvy9DpoZcYZ5tZuY6oeQnQP43wSgYP
	 dF0qwuDhpv0Bf90xZHHHkYaj/LKUlmoK8rZzOdjHaiLKAlpm8sYgrS8POwXkjJ0mFGRfh
	 f+Cj5gFm0DkuypWQQjnlzREieQ6V5iedrmGNZoI06G3JQuti0s2SHVdHoGad6+Jwc42ag
	 lMXs827xIFu8ygekzG/MrdstqqZH0SHKFmAxA6tXx2CM3v+rZ3TCZLZz+cU6mR0+i9GiX
	 APB/0YO9MS7SVNPlch+NMjLpyBJhlFKhWRcdTxo6lfMZkchcj//3a0hee1snZ7ez+LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3tlK4/UTFCYCg7fMWH6nOmeYXoGJRxWoGIF/cCb+vIs=;
	b=obXAtfAdenzio9kw+m0cYej334CvdJ/O7rY4b+rGjDa/C4NocLYAQ9bDOZT//Uswm/x6
	 a6y5TIsUKvhLgdf7lqfeyAwTgAC4EK7bHaHTwnkXT7FWeUGpkB4iJIZvbPFC9sJaznTGg
	 z1+h+ZliSsPqH7AnhALwglMHfooAnoFDIL1bVZiZvXscjctFNyiv3YEqDagytcKLKm7iT
	 Uf5FzBcDFzdNkCm6Qv+F3Vkw8XfhbgbOS5AzN7ujq8B680WfdBws9HA5YhMSCyAn/bmWR
	 yYq0R72b57YFdGlSWTp41MxhO7ogPvw9n4RIpkimyDDF5v0TQK7IFpz6R334CJInU5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0AdqSik;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E878B606A331
	for <regressions@lists.linux.dev>; Fri, 13 Nov 2026 06:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E878B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0AdqSik
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3720addb068so981423eec.1
        for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 22:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551113; x=1795155913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tlK4/UTFCYCg7fMWH6nOmeYXoGJRxWoGIF/cCb+vIs=;
        b=r0AdqSikVZH3MPwKiKTFT0VGYGjFPWBts7pS2blMySgl+OglSXyP5kY3yEEzgwmogA
         xDH0Gw8UK9mDGJH+bX+MhGG6IXPWPTw9lZrUkBdXEipRy6LiNvo5Aqc69ejbQP1XGXrI
         6fKXemuTMDQUmVA5/ihb2ESkrXc8FhizA6mygNSCCLNAiugUGqcV9Iugv6AXhLbZ7YJO
         X4zu6OSHguBLDm/mx0wWrJsppinxQuNLENFAEfbTYz7WKES3/M9JXAztbdpgyR2tPxxl
         fKs2Sj3GbFVH8RDq1XqcVsM29kIrS+0Yqi0MuXmm9q7r7Vs1bWxpnl1ZBBzgiNFdpo8z
         UYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551113; x=1795155913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tlK4/UTFCYCg7fMWH6nOmeYXoGJRxWoGIF/cCb+vIs=;
        b=yOL8Hd4GSiCcMgejLrBfnw52Jnrcxu+1armP0mRVJkTiwm/9DkQCU2kt1xrotEtt74
         SbXfo8aqkk48uTwOho4/IWLhZY9kX4OtaUKj/VtV5lGyzXEWItgPzXfjcES8efZZwKNz
         67vGde/wVKA6LGupGFas7iaa2R2tboGWTTawmvev/aGT/JiwXXdQ14d6lGGkqWeYBFwZ
         8yDhlmXBVcsjnbXPi4okcgfzrCfeqZTEURmh10I+xfZVt12bwTK76UE+JnB62oADOLJs
         RJI9+RMAnh73Gq7hPU6HLlDGNGIbFpG37bgEP9AjgyaK6NVnCQCEjb/2zmGiyL8pVF7w
         ZCAA==
X-Forwarded-Encrypted: i=1; AL+hErHUvRCr/+lWwajB3QSguXiXK+nuwclHHLT79/Wjsf2/KQAGFrtuyYz+QjCJppMkI5muQHX5WApLu4hhdQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8FGNuaXcZp8qk2FHUe8dm2gt7NDRt3qC1MDwBUrA1p+L4l9GDU
	0rq3G+USspaBcujdkdro2SxdUJeLUuDBz8RNGg4qaAqb8932k652AiPz
X-Gm-Gg: AYBFou3ejCFHJavBiff06esM2CGbUHS0Ha+PKugb4Trk3+C3wQMpm5ffTVYMTTAixwq
	NgZ0QBuXBTe9tUG893NZouyzbBrONI3/Cezx2lTwfVn1mjPjPjTDGgvcgqGMS9LjnqPIUiSATjD
	sNYzOfvJ1W9Pj1ulAkAE9jN/e3bEo7xwedOcEu3ylC+UZmOF8U2owwSoTB0q/5Gwe3PcNhpx6qk
	5pZAdP6+YHsmb8wYwZ81tR//ezTGIASBJdTLh+H5N32UbgJAABvq44SJsZ7SyT1PLmXglmO3ngY
	M8f3FpOwvqz1HAEikC7XB0wKs7c5/oV0uWyrraqBPlc3V7L0tbIcHNP0IdZGxgVH9fEPGwkWer2
	cXcLJSaRLBIjt3ZIai10HSzEtKW/azB+eixc+IqmIQIEAUr1FlawxVwISYu8qkn2N8QkVhH/FE8
	bBwfFQeXb0O2d0PwbeXEZTH6Izey6Vmy1qqmTXcIzcPloUTQl0heRggWWC/T1U7LNTTb3TmkHbr
	a/4870Z2FkwlyH/JLP0fRo6LFc1Ax3DxXWsVrhG1U9cu0mocB6iS6apiQO0MqQ4ITR5H4vJt2dl
	BR8eX34d2LtGFZxaI+EDaRmyZSvTlkExVdvsgt054D4ib9NZRv25jfjB66mH4DlRsM0=
X-Received: by 2002:a05:693c:894f:20b0:36d:5102:9974 with SMTP id 5a478bee46e88-379636607famr1340509eec.2.1794551112863;
        Thu, 12 Nov 2026 22:25:12 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.114.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm4309715eec.7.2026.11.12.22.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:25:12 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: alireza.haddadi@it.uu.se
Cc: jack@suse.cz,
	willy@infradead.org,
	akpm@linux-foundation.org,
	vishal.moola@gmail.com,
	fujunjie1@qq.com,
	roman.gushchin@linux.dev,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	tracekotae@gmail.com
Subject: Re: [PATCH] mm/filemap: let sequential faults restart mmap readahead
Date: Fri, 13 Nov 2026 06:24:46 +0000
Message-ID: <20261113062446.193820-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <26E03EC6-F37C-4350-B2A9-1F354217F469@it.uu.se>
References: <20261109-mmap-miss-v1-1-8b44b33f3358@it.uu.se> <20261111042310.191979-1-gopalmalaviya53@gmail.com> <26E03EC6-F37C-4350-B2A9-1F354217F469@it.uu.se>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 11, 2026 at 07:43:54AM +0000, Alireza Haddadi wrote:
> That would be great, thank you. Could you share the short-run test,
> So I can run the same here while working on it?

Sure, it is below. It writes the file (or reuses it with "keep"),
drops it from the page cache with POSIX_FADV_DONTNEED, touches 1% of
its pages through a MAP_PRIVATE mapping and prints the MiB read
(pgpgin in /proc/vmstat) and the major faults for each pattern:

  ./mmap-rand FILE               2600 MiB file, removed at the end
  ./mmap-rand FILE 20480 keep    20 GiB file, kept for the next run

The tables came from the second form in a 3 GiB guest, with
"echo 128 > /sys/block/vda/queue/read_ahead_kb" (or 8192) before each
run. "random 4-page recs" is the short-run case. Like the earlier
tests, the program was written with the help of an AI assistant.

Thanks,
Gopal

---8<--- mmap-rand.c
/*
 * mmap-rand.c: how much does the kernel read from disk for sparse
 * mmap access (random, and fixed stride) on a cold file?
 * Reports disk input (pgpgin from /proc/vmstat) and major faults.
 *
 *   ./mmap-rand FILE        (FILE must not exist; removed at the end)
 *   ./mmap-rand FILE SIZE_MIB keep   (reuse FILE if it exists, keep it)
 */
#define _GNU_SOURCE
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <unistd.h>

#define MIB	(1UL << 20)
static unsigned long SIZE = 2600 * MIB;

static long pgpgin_kib(void)
{
	char name[64];
	long val;
	FILE *f = fopen("/proc/vmstat", "r");

	if (!f)
		err(1, "/proc/vmstat");
	while (fscanf(f, "%63s %ld", name, &val) == 2)
		if (!strcmp(name, "pgpgin")) {
			fclose(f);
			return val;
		}
	errx(1, "no pgpgin");
}

static long majflt(void)
{
	struct rusage ru;

	getrusage(RUSAGE_SELF, &ru);
	return ru.ru_majflt;
}

static void run(const char *path, const char *name, unsigned long stride,
		unsigned long rec)
{
	unsigned long page = sysconf(_SC_PAGESIZE), npages = SIZE / page;
	unsigned long n = npages / 100, i, idx;	/* touch 1% of the pages */
	long in0, mf0;
	volatile char sink;
	char *m;
	int fd;

	fd = open(path, O_RDONLY);
	if (fd < 0)
		err(1, "open");
	if (posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED))
		errx(1, "posix_fadvise");
	m = mmap(NULL, SIZE, PROT_READ, MAP_PRIVATE, fd, 0);
	if (m == MAP_FAILED)
		err(1, "mmap");

	srandom(1);
	in0 = pgpgin_kib();
	mf0 = majflt();
	for (i = 0; i < n; i += rec) {
		unsigned long j;

		idx = stride ? (i * stride) % npages : random() % (npages - rec);
		for (j = 0; j < rec; j++)	/* a record of rec adjacent pages */
			sink = m[(idx + j) * page];
	}
	printf("%-20s %6lu touches %8ld MiB read %6ld major faults\n", name, n,
	       (pgpgin_kib() - in0) / 1024, majflt() - mf0);

	(void)sink;
	munmap(m, SIZE);
	close(fd);
}

int main(int argc, char **argv)
{
	static char buf[MIB];
	unsigned long i;
	int fd;

	if (argc != 2 && argc != 4)
		errx(2, "usage: %s FILE [SIZE_MIB keep]", argv[0]);
	if (argc == 4)
		SIZE = strtoul(argv[2], NULL, 0) * MIB;
	fd = open(argv[1], O_WRONLY | O_CREAT | O_EXCL, 0600);
	if (fd >= 0) {
		memset(buf, 0x5a, sizeof(buf));
		for (i = 0; i < SIZE / MIB; i++)
			if (write(fd, buf, MIB) != (ssize_t)MIB)
				err(1, "write");
		if (fsync(fd))
			err(1, "fsync");
		close(fd);
	} else if (argc != 4) {
		err(1, "create");
	}

	setvbuf(stdout, NULL, _IOLBF, 0);
	run(argv[1], "random", 0, 1);
	run(argv[1], "stride 2053 pages", 2053, 1);
	run(argv[1], "random 2-page recs", 0, 2);
	run(argv[1], "random 4-page recs", 0, 4);
	if (argc != 4)
		unlink(argv[1]);
	return 0;
}
