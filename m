Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83AC4C7B
	for <regressions@lists.linux.dev>; Thu, 25 Jul 2024 01:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721870931; cv=pass; b=sp6KNo6pWESe8mCITXiflBxMTPdeDOjsF184BMyIq/QUl2UdOHpfHovhsdICb8FkFdBLvohgYPSYBCXwkKOEC9NqIXkm2VMAR6M02CgGYIxan5nrd+V3jIOicGNtkR++ab7eA5bCd+vEB+dpGP+QR67tbXE+qW8LjiJ4szMup/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721870931; c=relaxed/simple;
	bh=M2IQxqCUhSW0ZVklhrqnX6ZfJMCReQfWdpxIh0UBYKg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=MExH2N19cEKlrBFFJc37vLok9vlZ/ZR5zi4rROXPAWTaCc/nuAHXCpgipd2w9+vLQU4X387xk1pmlk/eDac0HR47iYdHkjit24FM7qGXhVwJMPwvWI85kXg+XdDPkEElbKXQs/RHlHL1CjqStin173Bd97sdHu4rl7grdkjdRog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=SD9Z22nY; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="SD9Z22nY"
Message-ID: <6db3dbb8a7a6f4f5ed0f63d0e0c784c7@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1721870921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jP1VCC3xnD3joeApsW6iqD5c6+l9BaGBHY73PudycWo=;
	b=SD9Z22nYpAY/1Dr12+9Cpjd4UU2M+WngTRVmws0djIWzI7dCm7XqQjxQ0qWxZt8Ol2rf6Y
	4dRga6rrkib11FhuvmtF3qlod7K+7HcEgG/CzNTNO/3/rbMyrLr1Kbikr4+9DbdrazGkIN
	HHhOkoxjGcTRkw92qbOqreOxBgB3IDdg+0kPEtpjd/YGETryx/F5PxfgB2Kn9M1NNexrR1
	UjKbiw/EXuPZ2nv3XzGxY3cKbsCak+P2CFq/h3UlCCci8kFak6I+58eRIytOCjtouvfYpf
	IKDGFzHTn796cNNFLyfbk46WRuuMAThPqfBx95feCnqw/YBseZeCwTTCqvgexg==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1721870921; a=rsa-sha256;
	cv=none;
	b=OVT0V0Ffr50HuW66yjaltnUEWObHnpiiit8nn5YApvY1KA6Y88m1+JzCEbWwBSRFp1nwP9
	6771HpJBBINPzYo3akKk79rLIIG9RGzbnbU6c2oLdVVld3slaTnuikPGByTZ5zOTGEE+vB
	Wdzbph2cM7BML6VyErsOgK7NiXIkT6mqEErCTqmCLKCOncM3oBwDKl/yOdn6sFxmGUcafb
	F+hezjMJiFq0R2/YiU5lKQT4gUUWS5+Tdl0IEN7H6LYAZ129Nx0WNbzyeZuKUYtiewFCJu
	zY1nuJ1jGEgPyqmuwabwp6Doiceum9ZP0ai9NzNrqLkqdynODYgjrKM/hVrHNQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1721870921; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jP1VCC3xnD3joeApsW6iqD5c6+l9BaGBHY73PudycWo=;
	b=jt53WgLpZ2wCHehu7OMbueb8NM7X8Xg6etYar/IB3ECZGidGdUcFzeSPH9S/1v6IsRjyrS
	1B1+ZfiZ37AkKVW8MH108E8iamho1W8pcBpqqhKQ+n37CRr3oNnYAmZ14m+B1IuU4bAEj0
	RAiZ8fbU3kpRyUmCQnxjiGXBrDD9soyAFvONJ7sa4AVaJlvIYLgWlhDYvcZ41blxUxknHr
	wuz0xIHRvQDCST0+WiK09WhfmvfiMFXQw0E9hUOP1EEkZDyvNjcfhrSd/yaH2YiLO7Q/IY
	vwQiC84076MtYXdIJDGxXfYrZuODL+mMJlRanwvRoorNT+7btSsaJpmiC4s63g==
From: Paulo Alcantara <pc@manguebit.com>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C_Sebastian?=
 <Sebastian.Steinbeisser@lrz.de>,
 "tom@talpey.com" <tom@talpey.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Cc: "smfrench@gmail.com" <smfrench@gmail.com>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
