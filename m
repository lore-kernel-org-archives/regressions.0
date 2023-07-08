Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB051851
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 19:12:19 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-c4d69d6741fso3252102276.3
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688843539; x=1691435539;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4rAZiN8CFc+wkQPvmF3sDwgaLYdtc/sQi/Gu45S9YQ=;
        b=rDyzKJgvSb4iVFr4MU6yl+skVCEaDOmrNnUTQxW2AR6lwndLcFZirFs7K8NVbOet/l
         Hz1ezj81fpfDhby24QFHC8W4yNrvRhOZmkRPzGk0HoDpmSzVRvUFh46uDhRrvrsHj0T+
         bWfsgAAuSrJUkxovFXIvpjT+3mNLViAPukrwkqTZEVh67uYSSdkV3/RB6xiSA1ML8ef8
         x4SI1Wv4IyWtXrra9hN2OOMwSs1hHi6cndf596Frps7d08xkQhXDxEudvyECcS4PhaDT
         YUU3z/ec3eCdOsvrUHORdE6FKycuZJ6n6CZZT2tr9aAc7ZTwuikUkUWUt+zO7jA28nYB
         wf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688843539; x=1691435539;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4rAZiN8CFc+wkQPvmF3sDwgaLYdtc/sQi/Gu45S9YQ=;
        b=CvkDP4uzbPXpFZ3NPgu06o8C4dETXIBeYAiAMaeyn7ts9ySfYybrZJmd42wK1oEv15
         a4s4RbPVheKM9zSLCgphPBPfNtxg3YaZ8IyUaUX1qg4THJ3AtpHfxR93WJXr6g4XDvKA
         QBs4uzM/4rDKG9yM7uFo79InggG1jkfYd8rygRzFud7vSu78vOFDPd90HM/9wD6fVpfH
         SZRdUiWAUv3UmiIm1aEd7QEFmKEk1OzewnNvamXyRPGYnJqLGnNBtIwvNUF9QmAANS89
         ZwWo4hvQMlML77MlcknfIWXNsc2SFMMoyDyYJcfdPKBYzApK3ulyMxi2bxnDOqdbgT3I
         OrGw==
X-Gm-Message-State: ABy/qLZLGROdfUOqeMOXn30+1ixxwJUEA+HiMZJbo8TJo55g++sE7HhZ
	KgtXZSMpC6k80T6SqYj/WK3+AD/n19E=
X-Google-Smtp-Source: APBJJlHlFE3mHfSxux3qV7DD1eHyTN3Bj7OluqfqRLk3Ndt0avHOdBy2KrtMLyVg6El02lkP8km17cLgxIM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:6f0:5193:79db:25b3])
 (user=surenb job=sendgmr) by 2002:a25:b05:0:b0:c24:7d1c:6145 with SMTP id
 5-20020a250b05000000b00c247d1c6145mr69068ybl.2.1688843538817; Sat, 08 Jul
 2023 12:12:18 -0700 (PDT)
Date: Sat,  8 Jul 2023 12:12:11 -0700
In-Reply-To: <20230708191212.4147700-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com>
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
Message-ID: <20230708191212.4147700-2-surenb@google.com>
Subject: [PATCH v2 2/3] mm: lock newly mapped VMA which can be modified after
 it becomes visible
From: Suren Baghdasaryan <surenb@google.com>
To: torvalds@linux-foundation.org
Cc: akpm@linux-foundation.org, regressions@leemhuis.info, bagasdotme@gmail.com, 
	jacobly.alt@gmail.com, willy@infradead.org, liam.howlett@oracle.com, 
	david@redhat.com, peterx@redhat.com, ldufour@linux.ibm.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev, 
	Suren Baghdasaryan <surenb@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

mmap_region adds a newly created VMA into VMA tree and might modify it
afterwards before dropping the mmap_lock. This poses a problem for page
faults handled under per-VMA locks because they don't take the mmap_lock
and can stumble on this VMA while it's still being modified. Currently
this does not pose a problem since post-addition modifications are done
only for file-backed VMAs, which are not handled under per-VMA lock.
However, once support for handling file-backed page faults with per-VMA
locks is added, this will become a race.
Fix this by write-locking the VMA before inserting it into the VMA tree.
Other places where a new VMA is added into VMA tree do not modify it
after the insertion, so do not need the same locking.

Cc: stable@vger.kernel.org
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index c66e4622a557..84c71431a527 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2812,6 +2812,8 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
 	if (vma->vm_file)
 		i_mmap_lock_write(vma->vm_file->f_mapping);
 
+	/* Lock the VMA since it is modified after insertion into VMA tree */
+	vma_start_write(vma);
 	vma_iter_store(&vmi, vma);
 	mm->map_count++;
 	if (vma->vm_file) {
-- 
2.41.0.390.g38632f3daf-goog

