Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9AC339856
	for <regressions@lists.linux.dev>; Wed, 11 Mar 2026 02:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773194793; cv=none; b=VJ6csWApwonSMesLYZSh+7i4ZlQROc33c6IQhcwLG0f5EkyhnIEIKNqCU/DyICq5Od2hnexjGqVWHqzrEMFHisyj9QJovLczHfE+ws/t57s6HhF+THuTSS9+SqNQpcTCppOtHAKx/YxDCuXFU8UztKPyBcV/RQSKRBGVkdh8nF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773194793; c=relaxed/simple;
	bh=P1+ZQrw/a3+oxXwntvE4BjS3zMiSxriGuhAOi6EH3nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIK9veeGhsWWoLq3lkNgxkmjcDojnvS9BdsHFjUbVUOOR34x3bcAIY/sKaITnPkKvS1/4ISJb+xI/1jzRhWxfORYS6XbkqrKTt4D3K4Boyqx4XfS4DjDtaAMgKFSYpjuvk76wn+CP1Yg622FAv8Xr/p9SD76JCKzlUxIuRSZMjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BoKQlnEy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BoKQlnEy"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso33386975e9.0
        for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 19:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773194789; x=1773799589; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeasIl4NlVlSUO2J1WHrJ04QPxBi9mp/dFx8NjgnjNI=;
        b=BoKQlnEyH4VwoAZ4T3x50JHQgNKbfECyN6JFmN6RJBHyn/d9MxsXfX5dYDEC71Gz8k
         nlEVRCNJOv11NZfOWSHPuOplgmS2L3hEeeB8LQyurIMfOtVzRKF2p/Lvqi7lKzhCc/zA
         S3T/8ra8CZyL8eha21lLQb1akOV7Cdg+Jld5RaxZCYawkHNGkaAVnVdbrSaUwQPgxKhK
         7QgFNyW0o+SZyd+ssS54WyAJusRL9S5iZ5AAsrxWI325X6Kkwh70ufTlQJRX/ljTaTLC
         +ZT0VuF/MgtebBuXGUzX4JZ319VfZxvOeismMbbZrVAz9FAowgHbOIX6fSPO6YcRELP+
         gtHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773194789; x=1773799589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeasIl4NlVlSUO2J1WHrJ04QPxBi9mp/dFx8NjgnjNI=;
        b=f58Hm0tkvg5iPw4adKlbChnkGqETUluXC9aOQe3zL02/qjLZX/lceOrnfaH3iyeYfV
         mYk901lrB5+nHHYL2lmAoqeb4G3isNdLN5qsVYoIqMaLkYWyDMSFjR8kkDwrlnOPeEvp
         lqPazs+Orhx3xIi23WFnEV1jAggmiDZOm06pi8iBxZE1cBYY73iOOzZ0kyFvfgOyPBGs
         smpzSpBHO4wzwHOF5yYgwOGEFCPjFSLcofjgHw35bFECF0ukAjQUF2+0byiY5oqVpkXM
         Wyz96PKGZv3dvMuBLP08EAw1C1+3NNwwNCPF026aEvgaeH3f5GiqXn4Aex72FLSVCgvK
         Uv0g==
X-Forwarded-Encrypted: i=1; AJvYcCWmjvFSVJ6TqOqUu3knoZyr8ayjjQ32nW3f7YFv/S6A4MSysoAei/6yps1iE4GvJffdksYWCQHbFmvtTg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxxy0daMM5Kpz+wvRtxjr4OQfxMoiVoCYiQpZYFqj51Zq0WR0m
	RdPiKFvu42aTgAuWMmVbqsgp1s+p4FVs0bPgiK9+NPOu3xW9QJa7d9t6J46bIsV93OY=
X-Gm-Gg: ATEYQzwi7NGBdUplZ6RbzpFubPfqMNh4A9G29PX2p4ZRV/7qmoTkKr/VXWJ3KwijsA1
	ZCINw4rOYynLKuCdpUqvsnLqRz7tgBlAsSeic/2ri599xsV2w0JLv6rEV6gYhaS/IKMHn2taUf7
	2bpK3n7qiUCvwt+7b8uwmKTKacLx5EaT1jHQhOebEtRDRjozAvbBOav6RwCoCNITYSj9kWxGJuy
	A2nDdxcTbRlQkpL6z/wn2Nzv+WWand1NYF9EXrr/85jN4jN9BeeFOcAu9bsIMyEl3sNVRgGZDo5
	rZKClobyPJ08yV1N0YqEX3p5Q0PEHpvWgToXFnBj+XLQQYds60lCGyjJnNGf4maA2BfpNQWuWYc
	ivB38Ks21XHIAz86hk43eWYndVvjr/hhnrdnCUzCI4u4NvmYGadsvvZI6O3HQXkzBXWnuXqjikE
	o2QmgEiSaTdLI+1sQeDph4s2zYzwr2ZjwyYFdxUS/r6axXIWRnh+xXu1k=
X-Received: by 2002:a05:600c:a46:b0:485:3026:2b8b with SMTP id 5b1f17b1804b1-4854b12bfd2mr12821085e9.29.1773194789451;
        Tue, 10 Mar 2026 19:06:29 -0700 (PDT)
