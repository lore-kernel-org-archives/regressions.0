Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794925910;
	b=0/2myETDi2VoXyoQuawkd/FEZLLI2wNFs83MO8TnLw0w2zLO6nF3G+Dg//4jJBWKylPG
	 fLUDwdlpeU5PYQ4I2gOK1WqXn+PDtIVavETT8HUf7YEMEVcuxeGZbFJBr8aZZS44cUb+x
	 VY85P/ZdGZF7Se41wSGRQUsWbJr4QfHH0HWt+rj/UmHWVcMTlLFhyEI7jogK86E2WaMdR
	 4qkntLHdCrXkmZCMGGir9cj/o7OM+/akz8k0OfKiKs1rMMfWNOZk5tYJ4uVHN9bD3CDsY
	 GELdd6g7OAosEF0/kM1x+rKkSCZvdTC5DjyT9Pox44Um9R3Ko9LZWClPyFhf4SdhmXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TszkTcdWcLDyL+0JxTi5b09ZBrAAFon+oeNujwIlDTg=;
	b=qwg+JDyk6OhL87L2XqO0lNp3bBw0on2N0KFKM1sNM0KtAGDouI5t8brIW/mv5jBhTmK+
	 pr9NWgp0AOlAT5qIPjGa2TM0PjprVNrbXQp1HSUT2sbuQ5Nnx0RY0j3Kx46rUmuMJSKro
	 IH0CHMWkbY9B4lhU2pLZWJaH2qD+tJMiHgodj9pMMISnY/YSYDU7dM4BZ/R0EZcmC0Q68
	 kJ60zEk7jjeiCRvdavTia8rGaomBZwex72NeLTm3TUJ57/ZnV+l61VkaBxf8FT1hNql2c
	 au3YxRWCN6TOl2bGTMRU53TcsAvBNhN71TmQAwHG9Q4hIfQ0dIkmzCqJfCTPyMqPyPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAibK1G8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2B606A32A
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 14:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF2B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAibK1G8
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5364042eecfso33972921cf.2
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 06:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925909; cv=none;
        d=google.com; s=arc-20260327;
        b=lvBoVbSJBwx1ugTQY30PJqDbhY38sZhG4uc8PEk4YfxvX8zwLz+4/h4RUHOay+plNe
         GWjEN5h4sq1v+bK/+n1d9Bg8RFjSUIuR6WZmlL9OUAXIkbhIV7JB0B/7QdVwDHfHWVwe
         s8p2NWCqnSNjdT6IgP/TiVgTy9Efq9k/6JXEQKULG/kJZrwdLitzaoj1m/EF9q7zH6PQ
         jED6QBEMtYQZEEW7mQGu0A/gxIqhrd8c6riMLZ4Obgr6/OvgeRkGr4S/wZUa0HzBMGyd
         DSgLpxfazMofMIFFfpGggc8wJutObwXlJjIUEIP8tkrv7kYeWnGKAcZb+udeP4PgfRwB
         Ystg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=TszkTcdWcLDyL+0JxTi5b09ZBrAAFon+oeNujwIlDTg=;
        fh=Cr0CV1Lm/pQEbtXGcA78NcMWI9kUPsIb2UcXQx9/47Q=;
        b=C8tV+HpU2qY+gNzJnBnpqQUE//TOzzOa9v3MJQEZhR/5AyogWWA6r2eyG0YF+mwztZ
         jTRgURiHul6Pwk9BHGhda8bnrx9pkyAYLm5BdBBiaB1iwJpUiGEGvm5emCUvPUFWOfoh
         ir1BIoWHa85xLd03gs1ktbUYiWYCfG3hPywaVDICYUZ3kf2IFaZhmeZ/hwLkTdzyiaPq
         bML8FocX9rftAXpnsgI85dbxiiui988jyLqtTCtlXfDktYvjRmPihw+VhNad8RLbbu2q
         //4dsnZqllZqbCj5pwJnOjAYSoO9gUGAUiCpypdyBjc7Q0drL1me4lstvmSTXnFufmGo
         smqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925909; x=1795530709; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TszkTcdWcLDyL+0JxTi5b09ZBrAAFon+oeNujwIlDTg=;
        b=KAibK1G85QMsZ6tL4xv9wxMmTvQlT4H+D7S214JM8zUZlmIsQjb3qlpf6r1Pgdx11C
         BLx09tNyzQonXWO0AvixF+rx8s9yCniDmNjVpjVLNkJbu1vTDVn7FpV7Kg/Af6y4lAHS
         CbSZytJt2k2fwCEtVOwdAxTpJr/AgYgOhNVs8bSwo7o/9wCoOJ3mvqDPxaeCN0CEKfl9
         f00ulurif1PgLPXY7p6Wndo2JMMBC1vR4ab7vq8+PzPAmiANqqgrsIVOlMpdVWpdElDa
         siViWYojbVFVosLkhUTgL6SkJxWde98uMxPIf+nm8xYWQvCFAF1GVgELWCpkE9FexkzC
         hf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925909; x=1795530709;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TszkTcdWcLDyL+0JxTi5b09ZBrAAFon+oeNujwIlDTg=;
        b=dv6/tBL6Mfua7zfGcvrc44jJyhvHGuU61sfLi99Ta7ZdUjBRVMqHB1YZ0PzjQ7dqq/
         XZykFP2zHPPbhLxqxTjfMEB6P0k/bviuwES4HDuCBYf4JeUk/cUJ88iW+/axSuYGA089
         cfWJof6nGqJPpEpgkRX6KOJn5ZAbPvTdfwu8K3JkakkuYfU/CW38eADvaBcRh8MlzwtQ
         615uNKk9LVIQCpM6/NaFD0Kh02rCtKZeJ832SYoN5BnL2Vkn57V+bCGFAdjqHHOI6c6o
         idq0zVixCXM4rtrtaJBUOy1NIF1vHXYE5aYzhYtKX+eG7d03DOYdtAUsSDAE48NADrs9
         2MPQ==
