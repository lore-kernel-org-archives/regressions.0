Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0BF273D77
	for <regressions@lists.linux.dev>; Sat,  4 Apr 2026 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775312926; cv=none; b=TNh6A4DGroaCRgpRUd3iQkXw/Tv4VHDJ2NNFfIWJUEWIqx4VlIERAx8goLEqZgKZhUfYkTZgBluibIbevb1KYX4q1WtUQsVf6Rh3dN5z9SvW1I7XRfs2bvEtb68GLwMWXRSICaApX1iBIhpGmyC/K1ooJlhDFdVnt9DJwIi5FVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775312926; c=relaxed/simple;
	bh=xwE5t0LG/3F20TNNrUtGY613jux+lpvRpheRVJYPn+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XTHgeoRa4010CBCMt4wfpDtovSmoQzstTWuPFu2i7+BFpUkx6KWU3I1sN60BAVyyfIiWRBSMuiMg0HtwY55bxpWZ9SrOQoVpKVElBDnXAhE8aoKnihqmxVbR2FxIlmO1Zhz2isC02zImogWH0mnH4TwW2DbSXdfjj1Pki7IRpRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7Fqi+6w; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7Fqi+6w"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8d0288d24f6so395114885a.0
        for <regressions@lists.linux.dev>; Sat, 04 Apr 2026 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775312924; x=1775917724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nna7XikjSIt8v38EvLKlFvQXyQgfQaOAHmwwtVCsG/8=;
        b=D7Fqi+6wToShp7QTsBVLc/nmZuRlBomo6Rex+DCTKX2Th4yx9ayBhTkFavKhER8bYG
         h8r4h5Ogpxt7TcHJB9qzbxPZr3La3smmiiFnoBqoiO9uJttb21/cKfJ3MqgrWtqNk1L6
         sHoJh36sELNVKJj67UcDoSxTV5s2rRozjL7QgSE9m9nOAIMSZ4BCD3he+IbVd5EQNM/U
         PkoS3wpAwjVvCtS6oS4ClYjAvesM3haTQVaEvLYxoT8FMtcHMaqG0Vj3kLaB6R6Js9Sd
         6CCgaAiOHGqwlawpPkEbtdv/v1R/nTK6FaWzG3O/cs9WoEdNnHMt4qHD5aU9tb0Jc1lW
         wJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775312924; x=1775917724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nna7XikjSIt8v38EvLKlFvQXyQgfQaOAHmwwtVCsG/8=;
        b=NHXVf3ExwR2eiuT6PQzlVVMiQADe8QiWijQSBE/kSuK6712DE4nmpX8V8WhWKKmC+D
         6QbrrcZUAd/ZIwfb2liQ/naFDKfxcYm517HXJ+givc5xUtzeVrIQc/WN3GZQuQI02W/h
         XjXkIbp9LcD95NC2ApIfNv70jOoNFRhKfcksiAI3EH/AG9OQxbftlGsgG1tsAfmqcGrF
         CEGAb0l8cIyKnMbfqocrBV/3yKRBvuhjRw6SBbub3NZk2IA4K2LLakR3j4nqdKcYzemH
         TLBMl6nBxTzRWYkVCAViACxnuMv6QyWM7eaoDaeYzGGSX6wf/Fu5O5Ao1K4NTocLimIN
         MabA==
X-Forwarded-Encrypted: i=1; AJvYcCXWmXzgY3ZiBEyDFLeGSDQCbv79fhxMtXwjkfjGhja+1N5KAe71FOs1Ap90WzjKN7RaP3gLZqYKgGccBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr+2uBFVkfA3siIjrf+J1+fX7Nr5pp2rM3jTUv4IcG68lxch9+
	21jS2dfyqTdBO3zrwpG361XmeTNwZJtZwXnsgMxtUViliGjDzZUw+aTW
X-Gm-Gg: AeBDieuPGjTxCCsj+iow4UXqRfE8KxS054YTECXbPgUpirhm9IRJvxWHQI/K0iNrNsv
	YWq/4ipPhi+G285HjP/KtrmKsos9we47MWYQauZ1TV1Aqkm4N5j9jpYYpu7ERVqOnmFidPIFyge
	xq2DMVTkKTf+LlQ8pPg3InWmVq48mb9/Fx3kKWbpncxPgKk6j6KgGyF60/DaGT0xe6hN3dKpa6S
	4seL5pdKSvvBSFwvWdfRP+wP55dQDHZw1efTopf5+prkvxK5U7oqTC6KSQ2UmAmsUx+jVrCaag5
	G7IX4fhadXy6xPXzYLiqJooMjsah96Rm+RNa1NbHBHAmTw8fAGsGyVWfesCfybtx1nthz+9U73F
	0UpKByZNgDinOxprjrcyyEwJUaVZz/hebPxQtmLqZYHgpypxMHQNnbPKV+b08Gd+dCU2beMPchf
	oq6bD46AlU5ngBqNtkuDnGvwWeuoEoFjJUIcJQ9CP27As=
