Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC103594F
	for <regressions@lists.linux.dev>; Tue, 10 Dec 2024 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822194; cv=none; b=WSzqEglGc0A5LhhxWx5SwBgeei+0NgD3N0k8MH7o82TRbh9JvmxbYg2QkyYgDNM/TR+JKiyO8uOkI2iE9p+79pID9Gv+luang99MGewM/K4vkrYgI56iN/Sxl3lByhdMv4yLPI/I/F98QiInBiiqKc0caKNEu/7//w4zsGahThA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822194; c=relaxed/simple;
	bh=3j2918O/ojWB2Bu48Eq+ABh9KcTYw2UFeAdnGpbUSqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jmr1PxZJ/pd0mfsTv81Bf1cucufH14TlabLe1Cl7pPkgTRNb7O16S/isG5MWFJSewahFWHR3MOueBnNoGPwj/gTCVCznkKM8Czdr2+WVYPtxiVoxegB8HVuMGCnnhrutj0BhPB6v50kyrt+RET4abogAGu1N9DT2VhWLnuyKl/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlquK+Gu; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlquK+Gu"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa66ead88b3so469311166b.0
        for <regressions@lists.linux.dev>; Tue, 10 Dec 2024 01:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733822190; x=1734426990; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfq86kEzdTDdJEob5VUfgeLkC76+wSbSmEQOfsXHbzY=;
        b=nlquK+GuvO8btwnW0HjkJYDgaHhMb9X23YggzA6wHsGHfaHXdQfxeQZQO/+L9dpoLl
         TJL12pMIMkCq8gc96f7NBm6ailJUOdhe10xhzLrF60dUKyQRFZs1rkslAncYpa6J8y92
         N0ihxobZ01w719EojWJvkaVzhPmJPy5/QdP4SigmatlNBzIy1iM6PCBHKPVadpa64aJ0
         qYKP2BgW4jLmF/Damme54mMhnwZcyvdNF4+Lt1wsdQ3jU8eW4tLJq3Hj1cPWMewsn5Pl
         xgVDZf9Ln27aPmuFiJ8hqrKqrWsABzHTZSEmK7bL77jzaFQdb/rnJgg4D7+FMcSJgeB+
         oTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822190; x=1734426990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lfq86kEzdTDdJEob5VUfgeLkC76+wSbSmEQOfsXHbzY=;
        b=Is8Ni1n+yoyja6Ug8Vy53ggILiPdxG8XF8eByzClxozhrKegO/x52426Crzn1pbj18
         sB4Tm308bSvxvX4W6Zr2CJC51RqzAHAoRV3hpWC/MMr0v9A6V/LKH724pYLQJq3H/E5g
         0+hhRJlt6/Zx1gTOoB1ZJy7qRM3Iymdf4euNrQyKQdPCLUyJGUc5knu/1zrRuvphV50v
         0yo0tWLc2CVLltSg51NkuO1jagXCCM3wDe4DlCkyN/TN+j/eyykHRKw9Ee3Qd/m9zEAr
         ifisDDlPFsy21faRYRJ/KFRl189ioLfHhqZeNHerljXWsacqwwgUNx0+V0rFnUjCR8za
         XJyw==
X-Forwarded-Encrypted: i=1; AJvYcCUPnxjizg1jv/hFqTUFVHR2zTGOL00U/wueHFXI+AHR/IFjUQnt6Ss+2PbeqYKO+91Y2l+w3LDfxOkInA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwA6yYboF91RDp81FiCKK/cVMd11ajIkn+ESQVdUb8Ha2hBbkWu
	Pm+JLExviHzHkRsYH9Ry3mIiiMLCXlDtdXjd6aoS5Z3VHORWTo9M
X-Gm-Gg: ASbGnctPUZ/HxTcwR04Op44Zd6/jHOeQgojFXvXtjm2ZKJbbTj1w+c21+ldsQ5uPmy4
	K1sfVF53wtIZl82o8BddmwEYCLW0XVNPfayLdpYOhTO4xLThky4fRNQ/209D7p1XHRj0UQ6e9R4
	z2rWrIqDA1Tb8mV24XJ0lefsH0oiS+SIlEExRQOy0eV+kenRnscylDC5ovfQzwdIYuXjkf6rCTj
	5UkwPmygh/aNSCnmrTCiiYeYti/piI4yLHl581aqe1H1djPMJXinjnVjBFOfJ46fFSDzyDLGO8Z
	OUX3geZ7ufFlUA==
