Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1107C1851
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 19:12:16 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-c4e0342c50dso3483464276.2
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688843536; x=1691435536;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JxWcwQCt64OXVUnpGWZTSfPA4gPHWHeYyOn+4bzO86s=;
        b=e+tppejdoz5kN8B3C5WlD+0nrZGu/5EqfAONbG0hP/lWZ7G+LSD9YpK/YdiONHY+ET
         COyN68AHpyc5cvZcCJI9Kdj/VXVTOhzXyqaYxVOU/XE8oiqZCtvDT9Ohjc4lwpKs8uIs
         Q4SGdk/Hg/xVzMRwTNMA5Eb7fUdiGxUNFD+tTkYwspdAJA3H1WkY5sp8/o9lg62jTXI9
         vPMevfc26zzweXBMLZnrlY/VDaPVf886Cj6pjLGQXsKtCnCzJ7R7L8Gjg1qP169pUZdf
         1fQiHyVHhW2J/bG8DUWZndT612qIhsJaOJnKsT3WA5FG5hybdpqBg5J7YK8LJ6GcI8+m
         tGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688843536; x=1691435536;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxWcwQCt64OXVUnpGWZTSfPA4gPHWHeYyOn+4bzO86s=;
        b=h/oNUqhSelj59m1Hw0AwOHqXgpNngO/33hJP+rVv9Rs1JhNZYswG2AEpI3wc34xV21
         SKkQjHQzvyjbr9Z/t3c6SKu3r67gsA8I3FvgmuKGheoC6LYoPviwpvp1NK+eEeEfmS/F
         4azBszAWA5bOfiKIN/EMGHDFEcnXQdAs5SxzH62GBEYTdc8nxE9wMWRaBX5mLsA6gy5R
         ZKBYXIR4mvfF+jKn5My+s2c6pyjuiqBOmIJqpqxUWh+XOWfRClRw9E3EfUVYoWyTuZDW
         u4wpGoOm4It+AdtvupjtBQ4AeQRPPDiYTZgqDIsYuVQP3f1Zklxxv0WylCtIwREpj0qZ
         oPYg==
X-Gm-Message-State: ABy/qLYWv8eIRZ4fvgweF8zte4ddwo9k3qIyxZumsNWW/J7uU6pYkhQ/
	fxdHv90ZMrCMZQsaL/xTVLVWUeTdA4U=
X-Google-Smtp-Source: APBJJlHhdNayqx2O2N+8ynu4MlCffNN+ZnIRARK/gUWveaZn8/1xJL36UJUekD5xd/lYzHt6QBE2wx7GXfo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:6f0:5193:79db:25b3])
 (user=surenb job=sendgmr) by 2002:a5b:10e:0:b0:c39:d6f6:481f with SMTP id
 14-20020a5b010e000000b00c39d6f6481fmr73329ybx.10.1688843535891; Sat, 08 Jul
 2023 12:12:15 -0700 (PDT)
Date: Sat,  8 Jul 2023 12:12:10 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
Message-ID: <20230708191212.4147700-1-surenb@google.com>
Subject: [PATCH v2 1/3] mm: lock a vma before stack expansion
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

With recent changes necessitating mmap_lock to be held for write while
expanding a stack, per-VMA locks should follow the same rules and be
write-locked to prevent page faults into the VMA being expanded. Add
the necessary locking.

Cc: stable@vger.kernel.org
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index 204ddcd52625..c66e4622a557 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1977,6 +1977,8 @@ static int expand_upwards(struct vm_area_struct *vma, unsigned long address)
 		return -ENOMEM;
 	}
 
+	/* Lock the VMA before expanding to prevent concurrent page faults */
+	vma_start_write(vma);
 	/*
 	 * vma->vm_start/vm_end cannot change under us because the caller
 	 * is required to hold the mmap_lock in read mode.  We need the
@@ -2064,6 +2066,8 @@ int expand_downwards(struct vm_area_struct *vma, unsigned long address)
 		return -ENOMEM;
 	}
 
+	/* Lock the VMA before expanding to prevent concurrent page faults */
+	vma_start_write(vma);
 	/*
 	 * vma->vm_start/vm_end cannot change under us because the caller
 	 * is required to hold the mmap_lock in read mode.  We need the
-- 
2.41.0.390.g38632f3daf-goog