In-Reply-To: <2849de0676a015619b922708005a243595f9f56b.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <dd0259752e3557fa1b60dda4db3bf790d9ff877c.camel@lrz.de>
 <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
 <98d458ba-4258-4598-b8fc-0fe6cfeb2f87@talpey.com>
 <2849de0676a015619b922708005a243595f9f56b.camel@lrz.de>
Date: Wed, 24 Jul 2024 22:28:37 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tom, thank you very much for looking into this!

Steinbei=C3=9Fer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:

> I've forwarded the question to our technical NetApp rep.
> Hopefully they will directly reply to the list - if not, I'll forward
> any replies once we get them.

Any news from NetApp?

In the meantime, could you try below changes on top of v6.10?  Thanks.

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index a865941724c0..c405ffb59b55 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -2322,4 +2322,10 @@ static inline bool cifs_ses_exiting(struct cifs_ses =
*ses)
 	return ret;
 }
=20
+/*
+ * Used only by the client to ignore reparse points from files when the se=
rver
+ * doesn't support FSCTL_GET_REPARSE_POINT.
+ */
+#define IO_REPARSE_TAG_INTERNAL	0xffffffff
+
 #endif	/* _CIFS_GLOB_H */
diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
index 4a8aa1de9522..3a39933f6fc1 100644
--- a/fs/smb/client/inode.c
+++ b/fs/smb/client/inode.c
@@ -1042,14 +1042,26 @@ static int reparse_info_to_fattr(struct cifs_open_i=
nfo_data *data,
 	}
=20
 	rc =3D -EOPNOTSUPP;
