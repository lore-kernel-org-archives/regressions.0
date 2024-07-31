Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B347748D
	for <regressions@lists.linux.dev>; Wed, 31 Jul 2024 02:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722393359; cv=pass; b=t09Pkn3kavltXijvW6eKQ2qhFHbAe1af880w/wKaEdCAMPeyNHnA6YhCjV2SGvmndtNYLvjmX7CSWbp7qFVEp2/6YHhn5jTd02b3yhnGq3dTwKQStTg2IlivxW14otjT2BHV4MXWdUmljGu93gjnFfWWKpZ0DbYKeALI5aSmpHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722393359; c=relaxed/simple;
	bh=GIdOJPQRfuvBzAySs3qm01wZ2N2wnYcXbUj+wJsb+/k=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=bbgeIMoXD7k3eThmoBAiQveIUoEvLVQe8BlDkNL4INWnNVUQQQrqFeTc++7vutLkcbdKhQidXwJiwvXkQKQ0pzY8dxXVnhgogDu8b3a2Wg18Rf8nYiDWON6axAjauGhzeigJjpCkYxc4bDa46caCHZ/7sBaaK+PI5NESju6SX8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=RSdwsk1b; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="RSdwsk1b"
Message-ID: <ac58f36e10af65cd672fba66e99faa2c@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722393350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxipKliiMKa/7DuRS/Ce+aaWDKWfZdaQQ+MuwSJ/gLo=;
	b=RSdwsk1bsLjFB79Am7ykzAxpeYJ4t+b3Mwr+SNUq6OHhvcjuBJ4SGsRWP/HppoiR7r/aug
	ZKXkUWD6um0DUNNCusxFTuJEL8OksMUJM/EeKUj8LgAB4B8p1xa7wI8x+f8DOrzvoGxg97
	MCa0aSDc0BlvEXpH2AjB4lBZUkBTgyROqX9kSH4+SG5mlNBl9/3d2UsXd1+DGPb5jUuYtw
	zU90YWR81boJ1WfhTW1wEWE9CkrVNNNgzLW206fU7sTDaw+LStWsTQDqFZP3EgnMJeCO6o
	WWe8S1VqM4Tae62CmCRD1RijcTmdn6sG2A4hCqQ5ADMC1p3vc7S11s2lsLO0Rg==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1722393350; a=rsa-sha256;
	cv=none;
	b=PgLeVlg6+YK4iaZFYEe8VGc1uiS74xKeG+fs5EQRAo4hwPJ+foDWBFPzhFFsXwuYycKGpq
	J/S7ru3REO2KrBJfYzd9nagJpAglnI98Z8MWXubcRHoewDQzo2HozrFLZJQ7HVvzVCyvz6
	sjqYvNjcMf+YFemNxZS3pXpMTKQ/m8LOtP++EuwMMHEXiW2bG1vNzZZmr4YJBjLXbeQO6x
	i2xqVUEE0kYHTwZ5YfdVtSONAIKEugHWjafegHUjGid7VvatYIcCutBhFJfhebeIjYtU9o
	pTeHQMwp/lkQ9iTJvqK2W9vGk+HeAS4QCYxONT8y2xFojNAnl/umbBwzAG+4OQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722393350; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hxipKliiMKa/7DuRS/Ce+aaWDKWfZdaQQ+MuwSJ/gLo=;
	b=TrnzLtVlOwnXYpjBdE07a3Sr+/CQXJXpemp91hkIRc2T08ZiKFhKuukwHDkTNmYgsoNq20
	t3vaiFaYQCBh03lQ0+rKyIob3ltFMFynGjUd6r6l4o8auYDtj1vRQY/nZLDYbOp9JH/BlQ
	/sMNyASQLJF7SZGsFwDzTJipz7NIufygp1aRqMFKFemm4s7DiBRxXAMwG9f59pkxOhqf+j
	bQ/3RhNHEPQIQWIVf7svUV6Wmgd9yCOs3fWTlxis0/0ufSlqfCOHtAYZN/nTEW1kD1tjMu
	gdNPkJ4TlU2VMLKFHJGCiVbw99lb6zvIQvevZ40owkcFOHcBigB1luMkQvtSeA==
From: Paulo Alcantara <pc@manguebit.com>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C_Sebastian?=
 <Sebastian.Steinbeisser@lrz.de>,
 "tom@talpey.com" <tom@talpey.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Cc: "smfrench@gmail.com" <smfrench@gmail.com>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
In-Reply-To: <aed542086314197bcec6a50c7d6ee76cb6e65f96.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <dd0259752e3557fa1b60dda4db3bf790d9ff877c.camel@lrz.de>
 <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
 <98d458ba-4258-4598-b8fc-0fe6cfeb2f87@talpey.com>
 <2849de0676a015619b922708005a243595f9f56b.camel@lrz.de>
 <6db3dbb8a7a6f4f5ed0f63d0e0c784c7@manguebit.com>
 <8bf2462eb9aa4d30b866da57720a36c90c0a43df.camel@lrz.de>
 <d208a9307b32ccf4d3fd7b08c6b95445@manguebit.com>
 <aed542086314197bcec6a50c7d6ee76cb6e65f96.camel@lrz.de>
Date: Tue, 30 Jul 2024 23:35:45 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Steinbei=C3=9Fer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:

> Find the logs attached.

Thanks.

Could you please try the attached patch instead?

Whether it works or not, please provide new network traces and logs.

--=-=-=
Content-Type: text/x-patch
Content-Disposition: attachment;
 filename=0001-smb-client-handle-lack-of-FSCTL_GET_REPARSE_POINT-su.patch

