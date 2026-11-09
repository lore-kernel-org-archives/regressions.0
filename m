Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215732;
	b=fGV2QSB3Xu8Zk2DBiH+ZztBd9WlqV2SjM+58geHoi/A8w6ny1sCUQoSQW1XKgidMI2LP
	 iIKzgZrk0CeVyKdwG/WGYBbkPeOPPACmU6V+PnUpx+0O7++Ry1yI77kn7wzG9qc4VQpj0
	 sBnTIZVyfogkCBMS8Rhza/XQ9GL6S1grOgwpxGFguUElEAM5JYfhtyoXaDfl8CM1deuPT
	 9kyYbxtim+JfxVUFoRRX6QEHhRPKKTW9d7AQiapemRsQ+p4L8iqZoZThWA84YaIHExJnS
	 KnQ/vZcLF3jD1q+VNgrcTJMuwJMp8oo7UjjYIYLHNo2kQh3OsQ1/bc6oE9LLbi+4+fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nAZcXDlQZddbY3M/muInvcNY1JTv1MgI/C6goEt1No4=;
	b=nxe6pOX+TqCLhc5WEiKwV0Slf4egbxZmHfrrK88p6w9pk7+u1baUbrZzRIHSCYrcMMRx
	 9mGP1HUXcHjmNSKN7jx8t8UWOUa8a92KgPZ6Ca7VfjROwViRAbyM7F1uAt0l4Qa2SCNbg
	 sYsnf7AOGw9o91O75cm1xDB66o4WoJ3oIs00DFLGR5DLDTcvnwoYJadXcN8kXVVP+ZpLE
	 0v6YpAdJ1XXOjGXGqIjBPTrKS7VCWgmUikC/GSRtwbz+mYPQ6wyNAaafi09/fDRpfuNNy
	 Fl8ZoIGyOXdZJ7XLLUyZ7J3qjavrw/b8GnnCWWdrVSsUiIsxCQIC66p2Vwo/apM3yOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8lAkIbp;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C812606D805
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 09:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C812606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8lAkIbp
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae18eb9b69so620266c88.0
        for <regressions@lists.linux.dev>; Mon, 09 Nov 2026 01:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794215731; x=1794820531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAZcXDlQZddbY3M/muInvcNY1JTv1MgI/C6goEt1No4=;
        b=w8lAkIbpRuDfGMuzQaBye7ollHnT4d6LulNKXw2IlNuvruDEXvD9ypXAjGK8oMSmBF
         E+g2C93gE9Y/bU64Dax6xkGMODyj2lsQKMmVjTZAF8LUq1SCYaHo75hxFZjcbhoyuknZ
         w0NlUui+4/j1f1qUFw8McV06XDXAWJVzLfgPPl575PjC8CRlnKXEb67663lNpGkB3LL6
         Pa7oLL6YgTR7hfp7mERi2U9OIRODsdMOneJ6JGioL8u06QdKIPGhPFrR2GUY12YC7Vpi
         rRuq6FakI+bSi8bSh0M/MKFhiSAqZdl4zsy+qr+3LW7AIyae+8Xe3y0NuzK87JRnpiKo
         jmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215731; x=1794820531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nAZcXDlQZddbY3M/muInvcNY1JTv1MgI/C6goEt1No4=;
        b=AWr6wdWxA7beQ6YPCd9aX5pQ/8EO7EJFwnTYfAc1mfdYbCaozBPpkmkjm1QYsV0u39
         qHJFTRvvNrW29SEXps4HmOf4OFi1N5OEtXbGwPKxxPIDWuWgE7UvmuXe1KW7PA3mVmHn
         cF1XaJEInGkcGyf1dtP7WeAXRbjFzMp8MhcgpnG2DRxE3y44Jgrx4nnpCZGdoalbuqMt
         5IVsyeXIcAa/wIdgVe38Kr3m9GlXl6M92zT0ySBgA2h+I+VQ91hpW4dG+lUlsd9XhTcZ
         UFjHOEmdRaZia2Rq/GIpA79EM2K1bW42ilY/q7qvDAzachSrPuexH4imzZqkOeYOFWn/
         KGmg==
