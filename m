Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD42293C41
	for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199340; cv=none; b=IKSEBg4loHPECUAMz6ypXlQ3fO1wnVlzSbs8dp9qYgsrDvWDCRzDCPJko9MqPZtsMXsaw/ePf4vHPqcKZEyNHytPzHCTGYS1+0gIitSMBDHRIGbxUITakKUuDd/ljR/A+MdnEWE0/MPAFcH4O+5Kj1HBpWtTVI/+kkEMkbRyHBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199340; c=relaxed/simple;
	bh=/4Z85qLiOhrFNWNtp4uVTiF3dKWrPY9wrRNfbZmguZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnNcsV6kDhMLtEH9ZMZyeZ8TuXqzQECb7lvcatsxDRjAwuf3iiz7I8M7SMXF50pp2yAtldsgG1SOE+odEjaeEIuV/7STGrSEYgaE2vINUxPYn1dU5yK9S5JGVuaSz+4eHLZWpv3cajhIXc1OxrTC6a1pFGFc0EgMhTidcrt7Aw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=uPc3gNmv; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="uPc3gNmv"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31329098ae8so130814a91.1
        for <regressions@lists.linux.dev>; Tue, 17 Jun 2025 15:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1750199338; x=1750804138; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3N7YOdKa5o/LDuwU1IaHWnPevk35pPCx13T0ozSKakU=;
        b=uPc3gNmvUpN3JeMB8Qc0pNrBhsZ99Rnh3Gaho7UzpAXQOJic0cDIg6sLEizzuAge3d
         0lVn4q8WCEq7Gu2PZ5TwbvVzfc2OMbM9Ayx1k2G5KnmCUzVoBcNJQvTQ1fNSJe3oi6+o
         MiAPoBg41b7rqOAL8QclSMcYzXNOQ6yoesVRxhixaoI3wvmfiNQEH/YkF9B8XmL8zSa7
         dz0NCHIFsidsCCx+cZ9SjkwEI3CNadywLQNpmpZ9tACZ0uxJu8Q+kK1jjPzNaCw68xGt
         HyhOlrXiZv1otOMDRkMiK4ZjawW22Om6kRKpk1Psk55bfRJqHWDjcuJLSVuloHMK5MG5
         qO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750199338; x=1750804138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3N7YOdKa5o/LDuwU1IaHWnPevk35pPCx13T0ozSKakU=;
        b=G24iOaUhpW3jFmwXjbmf7yuB3Er6otbDoVPZrTzyhyY70DddluufVz91x3YBQKxMQM
         AcPImQNMOY1+6flvxxZBzMtiaufrG3VxmKSjTAde7FzKAuqysGxpzAs3D1HcPCHYkERj
         0Amr7K7Zo1Wss5u3bj0JagRkW2MZbvnSAFdcqc2o+JCqf2wgQyhUKMIhCOKVkEDChyos
         0cQb9Y5Z9fbq7o33RXNSZJNvh1nU3bZ69DjTyVcpzLt1HLw4Tujak+G4rOCKGZASLM8o
         7LsXMXywWQO89n807J3kLQXSCBpRqOzR9ZybUbw+ijgHdfnlLAFz66ZQSvkQEqcynxkk
         KR1g==
X-Forwarded-Encrypted: i=1; AJvYcCWD6kdBiVDjDMSjHsrMSMcYqNuYL+64tVG3w3QF2tI0VE/x9/mGQX7BLwcZAjRIP/cLjG2wb3Kw/eXyiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqMDw3Qfe5GGNA14SXKKVWG/spzGdgmoFJrtdQc1D5ISod15Bu
	l8NNHaWuEN+C7IBk5xU/NcRYabaHrTXcDjC4HGxONVaZ7C7E9E7mFnoyXtDg2m23P8s=
X-Gm-Gg: ASbGncsioT66JIIoWCxkIWU29Vfdr0xmsaMLktLWiMhUxNaTMZRO16mXNef6GEuJjKS
	jOzJ9UODlhael6kcG1TW9NS6Ex0qEmUbf85v07AlvxaDm1CcdK9FoZaokUT81Hc0tMlZojBNkAu
	2c3/DCFzSpQIyhzXhDbR/CxfsELPaDvgSvQ/IIT/zAeajQlURtHlw/HN14SlM2ACKklyX2cPE88
	BwCvVRU60DnNveNnrVIhpUO5IaDxd2DzEot1/FrPNvWyPREO+Qlg55E8tUBcKYcTQSW3+xFmTOh
	uggLKTWVH+RUS3lFq283B/kLVmbxLPeZDLsQQd6K4ESatUbRJPURnAlDpNg3kz9FhDXMt3eA7In
	pm0pnxtKZhmGhCisqaSqVulYruqaRU2Z+nF22Yw==
