Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906725;
	b=dBwslyhzM+0wCLVkCzzZeEaf2jWJLrHDu2Ptn/SttuLrWrNHDXus7k64gim0mVzbkAMR
	 bE2owSdzxeBu+2Hy1aHCnSWb76xyrNTWU4htUSkfxX0Ylr1bBwSqA54w2kHgK+Lg3vgWi
	 PxtW6NCbyPR7sOtsRXB4mv5uJtj+afQa7Wi8GdvdKkRjhIAcHRiMnltfW1XyMwRqrh3EP
	 lGGIUYYbi0HCHQbXbpkPBgZMJKppTaIdK9P0J5L95IS+6N3LFoxg6Lf0stWO52t0ys86b
	 ch49WTYXv+7gIQp3mcU9HyQFfQmGTxtOlyzBY4XbUZk489OXPfnSsCqhi6rbbPB3vVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=s4FZg8DsfWmRP296oRW8/FWLLuk54fxztQ3Y/s+Qjl4=;
	b=j1cFZ07iVNBCestdTzilTKPNVgcrvIQy+IN50Rm1IHVgNTp5noL1paOkbclwrPiefEKa
	 6/COYltSBp5c6aTZeP3EGuflU/dTn08q4hkbyQnCd+8xD4PtAE9PTGlXmbpo1QL7ZlL22
	 MCowjNYL8TRV6Pl8D2T/Yz/XXkas+yN5Sqd9yJuOoIDffwXMR0J68rBCdR7gquGhljqxM
	 SbivI7k+B1BPOMutUc0YXaKO5iqfYaM5f2zcuo8r/iDJQ72UWdInmHZq/1PhmtNfhxPYS
	 be6SvFUcHBGm4enf4RgYT0zkclAkJDyZm7a9S+mZNfNeUfedmQ38ZJ0uA8y9RdgPNfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FC15p6he;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727F4606A328
	for <regressions@lists.linux.dev>; Thu,  5 Nov 2026 19:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 727F4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FC15p6he
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so2047450e87.2
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 11:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793906724; x=1794511524; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4FZg8DsfWmRP296oRW8/FWLLuk54fxztQ3Y/s+Qjl4=;
        b=FC15p6heRi/R3xLRHgxQrUxmRAusYfQKUf+fZ3LBywg00Ig7fg8pryFDx44Y85W1YS
         +x0y9eSkhmbC9T82eyy1ePAYBr67Gy5ur6PUvINrdDZ5926Y+dHjkKoGHHwY6jmCUCyv
         /y9pv78ytMBWGWct/020gD3kCMf04YJYRi9nrqckkOpXTYq0NjuFV0GBn9d9b+4Oj5xt
         ZJ8U3SrLQvdTGz06V51cPji4lTHCYx5owEz/kVv21+mrEdQ9kU6NtevPRruAGW/1Smg0
         tfXUJWBTPSb+4otiQ527/83N0yxQkOyLsnio3Ad3FFLRbR3wBqSO2h96ne4I0TtfKCaZ
         hnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793906724; x=1794511524;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4FZg8DsfWmRP296oRW8/FWLLuk54fxztQ3Y/s+Qjl4=;
        b=XouAKWNuy1V3468PNJJCFx6m2LekjZohYQs0s95uVaB7Dq0i5HxdJv+Wr3PhQ3mq9R
         wbgPf4h222lOisxSPRnAhi46rDgXW4e/leUbwk+Oqhbj6BNrRN0O+nGO3PMeXuPFIRHn
         Qrxbb7FRFym1KyfGp62Kk7xOLw0tqH3ce9JkymlyrxLr1FESKXKbgGHdGEDzvFXdV2oS
         rJXw08OHnmZUluKRzQQLa02t5QaIwuOt2E8BG4d8anjnes+ixydnXjAwhy8k4pLUNFPK
         IA+ElG0uw0LIJ8k3ONyteaSMBErmD4xV82ah2tmuN8gVPy98V/68VfT1RSqL/n7zzCE4
         Jn+g==
X-Forwarded-Encrypted: i=1; AKwUvBwJBOp04wVXaWR02Vh1BbQThSUUhi/lHVPcfvyanl8bU/EI1/5PV+t7t+dMdZuB9KhEF/q3Wh9C9I4fsw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9QOzG4kt2IifpOrNglknbXfSSHW2Wif6fprwl/20fJAc8FHf8w
	9xu1FnJwQJx4TyDlJfmlUFl/VwxM5K98FQC1UB9hLz3H89V7DSnPoveF
