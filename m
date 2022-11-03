Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D15E79C9
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 22:20:58 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id v8so2087557qkg.12
        for <regressions@lists.linux.dev>; Thu, 03 Nov 2022 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMN0/mJYGvzCnOyvxtCJFIOn1RUzuH2afiVlhl8BJN8=;
        b=R6DRBzl5D7PmTiScz2q1QNrg5S/EVTQpn+C3LtM9SKPmz5cwA30hjj2kpsgOy9eZIa
         Myw7XsEbkbNfN0tnrvY0/O563gK9D+y0wMqMrdjnsBy6lIZVn7MiXBaIMIsfDB704urv
         fKP6U3VmiAXsIfqSTLdzXkih52xtbr96MBMR/pC7TTRGId/3MknjV3tU1EVNPCIn4xKI
         5YLvUn4crDDl0m7eR8kbF5vfBiHAe6I525XruQUlEH0EePJhA5MXVI/wGhUDlxBRV30O
         ADJH+Df8LJaWzNuMWaZamm1CxC0v1ci3yBoZFfYZv15out2MFkOVyQqJ5huIDjV9OnHg
         vosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMN0/mJYGvzCnOyvxtCJFIOn1RUzuH2afiVlhl8BJN8=;
        b=DYRRUwZqCORJjYQkWm82yoh3jRkqqUaCvFAf4svyWPRg6+Q/vkQcepIAMfguNIlpq0
         5cWUjKJlyZA+huBLsPgr282vOZb6r0eAshi4y7LJCyWaOVFXcfeIcwMzsOc3Mb3yU5Ze
         NeaI8C6+nyUXmNkK55RNXn9OtEP0u7h2x+bEag9qRd5qT8Rm7PXHM7TG5MFPZ/PeDBv6
         IDUm+R9mKSET0BZYhOeilJqYImqdhh5mG0mwrp7vbxNBGzRZS0zFf98cyO3uPsxKaHnT
         Fhd/Z54riWff5RG4j07bkWoBdDezJeJgU1BpMLWe/7c4Vo+9fNBhVbZFNDnrf2AWorC6
         G8Aw==
X-Gm-Message-State: ACrzQf1Q8E8e2DCyyZRXRozv1qrhnDnNZbCPKnUdwPMvXyU7PYyhG9A7
	cy4gsLxNG7G4qAhBKGRKOIP0iw==
X-Google-Smtp-Source: AMsMyM6xZDCV9zQJtAhUoSH5ufgDptRZU0dKTD699bnK6iH5NnhZ73hquRFyFxv1/SpheHjZZuwKeg==
X-Received: by 2002:a05:620a:152e:b0:6fa:3cb8:dd9c with SMTP id n14-20020a05620a152e00b006fa3cb8dd9cmr15550460qkk.82.1667514057172;
        Thu, 03 Nov 2022 15:20:57 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::25f1])
        by smtp.gmail.com with ESMTPSA id x18-20020a05620a259200b006bc192d277csm1559048qko.10.2022.11.03.15.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 15:20:56 -0700 (PDT)
Date: Thu, 3 Nov 2022 18:20:59 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Matthew Wilcox <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-mm@kvack.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGESSION] systemd-oomd overreacting due to PSI changes for
 Btrfs (was: Re: [PATCH 3/5] btrfs: add manual PSI accounting for compressed
 reads)
Message-ID: <Y2Q+y8t9PV5nrjud@cmpxchg.org>
References: <20220915094200.139713-1-hch@lst.de>
 <20220915094200.139713-4-hch@lst.de>
 <d20a0a85-e415-cf78-27f9-77dd7a94bc8d@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d20a0a85-e415-cf78-27f9-77dd7a94bc8d@leemhuis.info>