X-Forwarded-Encrypted: i=1; AL+hErE3nuu2c1azTHoR9reM/yU7v7Xu1SvYngA2KZZypVb4gRV56CmNS8qkdyJsTp7ltFVyngIbYWN49/2AuQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+GT2cgUtrdv6Oec2taPeFa5+0QTQ7whPkAHBZWbcD933+zJIEZ
	88hCb9hbEpmXGE4LEl6rUCGYMo8eBcwACRstCAo5ob6ktsqYDLLXrv1mj6ldW5trtOAvzRoTsX9
	+cuh4fYq24j5NssFnKa4KukFb04bT5JM=
X-Gm-Gg: AYBFou3bP7WzKWGKMisgevfKScNAkk8X0eHeWEqdmrcJQ/cuwnXJlV5qJ9NX/dlsqK/
	WEpsQOfQ4XDMcxsMjrrGio1pMwZ6TbkTwcX8rz9ujwLOFF49EXfETxvxViuXn5pIiKPp9g5Gxgs
	vP7ycIDv0Q+YN4WuWkUomxqHM2+aZwn/nDX9HjGSZJYTsgnAKwtF8dac5TmQbjwM8tRy0Mb0xzk
	5ZvOMqJm9NaUE5sWeaho/n8xKhwhpIi3mmwkOP0pk8Q324ZxTjZjFQJUZyUEeURbdHbcIPx4tIQ
	xYoLNq6fLA3/W+M1GtjK1Dk4yuaGsMm1Q+GLG2GDDJTueO/TxShUAIgecHC7ObJ6Y6qalXsfjB3
	DXNzhRhRjny5j2WJbsa96sHwiIILKGwdgk+E=
X-Received: by 2002:a05:622a:304:b0:533:2717:6221 with SMTP id
 d75a77b69052e-55ac765f6bfmr222851271cf.31.1794925908476; Tue, 17 Nov 2026
 06:31:48 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 17 Nov 2026 08:31:47 -0600
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Hristos Nenkov <nenkov2004@gmail.com>
In-Reply-To: <20261117-tanzpaar-dreihundert-attentat-6f03576b56c9@brauner>
References: <CAO7_G+ypR12OwOiwnrqXDAC9zoboTMn_qLoASfJqYP3H83Vk5A@mail.gmail.com>
 <20261117-tanzpaar-dreihundert-attentat-6f03576b56c9@brauner>