Received: from precision.tail0b5424.ts.net ([2804:7f0:6402:b103:6a0a:3e1c:778a:5cc7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa7413esm728571eec.24.2026.03.10.19.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:06:28 -0700 (PDT)
Date: Tue, 10 Mar 2026 23:06:24 -0300
From: Henrique Carvalho <henrique.carvalho@suse.com>
To: "Dr. Thomas Orgis" <thomas.orgis@uni-hamburg.de>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [REGRESSION] failure to reconnect on SMB server restart with
 custom TCP port (not 445): Host is down (at least since 6.6.95)
Message-ID: <c66p7dr6vlujvnwczbnrmqx7monkdgdnm4rwewm76aibn7jza3@d3uik74dei72>
References: <20260310235642.6d9798f4@plasteblaster>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vyyfnoz5o32eea4w"
Content-Disposition: inline
In-Reply-To: <20260310235642.6d9798f4@plasteblaster>


--vyyfnoz5o32eea4w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2026 at 11:56:42PM +0100, Dr. Thomas Orgis wrote:
> Dear Linux-CIFS maintainer(s),
> 
> I stumbled upon a regression in the Linux cifs/smb3 client when working
> with a smbd using a non-standard port. I am not the first to note this, see
> 
> 	https://bbs.archlinux.org/viewtopic.php?id=306712
> 
> which is a report from mid last year, indicating the problem sometime
> after Linux 6.6.72. It is a very simple issue, where details of the
> kernel builds or mount setup don't seem to matter much: Older kernels
> reconnect to a SMB server that was restarted (old processes killed and
> replaced), newer kernels do not and just have a defunct mount.
> 
> I reproduced this in our HPC cluster environment with such smb.conf on
> the server side
> 
> [global]
> security = user
> map to guest = Bad Password
> server role = standalone server
> smb ports = 1445
> 
> [public]
> path = /some/path
> guest ok = yes
> read only = yes
> 
> and such a mount command on the client:
> 
> mount -t smb3 -o port=1445,user=guest,password=foo //server/public dir
> 
> When I kill and re-start smbd on the server, older client kernels
> reconnect and continue to return listings and files from the share,
> while newer kernels give this:
> 

My suspicion is that the regression was introduced by:

    5713127da855 ("cifs: update dstaddr whenever channel iface is updated")

That change causes parse_server_interfaces() -- should this be running
without multichannel mount option? -- to overwrite the port stored in
server->dstaddr with CIFS_PORT.

The attached patch preserves the existing port from server->dstaddr.

Note that I have not yet tested this patch or confirmed the regression
with a bisect. If you can't, I will try to do that tomorrow.

-- 
Henrique
SUSE Labs

--vyyfnoz5o32eea4w
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="patch.patch"

From 1218840331eef3a6b523ad39e851a412f570b7d8 Mon Sep 17 00:00:00 2001
From: Henrique Carvalho <henrique.carvalho@suse.com>
Date: Tue, 10 Mar 2026 22:52:52 -0300
Subject: [PATCH] smb: client: preserve destination port when parsing server
 interfaces

parse_server_interfaces() initializes interface socket addresses with
CIFS_PORT. When the mount uses a non-default port this overwrites the
configured destination port.

Later, cifs_chan_update_iface() copies this sockaddr into server->dstaddr,
causing reconnect attempts to use the wrong port after server interface
updates.

Use the existing port from server->dstaddr instead.

Fixes: 5713127da855 ("cifs: update dstaddr whenever channel iface is updated")
Signed-off-by: Henrique Carvalho <henrique.carvalho@suse.com>
---
 fs/smb/client/smb2ops.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index 7f2d3459cbf9..d3cbfb3fdfc9 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -628,6 +628,7 @@ parse_server_interfaces(struct network_interface_info_ioctl_rsp *buf,
 	struct smb_sockaddr_in6 *p6;
 	struct cifs_server_iface *info = NULL, *iface = NULL, *niface = NULL;
 	struct cifs_server_iface tmp_iface;
+	__be16 port;
 	ssize_t bytes_left;
 	size_t next = 0;
 	int nb_iface = 0;
@@ -676,18 +677,20 @@ parse_server_interfaces(struct network_interface_info_ioctl_rsp *buf,
 		 * conversion explicit in case either one changes.
 		 */
 		case INTERNETWORK:
+			port = ((struct sockaddr_in *)&ses->server->dstaddr)->sin_port;
 			addr4 = (struct sockaddr_in *)&tmp_iface.sockaddr;
 			p4 = (struct smb_sockaddr_in *)p->Buffer;
 			addr4->sin_family = AF_INET;
 			memcpy(&addr4->sin_addr, &p4->IPv4Address, 4);
 
 			/* [MS-SMB2] 2.2.32.5.1.1 Clients MUST ignore these */
-			addr4->sin_port = cpu_to_be16(CIFS_PORT);
+			addr4->sin_port = port;
 
 			cifs_dbg(FYI, "%s: ipv4 %pI4\n", __func__,
 				 &addr4->sin_addr);
 			break;
 		case INTERNETWORKV6:
+			port = ((struct sockaddr_in6 *)&ses->server->dstaddr)->sin6_port;
 			addr6 =	(struct sockaddr_in6 *)&tmp_iface.sockaddr;
 			p6 = (struct smb_sockaddr_in6 *)p->Buffer;
 			addr6->sin6_family = AF_INET6;
@@ -696,7 +699,7 @@ parse_server_interfaces(struct network_interface_info_ioctl_rsp *buf,
 			/* [MS-SMB2] 2.2.32.5.1.2 Clients MUST ignore these */
 			addr6->sin6_flowinfo = 0;
 			addr6->sin6_scope_id = 0;
-			addr6->sin6_port = cpu_to_be16(CIFS_PORT);
+			addr6->sin6_port = port;
 
 			cifs_dbg(FYI, "%s: ipv6 %pI6\n", __func__,
 				 &addr6->sin6_addr);
-- 
2.52.0


--vyyfnoz5o32eea4w--
