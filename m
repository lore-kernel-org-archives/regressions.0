Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A480F
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 23:04:11 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5776312eaddso39205687b3.3
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 16:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688857451; x=1691449451;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O+qLESJCRFN7dcIsyw3NJtjwIsXtHYZLjT5v4tk5DvU=;
        b=mgCi5qSaZ0QN848AO4FEdlrrUOrB86sH23LbXPcpsn4qyESlzAQawFfOF04UBU4Kgv
         9/lqmDRKXg+cqWxZ2Jzz8dSkhhwyJvxS413AvX/bJBFnXjkhbSF26g90mSr+UkOXy8qt
         Lg0ffkvvfGuyQCAHGQNyalDtsOWJwlyjwicSAZnEWb8DRbiUVaPqcJE1hmf3pb5JbHCV
         F+aCGx7iX12vcDpSmC0d09+31EprSu+CfzDgy+pt2tM4zg6JDFCADKQwoJX7LmkAFVnW
         HfnY7DNlbwjqy3xmZ1ahFCq1H6iUoXJC9PL/ZtQyNPupEGpCxTeiUlFqcf0amr0w6t44
         ARKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688857451; x=1691449451;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+qLESJCRFN7dcIsyw3NJtjwIsXtHYZLjT5v4tk5DvU=;
        b=jpVioZkKOtRL+MQ0yeyTggQK2/P4dvUcJsoY1EVBdCCnt5HnC/LGPBDWJ8jX/OmzEj
         O40xdbNlR72wMXiT/bmyvxv0irmOyo7aCYt1sM7Fe7jGXS/cPQ5GfJzVTPQZxDUzbqDD
         e1VcxV9xqnKBui2IJJYiNYo+2wwrooAHsl0MP9bRd79KXMa9IX2LaydF2vGBzFzTm+Kt
         rZF8T7N7P0DYqWbpaKklbJWOL2ynv5b174mBePFFO5KXElax6cZUuwQXxHDt/MyALO7g
         LWkBVWCBNrQeQrqdWASUudbf40YrNg0R6X0mDred8gRP8AOZC3+S7d6MFPV/hEfa3yfi
         h96w==
X-Gm-Message-State: ABy/qLYeraxjTx7HJpo8T/syDzlo9tFltAun9qC1lX/RjTg9XYNz9jHA
	HNuMfQLvTTKJIvT69NU8FeHzWQ==
X-Google-Smtp-Source: APBJJlHxsUrb2PsB8Vr/SdiFDl5l/hnimxuzYl85A5so5Ag/YE5k+SY0YoZnZodNyJi7fr5g0LxUxA==
X-Received: by 2002:a81:4e87:0:b0:573:527b:747b with SMTP id c129-20020a814e87000000b00573527b747bmr8684830ywb.36.1688857450765;
        Sat, 08 Jul 2023 16:04:10 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d205-20020a8168d6000000b0056cd3e598d8sm2108255ywc.114.2023.07.08.16.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 16:04:10 -0700 (PDT)
Date: Sat, 8 Jul 2023 16:04:00 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, 
    regressions@leemhuis.info, bagasdotme@gmail.com, jacobly.alt@gmail.com, 
    willy@infradead.org, liam.howlett@oracle.com, david@redhat.com, 
    peterx@redhat.com, ldufour@linux.ibm.com, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
    linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org, 
    regressions@lists.linux.dev, stable@vger.kernel.org
Subject: [PATCH] mm: lock newly mapped VMA with corrected ordering
Message-ID: <b5a5626-2684-899d-874b-801e7974b17@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Lockdep is certainly right to complain about
(&vma->vm_lock->lock){++++}-{3:3}, at: vma_start_write+0x2d/0x3f
               but task is already holding lock:
(&mapping->i_mmap_rwsem){+.+.}-{3:3}, at: mmap_region+0x4dc/0x6db
Invert those to the usual ordering.

Fixes: 33313a747e81 ("mm: lock newly mapped VMA which can be modified after it becomes visible")
Cc: stable@vger.kernel.org
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/mmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 84c71431a527..3eda23c9ebe7 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2809,11 +2809,11 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	if (vma_iter_prealloc(&vmi))
 		goto close_and_free_vma;
 
+	/* Lock the VMA since it is modified after insertion into VMA tree */
+	vma_start_write(vma);
 	if (vma->vm_file)
 		i_mmap_lock_write(vma->vm_file->f_mapping);
 
-	/* Lock the VMA since it is modified after insertion into VMA tree */
-	vma_start_write(vma);
 	vma_iter_store(&vmi, vma);
 	mm->map_count++;
 	if (vma->vm_file) {
-- 
2.35.3
