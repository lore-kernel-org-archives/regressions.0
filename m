Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AD629AAE8
	for <regressions@lists.linux.dev>; Thu, 22 May 2025 16:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747933084; cv=none; b=MrhmW5WnqhxhiDlmBqVKsXTAcccUybwmrkR91DmtoQvb8mesNXxwBEFZXnLftPZO21UmUPUWHdTgGkA59h6MYiuobG/WSTNIQqBrIH5JoB1lGJGPQYe8RP/N7IFNggxPt0RQQBkUzwCsMafFqYLlCtHCDRzBXC8XMNVX8DrQWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747933084; c=relaxed/simple;
	bh=8bycyAX2CnGRWEPfe5QqxjtD/hKLSMfQtjlluZMWa0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM+34pKMbhKAC0X7t1EQ6K9giWJl5CgmwiDlgjZvOY8R9Dh1vItDTuGvhwzyD0G6u07DAPxocfJz1QVgzWl/rt/GC5AUbrx7anYFh7De+ofAvmH27A6cXcio8BjJRVnbPVdvKkBomBCBM4jalYlgp7xW1CWrtouKYLP5GHDzXV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U5Xr1WvS; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U5Xr1WvS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747933078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaJCO4NPw0lmVfHRFMR+NAX5BhcPb9kBlRlDLeirRDo=;
	b=U5Xr1WvSWSYacOpjRYY/3pkMcryAYrYHSc5rkx1NtVZYQ+B78RNRp4cBTE3uGo2qoNZXX9
	/HbXub235eUeUL/tI9sjx7cNSQsxQPQ/Iz/jcr9dr5XI7wriqCHH8yWLdVdgYzGwbALGAz
	EK95GVLglknD/DNz75JoQzAshivPYYs=
From: Kent Overstreet <kent.overstreet@linux.dev>
To: linux-bcachefs@vger.kernel.or
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	lkft-triage@lists.linaro.org,
	regressions@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH 1/3] bcachefs: Kill bkey_buf usage in data_update_index_update()
Date: Thu, 22 May 2025 12:57:50 -0400
Message-ID: <20250522165752.2908964-1-kent.overstreet@linux.dev>
In-Reply-To: <CA+G9fYv08Rbg4f8ZyoZC9qseKdRygy8y86qFvts5D=BoJg888g@mail.gmail.com>
References: <CA+G9fYv08Rbg4f8ZyoZC9qseKdRygy8y86qFvts5D=BoJg888g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Reduce stack usage - bkey_buf has a 96 byte buffer on the stack, but the
btree_trans bump allocator works just fine here.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
---
 fs/bcachefs/data_update.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/fs/bcachefs/data_update.c b/fs/bcachefs/data_update.c
index de096ca65b4b..ef648a6d9c52 100644
--- a/fs/bcachefs/data_update.c
+++ b/fs/bcachefs/data_update.c
@@ -187,14 +187,9 @@ static int __bch2_data_update_index_update(struct btree_trans *trans,
 	struct data_update *m =
 		container_of(op, struct data_update, op);
 	struct keylist *keys = &op->insert_keys;
-	struct bkey_buf _new, _insert;
 	struct printbuf journal_msg = PRINTBUF;
 	int ret = 0;
 
-	bch2_bkey_buf_init(&_new);
-	bch2_bkey_buf_init(&_insert);
-	bch2_bkey_buf_realloc(&_insert, c, U8_MAX);
-
 	bch2_trans_iter_init(trans, &iter, m->btree_id,
 			     bkey_start_pos(&bch2_keylist_front(keys)->k),
 			     BTREE_ITER_slots|BTREE_ITER_intent);
@@ -229,11 +224,22 @@ static int __bch2_data_update_index_update(struct btree_trans *trans,
 			goto nowork;
 		}
 
-		bkey_reassemble(_insert.k, k);
-		insert = _insert.k;
+		insert = bch2_trans_kmalloc(trans,
+					    bkey_bytes(k.k) +
+					    bkey_val_bytes(&new->k) +
+					    sizeof(struct bch_extent_rebalance));
+		ret = PTR_ERR_OR_ZERO(insert);
+		if (ret)
+			goto err;
+
+		bkey_reassemble(insert, k);
+
+		new = bch2_trans_kmalloc(trans, bkey_bytes(&new->k));
+		ret = PTR_ERR_OR_ZERO(new);
+		if (ret)
+			goto err;
 
-		bch2_bkey_buf_copy(&_new, c, bch2_keylist_front(keys));
-		new = bkey_i_to_extent(_new.k);
+		bkey_copy(&new->k_i, bch2_keylist_front(keys));
 		bch2_cut_front(iter.pos, &new->k_i);
 
 		bch2_cut_front(iter.pos,	insert);
@@ -457,8 +463,6 @@ static int __bch2_data_update_index_update(struct btree_trans *trans,
 out:
 	printbuf_exit(&journal_msg);
 	bch2_trans_iter_exit(trans, &iter);
-	bch2_bkey_buf_exit(&_insert, c);
-	bch2_bkey_buf_exit(&_new, c);
 	BUG_ON(bch2_err_matches(ret, BCH_ERR_transaction_restart));
 	return ret;
 }
-- 
2.49.0