Date: Tue, 17 Nov 2026 08:31:47 -0600
X-Gm-Features: AclHuK_WIFhNkCr5GXrVFJRrFg2_b-Bo8eosWpjZkIoWkPjU6KqPeknhrXUxKYs
Message-ID: <CAO7_G+xaooz=gYyO5kw3Qbz+1MF=TUD-XQpAy33ETSX2xBVQ-w@mail.gmail.com>
Subject: [PATCH v2] fuse: preserve daemon-owned ACL permission decisions
To: Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Seth Forshee <sforshee@kernel.org>, Lakshita Jain <lakshita.jain@databricks.com>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

FUSE daemons without default_permissions historically handled POSIX ACL
ownership decisions themselves. The generic ACL owner check prevents
non-owner ACL changes from reaching these daemons.

Add IOP_SET_ACL_OWNER_CHECK so a filesystem can perform the owner check
in ->set_acl(). Set it on FUSE inodes and check ownership in fuse_set_acl()
when default_permissions is enabled. FUSE_POSIX_ACL also enables
default_permissions, so it needs no separate check.

Other filesystems retain the generic ownership check.

Reported-by: Lakshita Jain <lakshita.jain@databricks.com>
Link: https://lore.kernel.org/all/CALE1rk6tGt_Pe7CpFL1NSTgugVpXLH_iguO2D9VsAVHn1p-02w@mail.gmail.com/
Suggested-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
---
Changes since the RFC:
- Use IOP_SET_ACL_OWNER_CHECK and only test default_permissions.
- Drop the caller restriction and channel-readiness changes.
- Follow Christian's proposed four-file diff.

Hi Christian,

Thanks for the review. This follows your proposed diff, with the owner
check in fuse_set_acl() and no caller or channel-readiness additions.

I built this revision on f66469d9905b39d2c260a15d7d6db450f4db67c1
with a minimal x86_64 configuration. QEMU TCG runs completed 88
assertions on the baseline and 88 on v2, with no mismatches against
the respective expected behavior. The legacy non-owner ACL operations
are blocked on the baseline and reach the daemon with v2.

The tests cover ACL set/removal, owner/non-owner callers, all three
permission modes, daemon denial, malformed ACLs, read-only mounts,
and tmpfs owner/non-owner controls. Checkpatch --strict is clean.
These are targeted in-memory daemon tests; I have not rerun Lakshita's
exact passthrough application reproducer or the full kernel suite.

This revision was prepared with AI assistance; no Tested-by or
Reviewed-by trailer is claimed.

Thanks,
Hristos

diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
--- a/fs/fuse/acl.c
+++ b/fs/fuse/acl.c
@@ -98,6 +98,15 @@
 	const char *name;
 	int ret;

+	/*
+	 * Without default_permissions the server does all permission
+	 * checking, including who may change POSIX ACLs. That's the same
+	 * thing fuse_do_setattr() does for chmod() and chown() by passing
+	 * ATTR_FORCE.
+	 */
+	if (fc->default_permissions && !inode_owner_or_capable(idmap, inode))
+		return -EPERM;
+
 	if (fuse_is_bad(inode))
 		return -EIO;

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -439,6 +439,12 @@
 	 */
 	if (!fc->posix_acl)
 		inode->i_acl = inode->i_default_acl = ACL_DONT_CACHE;
+	/*
+	 * Whether the kernel or the server decides who may change POSIX ACLs
+	 * depends on default_permissions which FUSE_POSIX_ACL turns on during
+	 * FUSE_INIT. So fuse_set_acl() does the owner check, not the vfs.
+	 */
+	inode->i_opflags |= IOP_SET_ACL_OWNER_CHECK;
 }

 static int fuse_inode_eq(struct inode *inode, void *_nodeidp)
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -949,7 +949,8 @@

 	if (type == ACL_TYPE_DEFAULT && !S_ISDIR(inode->i_mode))
 		return acl ? -EACCES : 0;