From 667667048d5f2762689b19d8f2e99e3858abf259 Mon Sep 17 00:00:00 2001
From: Paulo Alcantara <pc@manguebit.com>
Date: Tue, 30 Jul 2024 23:07:45 -0300
Subject: [PATCH] smb: client: handle lack of FSCTL_GET_REPARSE_POINT support

As per MS-FSA 2.1.5.10.14, support for FSCTL_GET_REPARSE_POINT is
optional and if the server doesn't support it,
STATUS_INVALID_DEVICE_REQUEST must be returned for the operation.

If we find files with reparse points and we can't parse them due to
lack of client or server support, just ignore it and then treat them
as regular files or junctions.

Signed-off-by: Paulo Alcantara (Red Hat) <pc@manguebit.com>
---
 fs/smb/client/inode.c     | 17 +++++++++++++++--
 fs/smb/client/reparse.c   |  4 ++++
 fs/smb/client/reparse.h   | 19 +++++++++++++++++--
 fs/smb/client/smb2inode.c |  2 ++
 4 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
index 4a8aa1de9522..dd0afa23734c 100644
--- a/fs/smb/client/inode.c
+++ b/fs/smb/client/inode.c
@@ -1042,13 +1042,26 @@ static int reparse_info_to_fattr(struct cifs_open_info_data *data,
 	}
 
 	rc = -EOPNOTSUPP;
-	switch ((data->reparse.tag = tag)) {
-	case 0: /* SMB1 symlink */
+	data->reparse.tag = tag;
+	if (!data->reparse.tag) {
 		if (server->ops->query_symlink) {
 			rc = server->ops->query_symlink(xid, tcon,
 							cifs_sb, full_path,
 							&data->symlink_target);
 		}
+		if (rc == -EOPNOTSUPP)
+			data->reparse.tag = IO_REPARSE_TAG_INTERNAL;
+	}
+
+	switch (data->reparse.tag) {
+	case 0: /* SMB1 symlink */
+		break;
+	case IO_REPARSE_TAG_INTERNAL:
+		rc = 0;
+		if (le32_to_cpu(data->fi.Attributes) & ATTR_DIRECTORY) {
+			cifs_create_junction_fattr(fattr, sb);
+			goto out;
+		}
 		break;
 	case IO_REPARSE_TAG_MOUNT_POINT:
 		cifs_create_junction_fattr(fattr, sb);
diff --git a/fs/smb/client/reparse.c b/fs/smb/client/reparse.c
index a0ffbda90733..689d8a506d45 100644
--- a/fs/smb/client/reparse.c
+++ b/fs/smb/client/reparse.c
@@ -505,6 +505,10 @@ bool cifs_reparse_point_to_fattr(struct cifs_sb_info *cifs_sb,
 	}
 
 	switch (tag) {
+	case IO_REPARSE_TAG_INTERNAL:
+		if (!(fattr->cf_cifsattrs & ATTR_DIRECTORY))
+			return false;
+		fallthrough;
 	case IO_REPARSE_TAG_DFS:
 	case IO_REPARSE_TAG_DFSR:
 	case IO_REPARSE_TAG_MOUNT_POINT:
diff --git a/fs/smb/client/reparse.h b/fs/smb/client/reparse.h
index 6b55d1df9e2f..2c0644bc4e65 100644
--- a/fs/smb/client/reparse.h
+++ b/fs/smb/client/reparse.h
@@ -12,6 +12,12 @@
 #include "fs_context.h"
 #include "cifsglob.h"
 
+/*
+ * Used only by cifs.ko to ignore reparse points from files when client or
+ * server doesn't support FSCTL_GET_REPARSE_POINT.
+ */
+#define IO_REPARSE_TAG_INTERNAL ((__u32)~0U)
+
 static inline dev_t reparse_nfs_mkdev(struct reparse_posix_data *buf)
 {
 	u64 v = le64_to_cpu(*(__le64 *)buf->DataBuffer);
@@ -78,10 +84,19 @@ static inline u32 reparse_mode_wsl_tag(mode_t mode)
 static inline bool reparse_inode_match(struct inode *inode,
 				       struct cifs_fattr *fattr)
 {
+	struct cifsInodeInfo *cinode = CIFS_I(inode);
 	struct timespec64 ctime = inode_get_ctime(inode);
 
-	return (CIFS_I(inode)->cifsAttrs & ATTR_REPARSE) &&
-		CIFS_I(inode)->reparse_tag == fattr->cf_cifstag &&
+	/*
+	 * Do not match reparse tags when client or server doesn't support
+	 * FSCTL_GET_REPARSE_POINT.  @fattr->cf_cifstag should contain correct
+	 * reparse tag from query dir response but the client won't be able to
+	 * read the reparse point data anyway.  This spares us a revalidation.
+	 */
+	if (cinode->reparse_tag != IO_REPARSE_TAG_INTERNAL &&
+	    cinode->reparse_tag != fattr->cf_cifstag)
+		return false;
+	return (cinode->cifsAttrs & ATTR_REPARSE) &&
 		timespec64_equal(&ctime, &fattr->cf_ctime);
 }
 
diff --git a/fs/smb/client/smb2inode.c b/fs/smb/client/smb2inode.c
index 5c02a12251c8..062b86a4936f 100644
--- a/fs/smb/client/smb2inode.c
+++ b/fs/smb/client/smb2inode.c
@@ -930,6 +930,8 @@ int smb2_query_path_info(const unsigned int xid,
 
 	switch (rc) {
 	case 0:
+		rc = parse_create_response(data, cifs_sb, &out_iov[0]);
+		break;
 	case -EOPNOTSUPP:
 		/*
 		 * BB TODO: When support for special files added to Samba
-- 
2.45.2


--=-=-=--
