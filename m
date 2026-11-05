Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793908147;
	b=2qvcK3lvuj3g8KjqlkDzNhvM4LyMjypK4MUWYBEGTDqGM+lWkVphUnIEmMUCiBcW75kU
	 5F/6NdBgsahfh24r/WXnkl8CHykx/eVrJfkfYxTdQQaffnmiE2WzBRCJ724PFNJDJGrtq
	 qMyKLOCaDxc7WNQbBlj6OsL51tUrKHs/qeYOXB4X+Oh9j+NYupJe6XQa/5+avv5ldQANS
	 zr/p2JTU9D6UaNeA93vIRk0xU4tEPEe5tcQ3bGI5dxfYnRKRgMEK65EZKsidGE8cn2/XX
	 IybVPb6JOnQ/5nbBJgAYIhfbL4DPtnoEyAsGjmKB0o3kvv45sdPToCbGsgVvMpcCXzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=N5scGhz5LxdwjNU1yVLwQJMho5xvAY73RNio+z9h7DA=;
	b=GU2vSP+c4+XafqT4RsxjPJhvLH8w+IShPrgd39xb2pUmdI37F47Ax1sdTBIRPN7xzVh2
	 rTBUoVvB7Zm/3s57+CETkbyC/IifLixOSvKzivFWNhhpT/EJoI//pn0C7+JiUphl0RZDf
	 c/aSX1HJJGqyy8TYKLSqejCgu1BjdM3RceN9K7AXXbkWHWbdD/WhglRcjqkGeRbq0bZCJ
	 24Ml0puoCGoOT6nDgcYuucL2BC0/8Z3Mzq3J6KVCWlwMu85+knFojYDI7/NDpUTo1J8dR
	 YzB6mxFesEufuk7emxdqHo6BJwTJtcVTaWSp4cKXLcMtwddkj+Cf6yDP22zhHWHq6VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=databricks.com;
	spf=pass smtp.mailfrom=databricks.com;
	dkim=pass header.d=databricks.com header.i=@databricks.com header.a=rsa-sha256 header.s=google header.b=eReNVQbf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC06606E407
	for <regressions@lists.linux.dev>; Thu,  5 Nov 2026 19:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC06606E407
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=databricks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=databricks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=databricks.com header.i=@databricks.com header.a=rsa-sha256 header.s=google header.b=eReNVQbf
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679e6ab6471so1059874d50.0
        for <regressions@lists.linux.dev>; Thu, 05 Nov 2026 11:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793908146; cv=none;
        d=google.com; s=arc-20260327;
        b=KQGTNWMvfNQ7uKmtnDGsj0zCONBh6CFK7ujUZPu2UzKV0mOn9ysscwogsbejGUr1SU
         +7ixb9R2r8hXkHdXswTnGpRd5y66c7NHWss7MYrHSTFyTVzM1OCShkN1ShYYXKozOTRj
         k1nd5vtOewzZFQ9JaKoJTwSJPkG3ztQtIDhP7UuQvYmj1xTO1aVZHsgEHfH+dNG47WRC
         /TFddDN/Qhcjcd10/pFAO1JFTjftpKaahCOkG++7fy29P/rebJhhbNdZHSrDKwjSn6gE
         PZWtsy5NvzCqwZJhFolvGhfU8Ycrha5Eg2q3HsYX/M5dhfmXgBzLfWcnkjGU/Laaqong
         Cq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=N5scGhz5LxdwjNU1yVLwQJMho5xvAY73RNio+z9h7DA=;
        fh=X16PFx6BalG4slrdGyLCHAhj5ss1Rw6P7BQiFry9oPU=;
        b=qHr0n7oUT7Le9hGlwcFLtueUtVXotPeWsh1LLiGPI2z6aoEbxrMt/SJuh9wvy9fphL
         IX6dvWGaaQvzdg+KipQV3cMHCqLNzK10A917cb53yNeigphb4w/BrV4sshyVA0qUYVL7
         /rTmiyY7W613GXDw/5qfzRnabZhKqvfu6VQLo1eHm3A12eWmhInTCNGGh7t4EhN8292X
         ECEpjaXxpx+ZhQuoBWVzJG19ukM3ME7pLeLLxqw8U166lxLhm6R23Ui1NB1XHExJMCRS
         jElflEUeWpt0SJgMD93CSMHs/g+0C2VhnTAv74JJIYUK9ieo5aclLyweYDAcdjpR78v7
         cdbQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=databricks.com; s=google; t=1793908146; x=1794512946; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N5scGhz5LxdwjNU1yVLwQJMho5xvAY73RNio+z9h7DA=;
        b=eReNVQbfylKPidokXel/uxx9TznMXa2Tn343OVMq5cAkeJbqE9Rytv4cmkCXeIEfId
         co2u3p3mBJblknfbsYd8+BtNmf+N1cWhb1VI+vffhXn3NiF/plBDQe5ecG80IY0YBe6S
         EagQqa6nGYPP+HzyuMBH3r4Ae92Rbua+knOB9ann5eUUnqoaclhg0GnvOz4mF3kU7Xnt
         ZNogUbJwiWNLsYo7pKerL/NuGYpWHcAUWGAokgjJjbI6251sqFOpt9IEvf2Rsug8fKvS
         M8TAjQcN3NSLlYle/6Gi2Gz4uVj+J4zq6kxd+IrxUskQVnTeHu6L0Qn3233uykDXc8xh
         BTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908146; x=1794512946;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N5scGhz5LxdwjNU1yVLwQJMho5xvAY73RNio+z9h7DA=;
        b=YqVjKmtpDG2gVZNrlNmMwkcYJo+ONaplmX6QFUNnW2srn20+D6hHf4Aq1DWGqcUyJV
         cQH6vmeKruX0fxRx5GklExSeyBUHh4YAntJod0UX83AGgaAGYv9Pv2UKp+ce4dhluLJy
         DV/efLOXLGpOp7S8V6CzvfIPOx0th4bzQRsszslwA2vHpPAqLWt22HxUqsJxQKvxbLk2
         xWXYnZAzkYxho1tpqqCZeO2Un6Dp0989JtRKtHa5MGp/kj8PbEF2lkoc1xELzCAyXH5A
         CoHZrO8/t9OuL+HBbLSBXjyzzahCjtfsYJ5pJCm+Sxr7I0rdjIRXem17Bl8ATOTSF7/k
         /x4Q==