-	switch ((data->reparse.tag =3D tag)) {
-	case 0: /* SMB1 symlink */
+	data->reparse.tag =3D tag;
+	if (!data->reparse.tag) {
 		if (server->ops->query_symlink) {
 			rc =3D server->ops->query_symlink(xid, tcon,
 							cifs_sb, full_path,
 							&data->symlink_target);
+		} else {
+			data->reparse.tag =3D IO_REPARSE_TAG_INTERNAL;
 		}
+	}
+
+	switch (data->reparse.tag) {
+	case 0: /* SMB1 symlink */
 		break;
+	case IO_REPARSE_TAG_INTERNAL:
+		if (!(le32_to_cpu(data->fi.Attributes) & ATTR_DIRECTORY)) {
+			rc =3D 0;
+			break;
+		}
+		fallthrough;
 	case IO_REPARSE_TAG_MOUNT_POINT:
 		cifs_create_junction_fattr(fattr, sb);
 		rc =3D 0;
diff --git a/fs/smb/client/reparse.c b/fs/smb/client/reparse.c
index a0ffbda90733..689d8a506d45 100644
--- a/fs/smb/client/reparse.c
+++ b/fs/smb/client/reparse.c
@@ -505,6 +505,10 @@ bool cifs_reparse_point_to_fattr(struct cifs_sb_info *=
cifs_sb,
 	}
=20
 	switch (tag) {
+	case IO_REPARSE_TAG_INTERNAL:
+		if (!(fattr->cf_cifsattrs & ATTR_DIRECTORY))
+			return false;
+		fallthrough;
 	case IO_REPARSE_TAG_DFS:
 	case IO_REPARSE_TAG_DFSR:
 	case IO_REPARSE_TAG_MOUNT_POINT:
diff --git a/fs/smb/client/reparse.h b/fs/smb/client/reparse.h
index 6b55d1df9e2f..4cf2fef9d988 100644
--- a/fs/smb/client/reparse.h
+++ b/fs/smb/client/reparse.h
@@ -78,10 +78,19 @@ static inline u32 reparse_mode_wsl_tag(mode_t mode)
 static inline bool reparse_inode_match(struct inode *inode,
 				       struct cifs_fattr *fattr)
 {
+	struct cifsInodeInfo *cinode =3D CIFS_I(inode);
 	struct timespec64 ctime =3D inode_get_ctime(inode);
=20
-	return (CIFS_I(inode)->cifsAttrs & ATTR_REPARSE) &&
-		CIFS_I(inode)->reparse_tag =3D=3D fattr->cf_cifstag &&
+	/*
+	 * Do not match reparse tags when the server doesn't support
+	 * FSCTL_GET_REPARSE_POINT.  @fattr->cf_cifstag should contain the
+	 * correct reparse tag but the client won't be able to parse the
+	 * reparse point data anyway.  This spares us a revalidation.
+	 */
+	if (cinode->reparse_tag !=3D IO_REPARSE_TAG_INTERNAL &&
+	    cinode->reparse_tag !=3D fattr->cf_cifstag)
+		return false;
+	return (cinode->cifsAttrs & ATTR_REPARSE) &&
 		timespec64_equal(&ctime, &fattr->cf_ctime);
 }
=20
diff --git a/fs/smb/client/smb2inode.c b/fs/smb/client/smb2inode.c
index 5c02a12251c8..eceefe006d52 100644
--- a/fs/smb/client/smb2inode.c
+++ b/fs/smb/client/smb2inode.c
@@ -856,6 +856,43 @@ static int parse_create_response(struct cifs_open_info=
_data *data,
 	return rc;
 }
=20
+static inline void free_qinfo_resp(struct kvec *rsp_iov,
+				   int *rsp_buftype, int num_resps)
+{
+	int i;
+
+	for (i =3D 0; i < num_resps; i++) {
+		free_rsp_buf(rsp_buftype[i], rsp_iov[i].iov_base);
+		rsp_buftype[i] =3D CIFS_NO_BUFFER;
+		memset(&rsp_iov[i], 0, sizeof(rsp_iov[i]));
+	}
+}
+
+/*
+ * If the server doesn't support FSCTL_GET_REPARSE_POINT, then just ignore=
 the
+ * SMB2_IOCTL error.  See MS-FSA 2.1.5.10.14.
+ */
+static inline bool may_ignore_reparse_error(struct kvec *rsp_iov,
+					    int *rsp_buftype,
+					    int num_resps)
+{
+	struct smb2_hdr *hdr;
+	int i;
+
+	for (i =3D 0; i < num_resps; i++) {
+		hdr =3D (struct smb2_hdr *)rsp_iov[i].iov_base;
+		if (!hdr || rsp_buftype[i] =3D=3D CIFS_NO_BUFFER)
+			return false;
+		if (hdr->Command =3D=3D SMB2_IOCTL) {
+			if (hdr->Status !=3D STATUS_INVALID_DEVICE_REQUEST)
+				return false;
+		} else if (hdr->Status !=3D STATUS_SUCCESS) {
+			return false;
+		}
+	}
+	return true;
+}
+
 int smb2_query_path_info(const unsigned int xid,
 			 struct cifs_tcon *tcon,
 			 struct cifs_sb_info *cifs_sb,
@@ -867,11 +904,11 @@ int smb2_query_path_info(const unsigned int xid,
 	struct cifsFileInfo *cfile;
 	struct cached_fid *cfid =3D NULL;
 	struct smb2_hdr *hdr;
-	struct kvec in_iov[3], out_iov[3] =3D {};
-	int out_buftype[3] =3D {};
+	struct kvec in_iov[5], out_iov[5] =3D {};
+	int out_buftype[5] =3D {};
 	int cmds[3];
 	bool islink;
-	int i, num_cmds =3D 0;
+	int num_cmds =3D 0;
 	int rc, rc2;
=20
 	data->adjust_tz =3D false;
@@ -952,9 +989,19 @@ int smb2_query_path_info(const unsigned int xid,
 				     FILE_OPEN, create_options |
 				     OPEN_REPARSE_POINT, ACL_NO_MODE);
 		cifs_get_readable_path(tcon, full_path, &cfile);
+		free_qinfo_resp(out_iov, out_buftype, ARRAY_SIZE(out_iov));
 		rc =3D smb2_compound_op(xid, tcon, cifs_sb, full_path,
 				      &oparms, in_iov, cmds, num_cmds,
-				      cfile, NULL, NULL, NULL);
+				      cfile, out_iov, out_buftype, NULL);
+		if (rc && cmds[num_cmds - 1] =3D=3D SMB2_OP_GET_REPARSE &&
+		    may_ignore_reparse_error(out_iov, out_buftype,
+					     num_cmds + 1)) {
+			data->reparse.tag =3D IO_REPARSE_TAG_INTERNAL;
+			cifs_get_readable_path(tcon, full_path, &cfile);
+			rc =3D smb2_compound_op(xid, tcon, cifs_sb, full_path,
+					      &oparms, in_iov, cmds, num_cmds - 1,
+					      cfile, NULL, NULL, NULL);
+		}
 		break;
 	case -EREMOTE:
 		break;
@@ -972,8 +1019,7 @@ int smb2_query_path_info(const unsigned int xid,
 	}
=20
 out:
-	for (i =3D 0; i < ARRAY_SIZE(out_buftype); i++)
-		free_rsp_buf(out_buftype[i], out_iov[i].iov_base);
+	free_qinfo_resp(out_iov, out_buftype, ARRAY_SIZE(out_iov));
 	return rc;
 }
=20
