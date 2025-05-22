Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71F529A30F
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 16:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747933084; cv=none; b=MKvAD16R2BWP01p+uedWltcC3F1tT3yIuxoUyObfocTP5QUtJdq/g0YmfCLHe10g82W1zsRBC4xNeZdWRJEBT0XzNgfIi6a8kulJp0bRMYLbk47yqLVlCYM4L6wt2B7vh2n+mWAF6P1vA7jRdTm2dNlWsv2GLfjbeCjRdY0Im/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747933084; c=relaxed/simple;
	bh=di6lnctZ68CbdemR33SuOnK3IAPWYGRSZBaWZU+U9qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G+ZjRl2OGL8Zs91tMNcNyB4tMVBnjkF6ImfYVN42sepmVaqs3ijPyLiI+Xv4MRJbicyriqS2YDyHS0sjURCUodwxNJM+YZvdVwJfivhRAHl0wlebKWyG04GDzY9aool3KhT4i6/HhNn1yqcq1lemQajAuf1hxfxbpca6c76/7ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XCbJ4j7W; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XCbJ4j7W"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747933079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPijSL2WisLPW5DPkG2EvWUbi5fqv6ZMUHX/vaHGFuQ=;
	b=XCbJ4j7WVNxBudet2hjX1T0NYBsAXVnSru2j4c0JOpPMszn4dWc2C/mtAHRssjcMb9usEK
	p0EJhLHmeA7tijdK78h9wwqWn4o1bBcL8DqIxIC8kNNjNudVLK6Xw1d3XTvMHEaClR7tpf
	zU6/iXrURMIqB7X16QHbL2PUHHlGmk4=
From: Kent Overstreet <kent.overstreet@linux.dev>
To: linux-bcachefs@vger.kernel.or
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	lkft-triage@lists.linaro.org,
	regressions@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH 2/3] bcachefs: bch2_trans_log_str()
Date: Thu, 22 May 2025 12:57:51 -0400
Message-ID: <20250522165752.2908964-2-kent.overstreet@linux.dev>
In-Reply-To: <20250522165752.2908964-1-kent.overstreet@linux.dev>
References: <CA+G9fYv08Rbg4f8ZyoZC9qseKdRygy8y86qFvts5D=BoJg888g@mail.gmail.com>
 <20250522165752.2908964-1-kent.overstreet@linux.dev>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The data update path doesn't need a printbuf for its log message - this
will help reduce stack usage.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 fs/bcachefs/btree_update.c | 26 ++++++++++++++++++--------
 fs/bcachefs/btree_update.h |  1 +
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/fs/bcachefs/btree_update.c b/fs/bcachefs/btree_update.c
index afd05c3dfd03..8fe2834f9d57 100644
--- a/fs/bcachefs/btree_update.c
+++ b/fs/bcachefs/btree_update.c
@@ -829,25 +829,35 @@ int bch2_btree_bit_mod_buffered(struct btree_trans *trans, enum btree_id btree,
 	return bch2_trans_update_buffered(trans, btree, &k);
 }
 
-int bch2_trans_log_msg(struct btree_trans *trans, struct printbuf *buf)
+static int __bch2_trans_log_str(struct btree_trans *trans, const char *str, unsigned len)
 {
-	unsigned u64s = DIV_ROUND_UP(buf->pos, sizeof(u64));
-
-	int ret = buf->allocation_failure ? -BCH_ERR_ENOMEM_trans_log_msg : 0;
-	if (ret)
-		return ret;
+	unsigned u64s = DIV_ROUND_UP(len, sizeof(u64));
 
 	struct jset_entry *e = bch2_trans_jset_entry_alloc(trans, jset_u64s(u64s));
-	ret = PTR_ERR_OR_ZERO(e);
+	int ret = PTR_ERR_OR_ZERO(e);
 	if (ret)
 		return ret;
 
 	struct jset_entry_log *l = container_of(e, struct jset_entry_log, entry);
 	journal_entry_init(e, BCH_JSET_ENTRY_log, 0, 1, u64s);
-	memcpy_and_pad(l->d, u64s * sizeof(u64), buf->buf, buf->pos, 0);
+	memcpy_and_pad(l->d, u64s * sizeof(u64), str, len, 0);
 	return 0;
 }
 
+int bch2_trans_log_str(struct btree_trans *trans, const char *str)
+{
+	return __bch2_trans_log_str(trans, str, strlen(str));
+}
+
+int bch2_trans_log_msg(struct btree_trans *trans, struct printbuf *buf)
+{
+	int ret = buf->allocation_failure ? -BCH_ERR_ENOMEM_trans_log_msg : 0;
+	if (ret)
+		return ret;
+
+	return __bch2_trans_log_str(trans, buf->buf, buf->pos);
+}
+
 int bch2_trans_log_bkey(struct btree_trans *trans, enum btree_id btree,
 			unsigned level, struct bkey_i *k)
 {
diff --git a/fs/bcachefs/btree_update.h b/fs/bcachefs/btree_update.h
index a54dc7277177..f907eaa8b185 100644
--- a/fs/bcachefs/btree_update.h
+++ b/fs/bcachefs/btree_update.h
@@ -205,6 +205,7 @@ void bch2_trans_commit_hook(struct btree_trans *,
 			    struct btree_trans_commit_hook *);
 int __bch2_trans_commit(struct btree_trans *, unsigned);
 
+int bch2_trans_log_str(struct btree_trans *, const char *);
 int bch2_trans_log_msg(struct btree_trans *, struct printbuf *);
 int bch2_trans_log_bkey(struct btree_trans *, enum btree_id, unsigned, struct bkey_i *);
 
-- 
2.49.0

