Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6697C13C9A2
	for <regressions@lists.linux.dev>; Wed,  7 Aug 2024 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723052100; cv=none; b=ddqtFFAgNazFhiodMdoGf/oByqGBuZ8G6vxUc9F0sMVDq1R4X/bWKRzWr2zma6HlsYYL41KpWgJ5fq9HwKG4q7UizkzovoUwgIL0X3vu5tkCW7Xg8c4/DWTwfh3kyQ0AoKdqAsD67ISFJEarSVD0Ivrfs51ft3CUoRTF6N59C4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723052100; c=relaxed/simple;
	bh=ltPpByyDG4lbIVSNFqUspG0YQ+VcetI5FnIT2s9392Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b45s1zkLqIq1z9cZJxADovdkqlUQbb42nbLDd04kUljHs6x5fAqSVKQWsZdktWVUoomCAyrulmXI27/K5j+d4pRkVcXjCEhqdoAIIlkf7EBhL8/d/vFWD4uRy4BMqwAb5TlBsROCBuarLQE2Y5AQK8TAnUbHAHFkNxQpVq9IWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLqA1qXw; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLqA1qXw"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-44ff132ff9cso684911cf.2
        for <regressions@lists.linux.dev>; Wed, 07 Aug 2024 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723052097; x=1723656897; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/Bi5E2ofh7mXD0UatHWFQLqSTihcAGldUhDFV3L1+o=;
        b=OLqA1qXwef+b4NQYw/TmpdMns1NBxdAjAfaTR0An9S/7O3I/itQ0PWNOQWM1AI5V+F
         Tso6ppkIcgZy3Tz5w+pnjDHdbw2PM7+yvuQFu2axxIE5U7WFFVqPWT1IIZAzFm5zQzCF
         tXH34t276J9ti8gedhg3y8OTr/qS/UpRzd+lRO97mSM4sJw5uJc98gilJO9O1ygpKNoI
         2EcRjIo+1idg4qAd5dztcHCBdoc2QehbcbmcVujY1OwBwF8xbi4bUnindDWaVoaIH3m3
         zj7d7FQnEsLbeP3J5ra74KmQnt8typfGutJxd1bUXVYdhQPRiXxrVViMAhkXh6yDBW4R
         ddeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723052097; x=1723656897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/Bi5E2ofh7mXD0UatHWFQLqSTihcAGldUhDFV3L1+o=;
        b=d8ULFM6acRDiTAVa3AgDd+vVQzT+74ENB1CXEfe4777X8VdcgqiRGZhbldMysG0QG6
         GITHn4HKzJF+ktO/quLN4MdMzVy9dmcSHfEjGiEtpLqqB4+SkhXBqcxJUHdUw7WeKr4W
         /QBXS8ifD4muKgEJDfGC+XpyFpyavu0e8AUgNw9tU1Ja4CRBQhTCiI/O4GOmPkiCysU1
         2S2PjK7vUqV+xyI64544+DuHLlj0qUvC7mmB3lFKXkhygtDjNC/cF32FhMWXJjveQXUa
         rTwGaLq6ffCVAuFlwCsdmGHDE1V1rre8SqSZqMs1ADZFCmGDQLnC1WMnOBnrbnI3cqPm
         VgCQ==
X-Gm-Message-State: AOJu0Yy/opKxnmg/M6p5WLC0aHnt5ED8+G+n8eiYYJMKYUVnsmsDfifH
	vmDvQZdpPlD4hNDe9iZ2QUxTevIvOFsEhRJRemb3aN8qCo8yIRRmrX/8E6HG
X-Google-Smtp-Source: AGHT+IG4REbO+g++rxr1kDFTByvVVNIX1KSXzHakhJaQK3kI6Bh+2X//hZVZ/0h11ao+NGu9CwDUPw==
X-Received: by 2002:a05:622a:13c6:b0:447:f259:2956 with SMTP id d75a77b69052e-451892c2f83mr217341841cf.59.1723052096895;
        Wed, 07 Aug 2024 10:34:56 -0700 (PDT)
Received: from nandaa-linux-dev.lp3xo4ddmz1ulowbk5mwlke0vc.bx.internal.cloudapp.net ([135.237.123.86])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-451c87da6d9sm6448661cf.78.2024.08.07.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 10:34:56 -0700 (PDT)
Date: Wed, 7 Aug 2024 17:34:55 +0000
From: Anthony Nandaa <profnandaa@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
	smfrench@gmail.com, Paulo Alcantara <pc@manguebit.com>
Cc: linux-cifs@vger.kernel.org, gkorobeynikov@astralinux.ru,
	linux-kernel@vger.kernel.org, annandaa@linux.microsoft.com
Subject: Re: [regression] smb: client: - Failure to mount DFS namespaces
 without ASCII symbols
Message-ID: <ZrOwPx+jhEM+sJFM@nandaa-linux-dev.lp3xo4ddmz1ulowbk5mwlke0vc.bx.internal.cloudapp.net>
References: <c0967665-343d-4ca9-90a0-a072159c1056@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0967665-343d-4ca9-90a0-a072159c1056@leemhuis.info>