X-Received: by 2002:a05:620a:4147:b0:8cd:b317:d69f with SMTP id af79cd13be357-8d301d90232mr1129492085a.17.1775312924148;
        Sat, 04 Apr 2026 07:28:44 -0700 (PDT)
Received: from desktop.. ([2607:fea8:d681:2400:e8ee:54ba:50d9:dea6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d4b24ea458sm299111085a.9.2026.04.04.07.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 07:28:43 -0700 (PDT)
From: Tushar Sariya <tushar.sariya77@gmail.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	carnil@debian.org,
	maik.nergert@uni-hamburg.de,
	valentin.samir@magellium.fr,
	regressions@lists.linux.dev,
	Tushar Sariya <tushar.97@hotmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/1] NFSv4.1: Apply session size limits on clone path
Date: Sat,  4 Apr 2026 11:58:03 -0230
Message-ID: <20260404142831.3341498-2-tushar.sariya77@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404142831.3341498-1-tushar.sariya77@gmail.com>
References: <177349021750.3039212.10211295677877269201@eldamar.lan>
 <20260404142831.3341498-1-tushar.sariya77@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tushar Sariya <tushar.97@hotmail.com>

nfs4_clone_server() builds a child nfs_server for same-server
automounted submounts but never calls nfs4_session_limit_rwsize()
or nfs4_session_limit_xasize() after nfs_clone_server(). This means
the child mount can end up with rsize/wsize values that exceed the
negotiated session channel limits, causing NFS4ERR_REQ_TOO_BIG and
EIO on servers that enforce tight max_request_size budgets.

Top-level mounts go through nfs4_server_common_setup() which calls
these limiters after nfs_probe_server(). Apply the same clamping on
the clone path for consistency.

Fixes: 2b092175f5e3 ("NFS: Fix inheritance of the block sizes when automounting")
Cc: stable@vger.kernel.org
Signed-off-by: Tushar Sariya <tushar.97@hotmail.com>
---
 fs/nfs/internal.h   | 2 ++
 fs/nfs/nfs4client.c | 4 ++--
 fs/nfs/nfs4proc.c   | 3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 63e09dfc27a8..0338603e9674 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -253,6 +253,8 @@ extern struct nfs_client *nfs4_set_ds_client(struct nfs_server *mds_srv,
 					     u32 minor_version);
 extern struct rpc_clnt *nfs4_find_or_create_ds_client(struct nfs_client *,
 						struct inode *);
+extern void nfs4_session_limit_rwsize(struct nfs_server *server);
+extern void nfs4_session_limit_xasize(struct nfs_server *server);
 extern struct nfs_client *nfs3_set_ds_client(struct nfs_server *mds_srv,
 			const struct sockaddr_storage *ds_addr, int ds_addrlen,
 			int ds_proto, unsigned int ds_timeo,
diff --git a/fs/nfs/nfs4client.c b/fs/nfs/nfs4client.c
index c211639949c2..71c271a1700a 100644
--- a/fs/nfs/nfs4client.c
+++ b/fs/nfs/nfs4client.c
@@ -855,7 +855,7 @@ EXPORT_SYMBOL_GPL(nfs4_set_ds_client);
  * Limit the mount rsize, wsize and dtsize using negotiated fore
  * channel attributes.
  */
-static void nfs4_session_limit_rwsize(struct nfs_server *server)
+void nfs4_session_limit_rwsize(struct nfs_server *server)
 {
 	struct nfs4_session *sess;
 	u32 server_resp_sz;
@@ -878,7 +878,7 @@ static void nfs4_session_limit_rwsize(struct nfs_server *server)
 /*
  * Limit xattr sizes using the channel attributes.
  */
-static void nfs4_session_limit_xasize(struct nfs_server *server)
+void nfs4_session_limit_xasize(struct nfs_server *server)
 {
 #ifdef CONFIG_NFS_V4_2
 	struct nfs4_session *sess;
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 91bcf67bd743..655617ffca8d 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -10618,6 +10618,9 @@ static struct nfs_server *nfs4_clone_server(struct nfs_server *source,
 	if (IS_ERR(server))
 		return server;
 
+	nfs4_session_limit_rwsize(server);
+	nfs4_session_limit_xasize(server);
+
 	error = nfs4_delegation_hash_alloc(server);
 	if (error) {
 		nfs_free_server(server);
-- 
2.43.0