X-Gm-Gg: AYBFou3XzbDdCBdrCottrkLHSWHCA7ozplpU+4Tlvwycji09XdOxGZI0KMhLK4GYW++
	yhwMCCkOMiGfkQA9o0HYlRwkBF+l8R5xzAyW5TIs7X8wRGlUD5zxLi4B3G4NeY35IgPyzOgj82V
	/vJeJ4eL31qqmSx51aeWhPZJfN1yTQxcoVAcP+AXTfMldEsSjMK5zJbUPPFB7ZQBbBxFlTXhWaC
	Oi0Pw5r4PxAZWdATjIxEGwMyPNIVw+9AQEUOKwGmKyj399fzgX4eJr9LiwH5DwCuS/nm8TBJbRt
	HGa2EMU6xXKi4/24sKTclvUCLA91dc7kKHKYKR56ya/OGQrcjkQcQhH+lQfGG9dYe6BPJfRFv70
	F4XcR8i/a5cD2aatyPCSld93vWnBYF54F64EfczTvU1R3GKzipjS2lBq86o0vrFxFIUTUmO6JZ5
	66FP7Tx13aSL3ziheUXShpsyoSe6gIOuCdKUn+Jo/UVY6IuzowVtWBRr5JR7Yr/mSwUjSDXGwt0
	RiS4h+KbqM97oQEm3WkepRpXOJJ+RXXhreF/1EVg5hk2QFNBDT5kJJ/pNuyihhzsIvVABq6mVh3
	gyhSefg0nlD/X9XrrZSOxclRe6e7Zxvn86cudQ3Tpew=
X-Received: by 2002:a05:6512:104d:b0:5ba:356b:5a85 with SMTP id 2adb3069b0e04-5c003ae0858mr15497e87.43.1793906723445;
        Thu, 05 Nov 2026 11:25:23 -0800 (PST)