-	if (!inode_owner_or_capable(idmap, inode))
+	if (!(inode->i_opflags & IOP_SET_ACL_OWNER_CHECK) &&
+	    !inode_owner_or_capable(idmap, inode))
 		return -EPERM;

 	if (acl) {
diff --git a/include/linux/fs.h b/include/linux/fs.h
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -627,6 +627,8 @@
 #define IOP_CACHED_LINK		0x0040
 #define IOP_FASTPERM_MAY_EXEC	0x0080
 #define IOP_FLCTX		0x0100
+/* ->set_acl() does the owner check itself */
+#define IOP_SET_ACL_OWNER_CHECK	0x0200

 /*
  * Inode state bits.  Protected by inode->i_lock


On Tue, 17 Nov 2026 15:00:51 +0100, Christian Brauner
<brauner@kernel.org> wrote:
> On Fri, Nov 13, 2026 at 11:03:15AM +0100, Hristos Nenkov wrote:
> > Introduce an opt-in inode-operation flag so FUSE can make the ownership
> > decision in its ACL callback. Retain owner/capability checking for
> > default_permissions and negotiated POSIX ACL mode, and leave the generic
> > ownership check in place for filesystems that do not opt in.
>
> The flag is fine. The rest isn't needed.
>
> > Enforce the FUSE mount caller restriction and wait for channel readiness
> > before reading negotiated policy, including requests on the mount root.
>
> Neither of these. Before v6.2 posix acls on a fuse server without
> FUSE_POSIX_ACL were plain system.* xattrs. xattr_permission() let them
> through without an owner check and fuse_allow_current_process() was
> never called for them.
>
> The handlers were only switched to the acl handlers in
> process_init_reply() so a write before FUSE_INIT took the unchecked
> path. That's exactly what happens with the change below and
> fuse_do_setattr() reads fc->default_permissions before FUSE_INIT the
> same way. If that window is a problem it's a problem for all of fuse and
> not something to paper over in the acl path.
>
> And fc->posix_acl is only ever set together with
> fc->default_permissions so checking default_permissions is enough.
>
> I kinda hate that we have to use an iop flag.
>
> Please send a v2 that does just this. It survives Lakshita's
> reproducer:
>
> diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
> index 738abed9a8166..56cdafabfb399 100644
> --- a/fs/fuse/acl.c
> +++ b/fs/fuse/acl.c
> @@ -98,6 +98,15 @@ int fuse_set_acl(const struct mnt_idmap *idmap, struct dentry *dentry,
>  	const char *name;
>  	int ret;
>
> +	/*
> +	 * Without default_permissions the server does all permission
> +	 * checking, including who may change POSIX ACLs. That's the same
> +	 * thing fuse_do_setattr() does for chmod() and chown() by passing
> +	 * ATTR_FORCE.
> +	 */
> +	if (fc->default_permissions && !inode_owner_or_capable(idmap, inode))
> +		return -EPERM;
> +
>  	if (fuse_is_bad(inode))
>  		return -EIO;
>
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 1341b681d0ed3..d7070f58d7ec7 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -439,6 +439,12 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
>  	 */
>  	if (!fc->posix_acl)
>  		inode->i_acl = inode->i_default_acl = ACL_DONT_CACHE;
> +	/*
> +	 * Whether the kernel or the server decides who may change POSIX ACLs
> +	 * depends on default_permissions which FUSE_POSIX_ACL turns on during
> +	 * FUSE_INIT. So fuse_set_acl() does the owner check, not the vfs.
> +	 */
> +	inode->i_opflags |= IOP_SET_ACL_OWNER_CHECK;
>  }
>
>  static int fuse_inode_eq(struct inode *inode, void *_nodeidp)
> diff --git a/fs/posix_acl.c b/fs/posix_acl.c
> index fe77934ea8f20..9256607e897da 100644
> --- a/fs/posix_acl.c
> +++ b/fs/posix_acl.c
> @@ -949,7 +949,8 @@ set_posix_acl(const struct mnt_idmap *idmap, struct dentry *dentry,
>
>  	if (type == ACL_TYPE_DEFAULT && !S_ISDIR(inode->i_mode))
>  		return acl ? -EACCES : 0;
> -	if (!inode_owner_or_capable(idmap, inode))
> +	if (!(inode->i_opflags & IOP_SET_ACL_OWNER_CHECK) &&
> +	    !inode_owner_or_capable(idmap, inode))
>  		return -EPERM;
>
>  	if (acl) {
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 5b3a100aba77b..016eeea5da5bf 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -628,6 +628,8 @@ is_uncached_acl(struct posix_acl *acl)
>  #define IOP_CACHED_LINK		0x0040
>  #define IOP_FASTPERM_MAY_EXEC	0x0080
>  #define IOP_FLCTX		0x0100
> +/* ->set_acl() does the owner check itself */
> +#define IOP_SET_ACL_OWNER_CHECK	0x0200
>
>  /*
>   * Inode state bits.  Protected by inode->i_lock
>
> --