X-Forwarded-Encrypted: i=1; AL+hErGEnu4TKSGJr0tn7NmGaswwUEnpdL3ugSdIjeWRGUeRcbKu9wCQ2k0bW2ZFfUQgHiMmvfSo5EGQpGNpYw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/RZ4my2VuIyuQO/eIUL1Et7HFqmwulifpktn3uH0aaqOfjnHyd
	SkKiZZ0PVsCWkmuB9LhPRhL8tKYeYoeDMKQHYcRsD3jkZxskNxo3hVCSWb8aduAP8Bvto1KdNCz
	4W9zO92TnTrly4EoUxIWKHUpOJYNBH+70TUbDGgxNBA==
X-Gm-Gg: AYBFou3HhGLOAR9unlp7BuLM6dRsbDF43tzXTk+6GzKEPgPT/6C0hpaOUJOQCirEzol
	by1FTwyyFIsNsOXbhawOrsAjB6wTBVJFcvWrfosp+Mscyh+bRx44iDDYu2k0jzjb9haZ+rDIA23
	4bhrN+hkgnyL2MO4114hoVxdjhuwm6Av1T5Rmj4nphCSGILK32u5FmF1yxKDkYCqw9tc/fCDvJh
	tDQN2B1plv5yJyFGY1hgoXL9Pz8tXNyxdnTjlqqFNwy/q2KTuhdfD+/lgyl5jME01L43bvA2WSP
	98VQy58THGxiU3AQs4EuXLJR8bAcu25C3m8U3hHhjA5zBnjw6hS9l8ngeM78UDndfS5cwH8E7tD
	2d3B4PWM7/XhCZl7MfQtEptCQro6LPHcczLk=
