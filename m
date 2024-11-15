Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3018E047
	for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731688412; cv=none; b=Lw7FFVt2CJ62NxzpX8mWt45jHx0wi6UGTbWkhEY3QSZAJg4MFY8jHRvy3timokQMpuQhTc3dECJMse37B9KsjgDIwC0x69zQPmWagnqZoYuAAzxxnChBGfligtSnp0addKPQ0inlw73uKQ22+4FavO6/4HBuvR9CtjAQUMkK0LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731688412; c=relaxed/simple;
	bh=6kg6AxmG1h0NKv0onN/itgPve8q9yXIYSjbA1PYl+ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ow4HV07GtjVEnlAEBSulz8u5pKg8Boh3M3rQpPox91Q4GnDSEeooAN9BM3Ie6jZIAIOwG3dUPk8jwS2qANNvCH7VOvrDfvOPHx2qw9WRE/MlsItx4GRUlpn7JSmLKKyIlbGQwRJ0tJQlvlM8S7HOAkmLpQApRXLgGqW2MTANq48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5jNqdUK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5jNqdUK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ea0d64e78dso1315614a91.1
        for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 08:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731688411; x=1732293211; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8U8himfTzTS7djfc3WTmNDyMXUIp/NKYV3qaKrTSk5k=;
        b=T5jNqdUKj1YV4JZdtzBvDtr4CUKQzX2OAtfd6Z57/5dW7a8XTfpH0VrVT7TJfm/11d
         NjiBtOk5dSup5dL75hVPMAYC3LWlMnG7CNM5007z++VnUh7TPYEhmUUNjUNMxVvjeTFa
         +bUSOk6ZkDJnD4hpxSEm/8uVeYbTIjztCIe8NvH4olRC8cUKnrHQaOdHXg/+626twH0L
         q82wVN/PxvtJ74U4HF0JxaJoQW5UB82M6owXoOwShPa2pVr4UgPG4ydX8P7Nx+nw91oj
         PbZ2v379Ah8Xh7OEXhKXA3648NFcchvOtRXqwPSmz8qDn87EhvFrtQvxi/PjmwiHQ4pD
         fn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731688411; x=1732293211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8U8himfTzTS7djfc3WTmNDyMXUIp/NKYV3qaKrTSk5k=;
        b=i6MVl65OOGFsfXer4+Wh0RuMb3pmfclpxAe/3BIMX4M6UwYtOQr2HQfdXtiAfuvbXR
         QPKler9YXz7D93cnoZ9j6aLjnBJNo4nFIxp6+huUat/TUH7JRoZOwyaHKXV5V6QGslG2
         27RFx2k5cHqIq7TRaj/BAqqoo07LHwNKwCY2zhTob/jLbt1V6QZryG2VG4x/Y2gnF6Q/
         jvni7odyAa3n1dTGb7Wd4IFTmhbzF2CeOwJkS70HaiYP8+b9i9DxTJn/lBNXt49ieQZk
         csX6OvCemAxVDg3RdXc/6utLs3XPlgXe54ZrP796sHTz7spOp4H9yhSMRHzf3tNv6UYq
         gz/g==
X-Forwarded-Encrypted: i=1; AJvYcCUOQ+IdqitvD/qdfGaB8/Kw+0ujPj/FNlWSGlAn8AEXmpaSagf/6L18wWPxEg2k6VNZcpknEww6qwf/Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMxcEDGjLj4tYMPC90kpKTSNVGNrxe7ulMdKV6Qi2kOwhDWcfu
	2GR2XQt/8he3fBGMCXT0gptY4MDSBucae/pT+53nDGRleM67E72x8AQXK4Poy/x4HSNAV0KP+uD
	zyNzKVddvSQswXYEru6rplWLqqJk=
X-Google-Smtp-Source: AGHT+IGkRZ3xRw0xtYeD55DnQArjKqX9xmOVQ0Ef1ludGjMKCJX0VwfKnX5tijUwSPrt/LyqqiiHSrklYowXrLscRS4=
X-Received: by 2002:a17:90b:1e03:b0:2d8:a744:a81c with SMTP id
 98e67ed59e1d1-2e9fe61200emr11880844a91.1.1731688410478; Fri, 15 Nov 2024
 08:33:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZzdxKF39VEmXSSyN@tissot.1015granger.net> <Zzd12OGPDnZTMZ6t@tissot.1015granger.net>
In-Reply-To: <Zzd12OGPDnZTMZ6t@tissot.1015granger.net>
From: Jeongjun Park <aha310510@gmail.com>
Date: Sat, 16 Nov 2024 01:33:19 +0900
Message-ID: <CAO9qdTGLn6QWJg71Ad2xcobiTHE5ovoUxSqvrDDrE_i1+uqUQw@mail.gmail.com>
Subject: Re: tmpfs hang after v6.12-rc6
To: Chuck Lever <chuck.lever@oracle.com>
Cc: akpm@linux-foundation.org, stable@vger.kernel.org, 
	regressions@lists.linux.dev, linux-nfs@vger.kernel.org, hughd@google.com, 
	yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2024=EB=85=84 11=EC=9B=94 16=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 1:25, =