On Fri, Aug 02, 2024 at 11:44:18AM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> Paulo, I noticed a report about a regression in bugzilla.kernel.org that
> appears to be caused by this change of yours:
> 
> 3ae872de410751 ("smb: client: fix shared DFS root mounts with different
> prefixes") [v6.5-rc1]
> 
> As many (most?) kernel developers don't keep an eye on the bug tracker,
> I decided to write this mail. To quote from
> https://bugzilla.kernel.org/show_bug.cgi?id=219083 :
> 
> >  Gleb Korobeynikov 2024-07-22 10:59:46 UTC
> > 
> > Windows version of SMB host: Windows Server 2022 Standard x64
> > Kernel: 6.3.13(upstream)
~~~~~~~~~~~~^~~~ Testing with same WS2022 host with 6.11.0-rc1+

> > CONFIG_CIFS_DFS_UPCALL
> > 
> > In the function cifs_inval_name_dfs_link_error(), a check was added for tcon->origin_fullpath (3ae872de410751fe5e629e04da491a632d95201c). I believe it's unnecessary because when mounting a dfs name without ASCII characters, we always fail at this check and exit the function, leading to dfs namespaces not being mounted
> > 
> > Steps to reproduce:
> > 
> > 1. At Windows, create DFS namespace with name containing non-ASCII symbols (for example дфс)
> > 
> > 2. mount -t cifs \\\\<smb_server>\\дфс  /tmp/dfs -o domain=...,user=...,password=...
> > 
> > result:
> > mount error(2): No such file or directory
> > Refer to the mount.cifs(8) manual page (e.g. man mount.cifs) and kernel log messages (dmesg)
> > 
I couldn't repro this issue.
I rebuilt the cifs modules both on master and in the recent 
for-next@cecb49e3594c2a69163865c214b71fff26d5761d sources:

	$ sudo mount -t cifs //WIN-31GSG2M9E6N/дфс /mnt/utf_repro -o `
		username=administrator,password=xxx
	$ ls -l /mnt/utf_repro
	total 0
	-rwxr-xr-x 1 root root 0 Aug  7 15:54 hello_cifs.txt
	drwxr-xr-x 2 root root 0 Aug  7 15:54 test_utf8_дфс

	// nothing outstanding in dmesg
	[430885.246220] CIFS: Attempting to mount //WIN-31GSG2M9E6N/дфс

Is there anything I might be missing?

> > CIFS debug log:
> > [Mon Jul 22 11:00:24 2024] CIFS: Status code returned 0xc0000033 STATUS_OBJECT_NAME_INVALID
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/smb2maperror.c: Mapping SMB2 status code 0xc0000033 to POSIX err -2
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/dfs_cache.c: dfs_cache_noreq_update_tgthint: path: \test.local\дфс
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: __cifs_put_smb_ses: ses_count=2
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: __cifs_put_smb_ses: ses ipc: \\test.local\IPC$
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: cifs_put_tcon: tc_count=1
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: VFS: in cifs_put_tcon as Xid: 17 with uid: 0
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/smb2pdu.c: Tree Disconnect
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/fscache.c: cifs_fscache_release_super_cookie: (0x0000000000000000)
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: __cifs_put_smb_ses: ses_count=1
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: __cifs_put_smb_ses: ses ipc: \\DC.test.local\IPC$
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: VFS: in __cifs_put_smb_ses as Xid: 18 with uid: 0
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/smb2pdu.c: disconnect session 00000000360c6881
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: __cifs_put_smb_ses: ses_count=1
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: __cifs_put_smb_ses: ses ipc: \\test.local\IPC$
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: VFS: in __cifs_put_smb_ses as Xid: 19 with uid: 0
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/smb2pdu.c: disconnect session 00000000db1ddbb6
> > [Mon Jul 22 11:00:24 2024] CIFS: fs/smb/client/connect.c: VFS: leaving cifs_mount_put_conns (xid = 13) rc = 0
> > [Mon Jul 22 11:00:24 2024] CIFS: VFS: cifs_mount failed w/return code = -2
> 
> And
> 
> >  Gleb Korobeynikov 2024-07-30 11:03:01 UTC
> > 
> > (In reply to Gleb Korobeynikov from comment #5)
> >> (In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
> >> comment #4)
> >> > Please check if 6.10 (or 6.11-rc1 once it's out on Monday) is still
> >> affected
> >> 
> >> Alright, I will definitely check
> > 
> > Checked on 6.11-rc1. The reproduction issue happens identically.
> 
> See the ticket for more details.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> [1] because bugzilla.kernel.org tells users upon registration their
> "email address will never be displayed to logged out users"
> 
> P.S.: let me use this mail to also add the report to the list of tracked
> regressions to ensure it's doesn't fall through the cracks:
> 
> #regzbot introduced: 3ae872de410751fe5e629e04da491a632d95201c
> #regzbot title: smb: client: failure to mount DFS namespaces without
> ASCII symbols
> #regzbot from: Gleb Korobeynikov <gkorobeynikov@astralinux.ru>
> #regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=219083
> #regzbot ignore-activity
>
Thanks,
Nandaa
 