X-Received: by 2002:a53:c045:0:10b0:673:e272:f3ec with SMTP id
 956f58d0204a3-67c03574d3cmr1676191d50.16.1793908146013; Thu, 05 Nov 2026
 11:49:06 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Lakshita Jain <lakshita.jain@databricks.com>
Date: Thu, 5 Nov 2026 11:48:53 -0800
X-Gm-Features: AclHuK86O9Kk2D4NIGqxQ7jet_z__LeBB-Hzqe3C7yoJqWGYxhQHMmpa1pCI8qQ
Message-ID: <CALE1rk6tGt_Pe7CpFL1NSTgugVpXLH_iguO2D9VsAVHn1p-02w@mail.gmail.com>
Subject: [REGRESSION] fuse: non-owner POSIX ACL writes get EPERM before
 reaching daemons without default_permissions (since 6.2)
To: brauner@kernel.org, miklos@szeredi.hu
Cc: sforshee@kernel.org, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Christian, Miklos,

Since 6.2, a non-owner setting system.posix_acl_access on a
host-mounted FUSE filesystem gets EPERM before the request reaches the
daemon, when the daemon does not set FUSE_POSIX_ACL and is mounted
without default_permissions. Before 6.2 the write was passed through
and the daemon made the decision.

User-visible effect: on a FUSE filesystem that reports files as owned
by root and does its own permission checks, a non-root user running
"sed -i" gets "preserving permissions for './sedXXXXXX': Operation not
permitted", and "install -m 644" fails, even on files the user just
created. chmod on the same files works.

The check that rejects it is in set_posix_acl(), reached from
vfs_set_acl() since 318e66856dde ("xattr: use posix acl api"):

    if (!inode_owner_or_capable(idmap, inode))
            return -EPERM;
    ...
    return inode->i_op->set_acl(idmap, dentry, acl, type);

facd61053cff ("fuse: fixes after adapting to new posix acl api",
https://lore.kernel.org/all/20230118-fs-fuse-acl-v1-1-a628a9bb55ef@kernel.org/)
restored passing these ACLs through to daemons without FUSE_POSIX_ACL,
but this owner check still runs first. In v6.1, the same write went
through fuse_xattr_handler, and xattr_permission() places no VFS
restriction on system.* xattrs, so the daemon saw it.

For daemons without default_permissions, FUSE already leaves
permission decisions to the daemon for attribute changes:
fuse_setattr() sets ATTR_FORCE, so chmod/chown/utimes skip the VFS
owner checks. Would it make sense to treat POSIX ACL writes the same
way, i.e. not apply the owner check in set_posix_acl() for FUSE inodes
without default_permissions, and let the daemon decide? Happy to test
a patch.

Reproducer

libfuse's example/passthrough shows it, using libfuse's generic
uid=/gid= option to report every file as owned by root. As an
unprivileged user (mounted without default_permissions), in a
directory that user owns:

    $ ./passthrough -f -s -d -o uid=0,gid=0 /tmp/mnt 2>fuse.log &
    $ cd /tmp/mnt$HOME && echo hello > f.txt
    $ sed -i s/hello/hi/ f.txt
    sed: preserving permissions for './sedtTZojI': Operation not permitted
    $ install -m 644 f.txt g.txt
    install: setting permissions for 'g.txt': Operation not permitted
    $ echo $?
    1
    $ chmod 600 f.txt        # succeeds

fuse.log contains no SETXATTR request. Without -o uid=0,gid=0, both
commands succeed and fuse.log shows two SETXATTR requests for
system.posix_acl_access.

Tested on 7.0 (Ubuntu 7.0.0-1014-aws, libfuse 3.14.0). We see the same
failure on 6.8 hosts in production.

Thanks,
Lakshita Jain
Databricks