On Thu, Nov 03, 2022 at 11:46:52AM +0100, Thorsten Leemhuis wrote:
> Hi Christoph!
> 
> On 15.09.22 11:41, Christoph Hellwig wrote:
> > btrfs compressed reads try to always read the entire compressed chunk,
> > even if only a subset is requested.  Currently this is covered by the
> > magic PSI accounting underneath submit_bio, but that is about to go
> > away. Instead add manual psi_memstall_{enter,leave} annotations.
> > 
> > Note that for readahead this really should be using readahead_expand,
> > but the additionals reads are also done for plain ->read_folio where
> > readahead_expand can't work, so this overall logic is left as-is for
> > now.
> 
> It seems this patch makes systemd-oomd overreact on my day-to-day
> machine and aggressively kill applications. I'm not the only one that
> noticed such a behavior with 6.1 pre-releases:
> https://bugzilla.redhat.com/show_bug.cgi?id=2133829
> https://bugzilla.redhat.com/show_bug.cgi?id=2134971
> 
> I think I have a pretty reliable way to trigger the issue that involves
> starting the apps that I normally use and a VM that I occasionally use,
> which up to now never resulted in such a behaviour.
> 
> On master as of today (8e5423e991e8) I can trigger the problem within a
> minute or two. But I fail to trigger it with v6.0.6 or when I revert
> 4088a47e78f9 ("btrfs: add manual PSI accounting for compressed reads").
> And yes, I use btrfs with compression for / and /home/.
> 
> See [1] for a log msg from systemd-oomd.
> 
> Note, I had some trouble with bisecting[2]. This series looked
> suspicious, so I removed it completely ontop of master and the problem
> went away. Then I tried reverting only 4088a47e78f9 which helped, too.
> Let me know if you want me to try another combination or need more data.

Oh, I think I see the bug. We can leak pressure state from the bio
submission, which causes the task to permanently drive up pressure.

Can you try this patch?

From 499e5cab7b39fc4c90a0f96e33cdc03274b316fd Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Thu, 3 Nov 2022 17:34:31 -0400
Subject: [PATCH] fs: btrfs: fix leaked psi pressure state

When psi annotations were added to to btrfs compression reads, the psi
state tracking over add_ra_bio_pages and btrfs_submit_compressed_read
was faulty. The task can remain in a stall state after the read. This
results in incorrectly elevated pressure, which triggers OOM kills.

pflags record the *previous* memstall state when we enter a new
one. The code tried to initialize pflags to 1, and then optimize the
leave call when we either didn't enter a memstall, or were already
inside a nested stall. However, there can be multiple PageWorkingset
pages in the bio, at which point it's that path itself that re-enters
the state and overwrites pflags. This causes us to miss the exit.

Enter the stall only once if needed, then unwind correctly.

Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
Fixes: 4088a47e78f9 btrfs: add manual PSI accounting for compressed reads
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 fs/btrfs/compression.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index f1f051ad3147..e6635fe70067 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -512,7 +512,7 @@ static u64 bio_end_offset(struct bio *bio)
 static noinline int add_ra_bio_pages(struct inode *inode,
 				     u64 compressed_end,
 				     struct compressed_bio *cb,
-				     unsigned long *pflags)
+				     int *memstall, unsigned long *pflags)
 {
 	struct btrfs_fs_info *fs_info = btrfs_sb(inode->i_sb);
 	unsigned long end_index;
@@ -581,8 +581,10 @@ static noinline int add_ra_bio_pages(struct inode *inode,
 			continue;
 		}
 
-		if (PageWorkingset(page))
+		if (!*memstall && PageWorkingset(page)) {
 			psi_memstall_enter(pflags);
+			*memstall = 1;
+		}
 
 		ret = set_page_extent_mapped(page);
 		if (ret < 0) {
@@ -670,8 +672,8 @@ void btrfs_submit_compressed_read(struct inode *inode, struct bio *bio,
 	u64 em_len;
 	u64 em_start;
 	struct extent_map *em;
-	/* Initialize to 1 to make skip psi_memstall_leave unless needed */
-	unsigned long pflags = 1;
+	unsigned long pflags;
+	int memstall = 0;
 	blk_status_t ret;
 	int ret2;
 	int i;
@@ -727,7 +729,7 @@ void btrfs_submit_compressed_read(struct inode *inode, struct bio *bio,
 		goto fail;
 	}
 
-	add_ra_bio_pages(inode, em_start + em_len, cb, &pflags);
+	add_ra_bio_pages(inode, em_start + em_len, cb, &memstall, &pflags);
 
 	/* include any pages we added in add_ra-bio_pages */
 	cb->len = bio->bi_iter.bi_size;
@@ -807,7 +809,7 @@ void btrfs_submit_compressed_read(struct inode *inode, struct bio *bio,
 		}
 	}
 
-	if (!pflags)
+	if (memstall)
 		psi_memstall_leave(&pflags);
 
 	if (refcount_dec_and_test(&cb->pending_ios))
-- 
2.38.1