Received: from localhost.localdomain ([185.65.135.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c0030a3b50sm25897e87.79.2026.11.05.11.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:25:23 -0800 (PST)
From: Trace <tracekotae@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	regressions@lists.linux.dev,
	fujunjie <fujunjie1@qq.com>,
	Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>,
	Vishal Moola <vishal.moola@gmail.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [REGRESSION] mm/filemap: mmap read-around stays off for an open file after sparse faults, since 7.2
Date: Thu,  5 Nov 2026 20:25:17 +0100
Message-ID: <20261105192517.228523-1-tracekotae@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

since 7.2, once an open file has taken more than MMAP_LOTSAMISS mmap
misses, it gets no more mmap read-around, even if the access then turns
sequential. For a reader that does not run into pages an earlier
read-around brought in, it stays that way until the file is opened
again. Each later page is a synchronous 4 KiB read, which on NFS is a
round trip.

I think it comes from this series:

  0b9c0aeba938 ("mm/filemap: count only the faulting address as a mmap hit")
  9b0fcac3cfe7 ("mm/filemap: do not count FAULT_FLAG_TRIED retries as mmap hits")

I have not bisected or built a revert. By reading mm/filemap.c, v7.1
and the current 6.18.y have the old accounting and v7.2 onwards the new.
I measured 7.3.1 and 6.18.60, and the program below also gives 16384
on 7.2.14 (with the zen patches) on a SATA SSD. do_sync_mmap_readahead()
and do_async_mmap_readahead() are unchanged from v7.3 in next-20261103
and in mm-unstable, mm-hotfixes-unstable and mm-new of 2026-11-03.

As I read it: above MMAP_LOTSAMISS, do_sync_mmap_readahead() returns
without reading, and mmap_miss only goes down on a hit. With no
read-around the next page is not in the cache, so the next fault is
another miss, and nothing lowers the counter again. Before the series,
the retry after each read-around counted the pages it had just brought
in, so a sparse reader did not reach the limit. The series' tests run
random, stride and sequential access each on its own, not one after
another on the same open file.

The program below writes a 2600 MiB file, drops it with
POSIX_FADV_DONTNEED, touches 2000 pages 1 MiB apart through a private
mapping, then reads 64 MiB sequentially and counts major faults. x86_64,
4 KiB pages, read_ahead_kb 128, ext4, plenty of free memory (7.3.1 on
NVMe, 6.18.60 on a SATA SSD):

                                          7.3.1   6.18.60
  sequential only                             1         1
  sparse pass, then sequential            16384         1
  sparse, MADV_SEQUENTIAL, sequential       512       512
  sparse, close and reopen, sequential        1         1

The same pattern in a Python version, on 7.3.1, on NFS v4.2 over 1 GbE
through WireGuard: 80-90 MiB/s with no sparse pass, 5.7 MiB/s after it.

How I met it: PyTorch loading a model from safetensors on NFS, on a
Radeon AI PRO R9700 with ROCm, where the driver faults in the mapping:

  folio_wait_bit_common
  nfs_do_read_folio
  nfs_read_folio
  filemap_read_folio
  filemap_fault
  __do_fault
  do_fault
  __handle_mm_fault
  handle_mm_fault
  hmm_range_fault_locked
  amdgpu_hmm_range_get_pages
  svm_range_validate_and_map
  svm_range_set_attr
  kfd_ioctl

safetensors maps the whole file (torch.UntypedStorage.from_file,
MAP_PRIVATE) and builds one tensor view per entry, which takes one
read fault per tensor, mostly on its last page. A model file holds
hundreds of tensors spread over the file, so mmap_miss passes
MMAP_LOTSAMISS within a few seconds of the mmap, before any weight is
read (bpftrace on filemap_fault, reading file->f_ra.mmap_miss). The
GPU driver then faults the weights in through the same mapping, every
page a synchronous 4 KiB nfs_read_folio, about 1800 a second.
Read-around came back only when the GPU's walk happened to continue
through a window that one of the first hundred faults had read around:
async readahead restarted there, and about 900 hits later mmap_miss was
under the limit again. With the page cache cold, one model's first
picture took 700 s on 7.3.1, 512 s of it below 10 MB/s, against 239 s
on 6.18; a larger model's first run took 54 minutes against 13.

Is read-around meant to stay off for the life of the open file once the
limit is passed? I have no patch to offer.

#regzbot introduced: v7.1..v7.2

Thanks,
Trace

---8<--- mmap-ra.c
/*
 * mmap-ra.c: does a sparse first pass turn off mmap read-around for the
 * rest of an open file?
 *
 *   gcc -O2 -o mmap-ra mmap-ra.c && ./mmap-ra /path/on/a/disk/testfile
 *
 * Writes a 2600 MiB file (removed at the end), drops it from the page
 * cache with POSIX_FADV_DONTNEED, and counts major faults for a 64 MiB
 * sequential read through a private mapping.
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
#define SIZE	(2600 * MIB)
#define SPARSE	2000		/* single pages, 1 MiB apart */
#define SEQ_OFF	(2100 * MIB)
#define SEQ_LEN	(64 * MIB)

static long majflt(void)
{
	struct rusage ru;

	getrusage(RUSAGE_SELF, &ru);
	return ru.ru_majflt;
}

static char *open_map(const char *path, int *fd)
{
	char *m;

	*fd = open(path, O_RDONLY);
	if (*fd < 0)
		err(1, "open");
	m = mmap(NULL, SIZE, PROT_READ, MAP_PRIVATE, *fd, 0);
	if (m == MAP_FAILED)
		err(1, "mmap");
	return m;
}

static void run(const char *path, const char *name, int sparse, int advice,
		int reopen)
{
	long page = sysconf(_SC_PAGESIZE), before;
	volatile char sink;
	unsigned long off;
	char *m;
	int fd;

	fd = open(path, O_RDONLY);
	if (fd < 0)
		err(1, "open");
	if (posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED))
		errx(1, "posix_fadvise");
	close(fd);

	m = open_map(path, &fd);
	if (sparse)
		for (off = 0; off < SPARSE; off++)
			sink = m[off * MIB + 37 * page];
	if (advice && madvise(m, SIZE, advice))
		err(1, "madvise");
	if (reopen) {
		munmap(m, SIZE);
		close(fd);
		m = open_map(path, &fd);
	}

	before = majflt();
	for (off = SEQ_OFF; off < SEQ_OFF + SEQ_LEN; off += page)
		sink = m[off];
	printf("%-40s %6ld major faults\n", name, majflt() - before);

	(void)sink;
	munmap(m, SIZE);
	close(fd);
}

int main(int argc, char **argv)
{
	static char buf[MIB];
	unsigned long i;
	int fd;

	if (argc != 2)
		errx(2, "usage: %s FILE", argv[0]);

	fd = open(argv[1], O_WRONLY | O_CREAT | O_EXCL, 0600);
	if (fd < 0)
		err(1, "create");
	memset(buf, 0x5a, sizeof(buf));
	for (i = 0; i < SIZE / MIB; i++)
		if (write(fd, buf, MIB) != (ssize_t)MIB)
			err(1, "write");
	if (fsync(fd))
		err(1, "fsync");
	close(fd);

	setvbuf(stdout, NULL, _IOLBF, 0);
	run(argv[1], "sequential only", 0, 0, 0);
	run(argv[1], "sparse pass, then sequential", 1, 0, 0);
	run(argv[1], "sparse, MADV_SEQUENTIAL, sequential", 1, MADV_SEQUENTIAL, 0);
	run(argv[1], "sparse, close and reopen, sequential", 1, 0, 1);

	unlink(argv[1]);
	return 0;
}