Chuck Lever <chuck.lever@oracle.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Fri, Nov 15, 2024 at 11:04:56AM -0500, Chuck Lever wrote:
> > I've found that NFS access to an exported tmpfs file system hangs
> > indefinitely when the client first performs a GETATTR. The hanging
> > nfsd thread is waiting for the inode lock in shmem_getattr():
> >
> > task:nfsd            state:D stack:0     pid:1775  tgid:1775  ppid:2   =
   flags:0x00004000
> > Call Trace:
> >  <TASK>
> >  __schedule+0x770/0x7b0
> >  schedule+0x33/0x50
> >  schedule_preempt_disabled+0x19/0x30
> >  rwsem_down_read_slowpath+0x206/0x230
> >  down_read+0x3f/0x60
> >  shmem_getattr+0x84/0xf0
> >  vfs_getattr_nosec+0x9e/0xc0
> >  vfs_getattr+0x49/0x50
> >  fh_getattr+0x43/0x50 [nfsd]
> >  fh_fill_pre_attrs+0x4e/0xd0 [nfsd]
> >  nfsd4_open+0x51f/0x910 [nfsd]
> >  nfsd4_proc_compound+0x492/0x5d0 [nfsd]
> >  nfsd_dispatch+0x117/0x1f0 [nfsd]
> >  svc_process_common+0x3b2/0x5e0 [sunrpc]
> >  ? __pfx_nfsd_dispatch+0x10/0x10 [nfsd]
> >  svc_process+0xcf/0x130 [sunrpc]
> >  svc_recv+0x64e/0x750 [sunrpc]
> >  ? __wake_up_bit+0x4b/0x60
> >  ? __pfx_nfsd+0x10/0x10 [nfsd]
> >  nfsd+0xc6/0xf0 [nfsd]
> >  kthread+0xed/0x100
> >  ? __pfx_kthread+0x10/0x10
> >  ret_from_fork+0x2e/0x50
> >  ? __pfx_kthread+0x10/0x10
> >  ret_from_fork_asm+0x1a/0x30
> >  </TASK>
> >
> > I bisected the problem to:
> >
> > d949d1d14fa281ace388b1de978e8f2cd52875cf is the first bad commit
> > commit d949d1d14fa281ace388b1de978e8f2cd52875cf
> > Author:     Jeongjun Park <aha310510@gmail.com>
> > AuthorDate: Mon Sep 9 21:35:58 2024 +0900
> > Commit:     Andrew Morton <akpm@linux-foundation.org>
> > CommitDate: Mon Oct 28 21:40:39 2024 -0700
> >
> >     mm: shmem: fix data-race in shmem_getattr()
> >
> > ...
> >
> >     Link: https://lkml.kernel.org/r/20240909123558.70229-1-aha310510@gm=
ail.com
> >     Fixes: 44a30220bc0a ("shmem: recalculate file inode when fstat")
> >     Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> >     Reported-by: syzbot <syzkaller@googlegroup.com>
> >     Cc: Hugh Dickins <hughd@google.com>
> >     Cc: Yu Zhao <yuzhao@google.com>
> >     Cc: <stable@vger.kernel.org>
> >     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> >
> > which first appeared in v6.12-rc6, and adds the line that is waiting
> > on the inode lock when my NFS server hangs.
> >
> > I haven't yet found the process that is holding the inode lock for
> > this inode.
>
> It is likely that the caller (nfsd4_open()-> fh_fill_pre_attrs()) is
> already holding the inode semaphore in this case.

Thanks for letting me know!

It seems that the previous patch I wrote was wrong in how to prevent data-r=
ace.
It seems that the problem occurs in nfsd because nfsd4_create_file() alread=
y
holds the inode_lock.

After further analysis, I found that this data-race mainly occurs when
vfs_statx_path does not acquire the inode_lock, and in other filesystems,
it is confirmed that inode_lock is acquired in many cases, so I will send a
new patch that fixes this problem right away.

Regards,

Jeongjun Park

>
>
> > Because this commit addresses only a KCSAN splat that has been
> > present since v4.3, and does not address a reported behavioral
> > issue, I respectfully request that this commit be reverted
> > immediately so that it does not appear in v6.12 final.
> > Troubleshooting and testing should continue until a fix to the KCSAN
> > issue can be found that does not deadlock NFS exports of tmpfs.
> >
> >
> > --
> > Chuck Lever
> >
>
> --
> Chuck Lever