X-Forwarded-Encrypted: i=1; AL+hErGbIsuzprg8md+nm8I2q9kjsmvAu4K389uy0Xa+VdKfzKx1IBjjZbM4fzm99MB5XcXeUP8M6QCO7+eboA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9BIl8zZUCsZHzkSzodXoAlT+RQt9MqEcEJ8MD6lyccciDayCvI
	+9aKh0x/vdzDoFCFsCznNWNsHaHC3lRVk2b91UjzkfBm63/OD+zsvKEs
X-Gm-Gg: AYBFou1pd3N0O7tU+h4kQuQdMm7hqU9PcturZZ5qqb0SgqPXSKIeV57C2QypHr/z0TO
	TzD1P0XtzpmhOZUIumUwHYEM/ZWHSr0ni/Z0rrdL3x5lhIYWuXS+0AO3NmO/J7hnGo/6PJIa3nB
	5jAvoEILDlVh7PB5lhmeebMSCH+UxMIAyZSrL8ImgcWUhxQwslLBX1JX11JnDKpZYo3tNTwloay
	Q8ZRQOor0WJIMkFqSxGXGRA5hrMHOf2EeBXy2hF46E2pMX7S14yp7Qie30hJ5s9agDg9YXYdg1D
	TV1qSCuQzkACraD096L53c6XsOvoum+I02dtHAS8boJJ+TLUmItHh93qTAroxfCiAGNwexHhS6F
	9hPOKVBXVZBPZqshDPYR+xCJoY3UW40zFVo6rHOIUEYlulWsXiBEd/imGS2w7pbtRxWOdys2Eqm
	LVwJhPRbBvpe0ZS65DXtUjOVHynwEIKCucjtoPKIL8deHCZaAVrnikjkY4OnCuv2Py+XeC5WLZT
	JWHO2iYfBJ3WcmvoCF3IXHiaX9tGipU4bR34n48t3ONieClVRJcePJNwr1Jd/4u94SQOBZzX/E0
	R1AgRa77RR2qfLdxJIgpY13oYCj28ZGVMsiAtRqQa/2m4UJAddJ9+aaEu7dKfGadsw==
X-Received: by 2002:a05:7022:e803:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1b39fefb9e8mr5783381c88.38.1794215730818;
        Mon, 09 Nov 2026 01:15:30 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.106.86])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm14379505c88.10.2026.11.09.01.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:15:30 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: akpm@linux-foundation.org,
	willy@infradead.org,
	jack@suse.cz
Cc: linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	fujunjie1@qq.com,
	vishal.moola@gmail.com,
	roman.gushchin@linux.dev,
	Trace <tracekotae@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/filemap: restart mmap readahead on sequential faults after many misses
Date: Mon,  9 Nov 2026 09:14:44 +0000
Message-ID: <20261109091444.128521-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105192517.228523-1-tracekotae@gmail.com>
References: <20261105192517.228523-1-tracekotae@gmail.com>
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