X-Google-Smtp-Source: AGHT+IH9Adp7KVCe1dIB54ciUppQCSTOfdY/Fpe9p7WGaoQb5fXtwqTYHTw3SzH3gfOqEsKuhxarPA==
X-Received: by 2002:a17:90b:52d0:b0:30e:3737:7c87 with SMTP id 98e67ed59e1d1-3157c71770dmr313026a91.5.1750199338280;
        Tue, 17 Jun 2025 15:28:58 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au. [49.180.184.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88eb80sm85874875ad.5.2025.06.17.15.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:28:57 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uRenW-00000000Avl-3saH;
	Wed, 18 Jun 2025 08:28:54 +1000
Date: Wed, 18 Jun 2025 08:28:54 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christian Theune <ct@flyingcircus.io>
Cc: Carlos Maiolino <cem@kernel.org>, stable@vger.kernel.org,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: temporary hung tasks on XFS since updating to 6.6.92
Message-ID: <aFHsJmPhK6hBfEPC@dread.disaster.area>
References: <M1JxD6k5Sdxnq-pztTdv_FZwURA8AaT9qWNFUYGCmhiTRQFESfH7xqdOqQjz-oKQiin8pQckoNhfNyCHu-cxEQ==@protonmail.internalid>
 <14E1A49D-23BF-4929-A679-E6D5C8977D40@flyingcircus.io>
 <umhydsim2pkxhtux5hizyahwd6hy36yct5znt6u6ewo4fojvgy@zn4gkroozwes>
 <Z9Ih4yZoepxhmmH5Jrd1bCz35l6iPh5g2J61q2NR7loEdQb_aRquKdD1xLaE_5SPMlkBM8zLdVfdPvvKuNBrGQ==@protonmail.internalid>
 <3E218629-EA2C-4FD1-B2DB-AA6E40D422EE@flyingcircus.io>
 <g7wcgkxdlbshztwihayxma7xkxe23nic7zcreb3eyg3yeld5cu@yk7l2e4ibajk>
 <01751810-C689-4270-8797-FC0D632B6AB6@flyingcircus.io>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01751810-C689-4270-8797-FC0D632B6AB6@flyingcircus.io>

On Mon, Jun 16, 2025 at 12:09:21PM +0200, Christian Theune wrote:
> > Can you share the xfs_info of one of these filesystems? I'm curious about the FS
> > geometry.
> 
> Sure:
> 
> # xfs_info /
> meta-data=/dev/disk/by-label/root isize=512    agcount=21, agsize=655040 blks
>          =                       sectsz=512   attr=2, projid32bit=1
>          =                       crc=1        finobt=1, sparse=1, rmapbt=0
>          =                       reflink=1    bigtime=1 inobtcount=1 nrext64=0
>          =                       exchange=0
> data     =                       bsize=4096   blocks=13106171, imaxpct=25
>          =                       sunit=0      swidth=0 blks
> naming   =version 2              bsize=4096   ascii-ci=0, ftype=1, parent=0
> log      =internal log           bsize=4096   blocks=16384, version=2
>          =                       sectsz=512   sunit=0 blks, lazy-count=1
> realtime =none                   extsz=4096   blocks=0, rtextents=0

From the logs, it was /dev/vda1 that was getting hung up, so I'm
going to assume the workload is hitting the root partition, not:

> # xfs_info /tmp/
> meta-data=/dev/vdb1              isize=512    agcount=8, agsize=229376 blks

... this one that has a small log.

IOWs, I don't think the log size is a contributing factor here.

The indication from the logs is that the system is hung up waiting
on slow journal writes. e.g. there are processes hung waiting for
transaction reservations (i.e. no journal space available). Journal
space is backed up on metadata writeback trying to force the journal
to stable storage (which is blocked waiting for journal IO
completion so it can issue more journal IO) and getting blocked so
it can't make progress, either.

I think part of the issue is that journal writes issue device cache
flushes and FUA writes, both of which require written data to be
on stable storage before returning.

All this points to whatever storage is backing these VMs is
extremely slow at guaranteeing persistence of data and eventually it
can't keep up with the application making changes to the filesystem.
When the journal IO latency gets high enough you start to see things
backing up and stall warnings appearing.

IOWs, this does not look like a filesystem issue from the
information presented, just storage that can't keep up with the rate
at which the filesystem can make modifications in memory. When the
fs finally starts to throttle on the slow storage, that's when you
notice just how slow the storage actually is...

[ Historical note: this is exactly the sort of thing we have seen
for years with hardware RAID5/6 adapters with large amounts of NVRAM
and random write workloads. They run as fast as NVRAM can sink the
4kB random writes, then when the NVRAM fills, they have to wait for
hundreds of MB of cached 4kB random writes to be written to the
RAID5/6 luns at 50-100 IOPS. This causes the exact same "filesystem
is hung" symptoms as you are describing in this thread. ]

> >>> There has been a few improvements though during Linux 6.9 on the log performance,
> >>> but I can't tell if you have any of those improvements around.
> >>> I'd suggest you trying to run a newer upstream kernel, otherwise you'll get very
> >>> limited support from the upstream community. If you can't, I'd suggest you
> >>> reporting this issue to your vendor, so they can track what you are/are not
> >>> using in your current kernel.
> >> 
> >> Yeah, we’ve started upgrading selected/affected projects to 6.12, to see whether this improves things.

Keep in mind that if the problem is persistent write performance of
the storage, upgrading the kernel will not make it go away. It may
make it worse, because other optimisations we've made in the mean
time could mean the journal fills faster and pushes into the
persistent IO backlog latency issue sooner and more frequently....

-Dave.

-- 
Dave Chinner
david@fromorbit.com
