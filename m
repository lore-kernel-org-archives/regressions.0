Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2581639
	for <regressions@lists.linux.dev>; Tue, 12 Dec 2023 00:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rkolchmeyer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TgB0ox8b"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-db402e6f61dso5577119276.3
        for <regressions@lists.linux.dev>; Mon, 11 Dec 2023 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702341606; x=1702946406; darn=lists.linux.dev;
        h=cc:to:from:subject:date:message-id:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UW9BPRtrX5yeOjPq63HaAVTX2kXYRY7LwoiqcuzWcDw=;
        b=TgB0ox8btA1XZVNdWuEhEc7x/LaW1x//KMUxuz9oHWpwj4FMjGS1kdHRiO7Jql0Bge
         0d8IJk00mLhMxj3pTQE2iPhpxVWWoNI66OjeT3lxUy5pWcWrw9TJgNwG7rVZA2LRJg3+
         SzcT+u/O4xpTpp4TiS6uI9p7d5OioQ13wPi8SXSdtYy2SQKHSn+y6GocV3ytEBdMb8jd
         yOUEhZLDCAFE7zAO1sXOsryPJMlmfUvkUe0j7nb3ENTEGe8tUE2na7soMfREhvJnaKHp
         2V+t+6qUb7OdiDyPKzOQ4koU8wfnR1R1bswg3DfrzLLNxu/DjZiUTyasN3tTGJqryFqx
         +czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702341606; x=1702946406;
        h=cc:to:from:subject:date:message-id:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UW9BPRtrX5yeOjPq63HaAVTX2kXYRY7LwoiqcuzWcDw=;
        b=XcBr//sQJ6AIGAtyVGJ+sMF0Nj/nBDW/aDFK219cJyjlq/FaDSMzSD8az4XFGSERiQ
         JhjoQjxA9rRCAW4YPknFizVvqXcSmBi3MOOTe15UHKNpg7J3F7oT4iefl1VEkbCB3+5u
         IiWQRfxEY14BR2HEgtUGpwQ/ZE4I6fJy6/8hZ4nDCBHy3kzSB6KoESxLKpFk5PJ7S4UW
         e1tUKuVEQpOuD0HmeaoMcOKVghbsgTMquGi19WCMN4yLfkyjxQd+cl4BXbEeVUwpRWME
         Vo8c1xIAucq4OrJ/75S4g7lg+EHj77m2lD7RaQNyKV4Vh3u3eEFobiaxzI0I9ZMOX58a
         nixg==
X-Gm-Message-State: AOJu0YzrSK2PQuddPHbH5Hfmid5AwLTqfDNuWF+cDCWkl1ALft7hjtrb
	5vMVb9r1AD/EAf6vFviAsLaD/Gtta8ZtZBnM
X-Google-Smtp-Source: AGHT+IGpdRYKog8O3ECVxpAVaSQkHbxHaC25i2GNLin3TWnDgcTa1qXatdKnpeC2to6BrfdImiW9BfUPsiVppWbzmw==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: from rkolchmeyer.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:7f04])
 (user=rkolchmeyer job=sendgmr) by 2002:a25:3c4:0:b0:daf:6333:17c3 with SMTP
 id 187-20020a2503c4000000b00daf633317c3mr41492ybd.1.1702341605889; Mon, 11
 Dec 2023 16:40:05 -0800 (PST)
Message-ID: <000000000000b505f3060c454a49@google.com>
Date: Tue, 12 Dec 2023 00:40:05 +0000
Subject: IMA performance regression in 5.10.194 when using overlayfs
From: <rkolchmeyer@google.com>
To: stable@vger.kernel.org
Cc: linux-integrity@vger.kernel.org, regressions@lists.linux.dev, 
	eric.snowberg@oracle.com, zohar@linux.ibm.com, jlayton@kernel.org, 
	sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

5.10.194 includes 331d85f0bc6e (ovl: Always reevaluate the file
signature for IMA), which resulted in a performance regression for
workloads that use IMA and run from overlayfs. 5.10.202 includes
cd5a262a07a5 (ima: detect changes to the backing overlay file), which
resolved the regression in the upstream kernel. However, from my
testing [1], this change doesn't resolve the regression on stable
kernels.

From what I can tell, cd5a262a07a5 (ima: detect changes to the
backing overlay file) depends on both db1d1e8b9867 (IMA: use
vfs_getattr_nosec to get the i_version) and a1175d6b1bda (vfs: plumb
i_version handling into struct kstat). These two dependent changes
were not backported to stable kernels. As a result, IMA seems to be
caching the wrong i_version value when using overlayfs. From my
testing, backporting these two dependent changes is sufficient to
resolve the issue in stable kernels.

Would it make sense to backport those changes to stable kernels? It's
possible that they may not follow the stable kernel patching rules. I
think the issue can also be fixed directly in stable trees with the
following diff (which doesn't make sense in the upstream kernel):

diff --git a/security/integrity/ima/ima_api.c b/security/integrity/ima/ima_api.c
index 70efd4aa1bd1..c84ae6b62b3a 100644
--- a/security/integrity/ima/ima_api.c
+++ b/security/integrity/ima/ima_api.c
@@ -239,7 +239,7 @@ int ima_collect_measurement(struct integrity_iint_cache *iint,
 	 * which do not support i_version, support is limited to an initial
 	 * measurement/appraisal/audit.
 	 */
-	i_version = inode_query_iversion(inode);
+	i_version = inode_query_iversion(real_inode);
 	hash.hdr.algo = algo;
 
 	/* Initialize hash digest to 0's in case of failure */

I've verified that this diff resolves the performance regression.

Which approach would make the most sense to fix the issue in stable
kernels? Backporting the dependent commits, or merging the above diff?

I'd be happy to prepare and mail patches either way. Looking forward
to your thoughts.

Thanks,
-Robert

[1] I'm benchmarking with the following:

cat <<EOF > /sys/kernel/security/ima/policy
audit func=BPRM_CHECK
audit func=FILE_MMAP mask=MAY_EXEC
EOF
docker run --rm debian bash -c "TIMEFORMAT=%3R; time bash -c :"

A good result looks like 0.002 (units are seconds), and a bad result
looks like 0.034.