Since commit 9b0fcac3cfe7 ("mm/filemap: do not count FAULT_FLAG_TRIED
retries as mmap hits"), about a hundred sparse mmap faults push
mmap_miss over MMAP_LOTSAMISS and turn off mmap read-around, as
intended. But mmap_miss only comes down on hits on pages that
read-around brought in, and with read-around off there are none. A file
that is then read sequentially gets a synchronous single-page read for
every page until it is opened again.

When a miss above the limit is on the page right after the previous
miss, start readahead the way a sequential read() miss does, with
page_cache_sync_ra(), and keep mmap_miss at its cap so that hits on
that small first window do not bring back full read-around for random
access.

Tested in a KVM guest (x86_64, 2 vCPUs, 3 GiB) with ext4 on virtio-blk.
"base" is mm-hotfixes-unstable. "95b8e" is commit 95b8e432265f ("mm: use
zone lock guard in __offline_isolated_pages()"), the last one before the
series of 9b0fcac3cfe7. Commit 0b9c0aeba938 ("mm/filemap: count only the
faulting address as a mmap hit"), the first of that series, gives the
same results as 95b8e for the reproducer.

Reproducer from the report, read_ahead_kb 128, major faults:

                                         95b8e    base  patched
  sequential only                            1       1        1
  sparse pass, then sequential               1   16384        2
  sparse, MADV_SEQUENTIAL, sequential      512     512      512
  sparse, close and reopen, sequential       1       1        1

Touching 1% of the pages of a cold 20 GiB file, larger than memory,
MiB read from disk:

                       read_ahead_kb 128        read_ahead_kb 8192
                      95b8e  base patched     95b8e   base patched
  random               5656   215     215    344731   1032    1032
  stride 2053 pages    6545   216     216    419003    992     992
  random 2-page runs   2992   215     528    173093   1099    2248
  random 4-page runs   1570   216     594     86797   1266    2301

After the sparse pass, reading 32 regions of 2 MiB in turn takes 512
major faults per region on base and 2 with this patch.

Not tested: NFS, the GPU workload from the report, and other
architectures and page sizes.

An AI assistant (Claude) helped with the analysis and the approach, and
wrote the test programs and drafts of the comment and this changelog.
I reviewed, implemented, built and tested the change.

Fixes: 9b0fcac3cfe7 ("mm/filemap: do not count FAULT_FLAG_TRIED retries as mmap hits")
Reported-by: Trace <tracekotae@gmail.com>
Closes: https://lore.kernel.org/all/20261105192517.228523-1-tracekotae@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Gopal Malaviya <gopalmalaviya53@gmail.com>
---
Notes, not for the changelog:

- Keeping mmap_miss at its cap is the least obvious part. Without it,
  hits on each small window keep mmap_miss near the limit: random 4-page
  runs at read_ahead_kb 8192 read 25896 MiB instead of 2301. A cap of
  MMAP_LOTSAMISS * 2 gave the same results as the full cap in all tests,
  since each new run sets it again. The cost: a reader that jumps
  between sequential runs stays at 2 faults per region, where without
  the cap it is back to 1 after 16 regions.
- A full read-around on the adjacent miss instead of page_cache_sync_ra()
  also fixes the report, but random 2-page runs on a 2600 MiB file at
  read_ahead_kb 128 read 379 MiB instead of 76 (38 on base).
- At read_ahead_kb 8192, this guest's default, the reproducer shows 1
  fault for "sparse pass, then sequential" even on base: the 8 MiB
  windows reach the next sparse pages.
- Patched results matched within 1% over two runs (the 32-region test
  ran once). checkpatch is clean; mm/filemap.o builds without warnings
  with W=1 for x86_64 and i386.
- I can send the test programs if useful.

 mm/filemap.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 371a4bbd06..1548021472 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3398,9 +3398,27 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
 		/*
 		 * Do we miss much more than hit in this file? If so,
 		 * stop bothering with read-ahead. It will only hurt.
+		 *
+		 * But without read-around no hits are left to bring
+		 * mmap_miss down again, so a file that turns sequential
+		 * would stay without read-ahead. Remember where we missed,
+		 * and treat a miss on the next page like a sequential
+		 * read() miss: page_cache_sync_ra() starts with a small
+		 * window and only grows it while access stays sequential.
+		 * Keep mmap_miss at its limit, so that hits on that window
+		 * do not bring back full read-around for random access.
 		 */
-		if (mmap_miss > MMAP_LOTSAMISS)
+		if (mmap_miss > MMAP_LOTSAMISS) {
+			pgoff_t prev_index = (unsigned long long)ra->prev_pos >> PAGE_SHIFT;
+
+			ra->prev_pos = (loff_t)vmf->pgoff << PAGE_SHIFT;
+			if (vmf->pgoff - prev_index != 1)
+				return fpin;
+			WRITE_ONCE(ra->mmap_miss, MMAP_LOTSAMISS * 10);
+			fpin = maybe_unlock_mmap_for_io(vmf, fpin);
+			page_cache_sync_ra(&ractl, 1);
 			return fpin;
+		}
 	}
 
 	if (force_thp_readahead) {

base-commit: 09f140d2cb078edfcd08a40a23ead0bdceea30a4
-- 
2.43.0