X-Google-Smtp-Source: AGHT+IEKU3lSElcNaqpwWm31hD9rrWvnyw0r23qxGJX95m6SYT+eLg5pz5VSqpGedQUEDyYf3Xjzdw==
X-Received: by 2002:a17:907:ca0a:b0:aa6:816f:2b40 with SMTP id a640c23a62f3a-aa69ce6b99dmr342867766b.38.1733822189732;
        Tue, 10 Dec 2024 01:16:29 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6808c03a5sm333841366b.137.2024.12.10.01.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:16:29 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 3BE79BE2EE7; Tue, 10 Dec 2024 10:16:28 +0100 (CET)
Date: Tue, 10 Dec 2024 10:16:28 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Michael Krause <mk@galax.is>, Paulo Alcantara <pc@manguebit.com>,
	Michael Krause <mk-debian@galax.is>,
	Steve French <stfrench@microsoft.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev, linux-cifs@vger.kernel.org
Subject: Re: backporting 24a9799aa8ef ("smb: client: fix UAF in
 smb2_reconnect_server()") to older stable series
Message-ID: <Z1gG7JZmxu_qnbPZ@eldamar.lan>
References: <2024040834-magazine-audience-8aa4@gregkh>
 <Z0rZFrZ0Cz3LJEbI@eldamar.lan>
 <2e1ad828-24b3-488d-881e-69232c8c6062@galax.is>
 <1037557ef401a66691a4b1e765eec2e2@manguebit.com>
 <Z08ZdhIQeqHDHvqu@eldamar.lan>
 <3441d88b-92e6-4f89-83a4-9230c8701d73@galax.is>
 <2024121030-opt-escapist-fdc5@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024121030-opt-escapist-fdc5@gregkh>

Hi Greg,

On Tue, Dec 10, 2024 at 09:51:58AM +0100, Greg KH wrote:
> On Tue, Dec 10, 2024 at 12:05:00AM +0100, Michael Krause wrote:
> > On 12/3/24 3:45 PM, Salvatore Bonaccorso wrote:
> > > Paulo,
> > > 
> > > On Tue, Dec 03, 2024 at 10:18:25AM -0300, Paulo Alcantara wrote:
> > > > Michael Krause <mk-debian@galax.is> writes:
> > > > 
> > > > > On 11/30/24 10:21 AM, Salvatore Bonaccorso wrote:
> > > > > > Michael, did a manual backport of 24a9799aa8ef ("smb: client: fix UAF
> > > > > > in smb2_reconnect_server()") which seems in fact to solve the issue.
> > > > > > 
> > > > > > Michael, can you please post your backport here for review from Paulo
> > > > > > and Steve?
> > > > > 
> > > > > Of course, attached.
> > > > > 
> > > > > Now I really hope I didn't screw it up :)
> > > > 
> > > > LGTM.  Thanks Michael for the backport.
> > > 
> > > Thanks a lot for the review. So to get it accepted it needs to be
> > > brough into the form which Greg can pick up. Michael can you do that
> > > and add your Signed-off line accordingly?
> > Happy to. Hope this is in the proper format:
> > 
> > 
> > 
> > 
> > From 411fb6398fe3c3c08a000d717bff189f08d2041c Mon Sep 17 00:00:00 2001
> > From: Paulo Alcantara <pc@manguebit.com>
> > Date: Mon, 1 Apr 2024 14:13:10 -0300
> > Subject: [PATCH] smb: client: fix UAF in smb2_reconnect_server()
> > 
> > commit 24a9799aa8efecd0eb55a75e35f9d8e6400063aa upstream.
> > 
> > The UAF bug is due to smb2_reconnect_server() accessing a session that
> > is already being teared down by another thread that is executing
> > __cifs_put_smb_ses().  This can happen when (a) the client has
> > connection to the server but no session or (b) another thread ends up
> > setting @ses->ses_status again to something different than
> > SES_EXITING.
> > 
> > To fix this, we need to make sure to unconditionally set
> > @ses->ses_status to SES_EXITING and prevent any other threads from
> > setting a new status while we're still tearing it down.
> > 
> > The following can be reproduced by adding some delay to right after
> > the ipc is freed in __cifs_put_smb_ses() - which will give
> > smb2_reconnect_server() worker a chance to run and then accessing
> > @ses->ipc:
> > 
> > kinit ...
> > mount.cifs //srv/share /mnt/1 -o sec=krb5,nohandlecache,echo_interval=10
> > [disconnect srv]
> > ls /mnt/1 &>/dev/null
> > sleep 30
> > kdestroy
> > [reconnect srv]
> > sleep 10
> > umount /mnt/1
> > ...
> > CIFS: VFS: Verify user has a krb5 ticket and keyutils is installed
> > CIFS: VFS: \\srv Send error in SessSetup = -126
> > CIFS: VFS: Verify user has a krb5 ticket and keyutils is installed
> > CIFS: VFS: \\srv Send error in SessSetup = -126
> > general protection fault, probably for non-canonical address
> > 0x6b6b6b6b6b6b6b6b: 0000 [#1] PREEMPT SMP NOPTI
> > CPU: 3 PID: 50 Comm: kworker/3:1 Not tainted 6.9.0-rc2 #1
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-1.fc39
> > 04/01/2014
> > Workqueue: cifsiod smb2_reconnect_server [cifs]
> > RIP: 0010:__list_del_entry_valid_or_report+0x33/0xf0
> > Code: 4f 08 48 85 d2 74 42 48 85 c9 74 59 48 b8 00 01 00 00 00 00 ad
> > de 48 39 c2 74 61 48 b8 22 01 00 00 00 00 74 69 <48> 8b 01 48 39 f8 75
> > 7b 48 8b 72 08 48 39 c6 0f 85 88 00 00 00 b8
> > RSP: 0018:ffffc900001bfd70 EFLAGS: 00010a83
> > RAX: dead000000000122 RBX: ffff88810da53838 RCX: 6b6b6b6b6b6b6b6b
> > RDX: 6b6b6b6b6b6b6b6b RSI: ffffffffc02f6878 RDI: ffff88810da53800
> > RBP: ffff88810da53800 R08: 0000000000000001 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000001 R12: ffff88810c064000
> > R13: 0000000000000001 R14: ffff88810c064000 R15: ffff8881039cc000
> > FS: 0000000000000000(0000) GS:ffff888157c00000(0000)
> > knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007fe3728b1000 CR3: 000000010caa4000 CR4: 0000000000750ef0
> > PKRU: 55555554
> > Call Trace:
> >  <TASK>
> >  ? die_addr+0x36/0x90
> >  ? exc_general_protection+0x1c1/0x3f0
> >  ? asm_exc_general_protection+0x26/0x30
> >  ? __list_del_entry_valid_or_report+0x33/0xf0
> >  __cifs_put_smb_ses+0x1ae/0x500 [cifs]
> >  smb2_reconnect_server+0x4ed/0x710 [cifs]
> >  process_one_work+0x205/0x6b0
> >  worker_thread+0x191/0x360
> >  ? __pfx_worker_thread+0x10/0x10
> >  kthread+0xe2/0x110
> >  ? __pfx_kthread+0x10/0x10
> >  ret_from_fork+0x34/0x50
> >  ? __pfx_kthread+0x10/0x10
> >  ret_from_fork_asm+0x1a/0x30
> >  </TASK>
> > 
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Paulo Alcantara (Red Hat) <pc@manguebit.com>
> > Signed-off-by: Steve French <stfrench@microsoft.com>
> > [Michael Krause: Naive, manual merge because the 3rd hunk would not
> >                  apply]
> > Signed-off-by: Michael Krause <mk-debian@galax.is>
> > ---
> >  fs/smb/client/connect.c | 80 ++++++++++++++++++-----------------------
> >  1 file changed, 35 insertions(+), 45 deletions(-)
> 
> What kernel(s) is this commit supposed to be for?

6.1.y (at least, possibly older, but the reporter did test on 6.1.y
for Debian, context from https://bugs.debian.org/1088733). Upper
stable series have already the commit in 6.6.29, 6.8.5.

Regards,
Salvatore
