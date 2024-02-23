Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6762911C84
	for <regressions@lists.linux.dev>; Fri, 23 Feb 2024 05:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708667415; cv=none; b=kai4PAAOAgQRncyshxId5u/Q44WRCsDqz6ua12CQB96HFAtpUAbv6Uza7VvGc6JEKqRbNdarQfk/bngi9exbk++pNY0mMbFtYTEhTAisM0FjFMEx7Mx4/6/6tA17vELZXR10OZdKix4pfmWvArtsja+zfGAgAaOFpGuX/JRd6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708667415; c=relaxed/simple;
	bh=+Um1CdEznBdO6T2dP8iyo4nBh6/ghnD0EIvlfWcN5UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/dwbKI+HR4PNfqsoIyr2zeBN9t9HcRPFanuNy9fUfeeC1s5bLD/73MpGftMtPJ0KpIvL9L6MbPfhO10yPO6ejVzPWHA8UlC0Lp/6IajJv0vXOGOSJobqoAt8cJbzKHl313LIdzrnixUHeqsL85pCeNv6UoasTgSvj6L2YavVOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BngSeOje; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BngSeOje"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4128f3eea18so3415625e9.2
        for <regressions@lists.linux.dev>; Thu, 22 Feb 2024 21:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708667412; x=1709272212; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVHfYM1cNhLPjaqdFOrGfjZIQWSrKkBW2dlATH8gHBA=;
        b=BngSeOjeOaH4C+8B/zi2nYBjAQXmSgZ4Nogi0EBLbGu38B/FM3PkPzbyqAhRYmeinJ
         y6Se1R7L/wrqf5qk8y/uAI/kIRrq+zk8+mX1Sw1zR6qzkWCcuUq4qVv7cDllJYIIU/Ot
         6YXmB9rzycq6867zK66flPFErbFrronc1/sLgxmzTGp80EFtTs9KOk+IhCvnNYh4kGs0
         6/U/8fACrfYYzgp2veubypMHMKw5OVfiXR9F6WAiv3uYACAMmEBTzYbfBkdTtFcP12V2
         fQOJIwxBPFO6sRlj2n4d9FgzymoobFos/HvaBMKSJ2D2rhu9YqD4mo464SxRJffw1I/J
         eCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708667412; x=1709272212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVHfYM1cNhLPjaqdFOrGfjZIQWSrKkBW2dlATH8gHBA=;
        b=E7+NGvueQ5Kdn5HJrjcCaHvQzsAkHei0+Ij4kyE1NN8zfx1Wx3Cx4Fmz3kiwgDm4G0
         G519ut50TIYdvDR668p94p26ySyGCxj2xLRObJli3gJR8j16RNkTTneOucf7KWidVvh/
         FWKgmfXvKMmfHvWiT5OsfMS0i61diUwM9dzqmFNlhyAlvjSGAisuxRQ0e/oTUVfFjtoe
         4Ycnb2zQywBe5EWmxoZrP40H2VHcms45kpV1AIBrZxjAk7UGLf01Nvso6x9B6yDxo2c+
         2emJLRG5IPgrDwX9tFXZvGHKy0vJbdOVfQMBa9OgYHYR8xSImEEOGAL4eOzwid4Z0NQF
         8LBA==
X-Forwarded-Encrypted: i=1; AJvYcCXAEd0qcElCqnjj3AbNkHY7Rtrck39MsFr47x5pC4nZTkBA8AG5fXNIv/K/qRWK3E/hQxAnnR9/TQ/EgRu918Y0Id79bWag/MLqruc=
X-Gm-Message-State: AOJu0Yzwagq6QpXBbOxVp0wWImBceyyRUWxGiIkCF4LsPQMbqvykF5ws
	LpT3krlNV47XnfYFzz4xtvLka+rZyPJNfLR0SdMeBy+bMLDuESH/
X-Google-Smtp-Source: AGHT+IHJvpt/gu3pD6OoePdLOA7MRm4WLiaQj/mMB5lxXFiFloiHIXnEjLTqfgdX/VJ9Vd+RXP+aBQ==
X-Received: by 2002:a5d:6a84:0:b0:33d:32ff:9629 with SMTP id s4-20020a5d6a84000000b0033d32ff9629mr697401wru.23.1708667411410;
        Thu, 22 Feb 2024 21:50:11 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id i9-20020a5d4389000000b0033cf095b9a2sm1417737wrq.78.2024.02.22.21.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 21:50:10 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id C864DBE2EE8; Fri, 23 Feb 2024 06:50:09 +0100 (CET)
Date: Fri, 23 Feb 2024 06:50:09 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Paulo Alcantara <pc@manguebit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>,
	Leonardo Brondani Schenkel <leonardo@schenkel.net>,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	Mathias =?iso-8859-1?Q?Wei=DFbach?= <m.weissbach@info-gate.de>
Subject: Re: [REGRESSION 6.1.70] system calls with CIFS mounts failing with
 "Resource temporarily unavailable"
Message-ID: <ZdgyEfNsev8WGIl5@eldamar.lan>
References: <7425b05a-d9a1-4c06-89a2-575504e132c3@sairon.cz>
 <446860c571d0699ed664175262a9e84b@manguebit.com>
 <2024010846-hefty-program-09c0@gregkh>
 <88a9efbd0718039e6214fd23978250d1@manguebit.com>
 <Zbl7qIcpekgPmLDP@eldamar.lan>
 <Zbl881W5S-nL7iof@eldamar.lan>
 <2024022058-scrubber-canola-37d2@gregkh>
 <ZdUYvHe6u3LcUHDf@eldamar.lan>
 <2024022137-ducky-upgrade-e50a@gregkh>
 <181e4ae5b2ea3c2316e577cae4b62cc6@manguebit.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181e4ae5b2ea3c2316e577cae4b62cc6@manguebit.com>

Hi Paulo,

On Thu, Feb 22, 2024 at 08:00:58PM -0300, Paulo Alcantara wrote:
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> 
> > On Tue, Feb 20, 2024 at 10:25:16PM +0100, Salvatore Bonaccorso wrote:
> >> Hi Greg,
> >> 
> >> On Tue, Feb 20, 2024 at 09:27:49PM +0100, Greg Kroah-Hartman wrote:
> >> > On Tue, Jan 30, 2024 at 11:49:23PM +0100, Salvatore Bonaccorso wrote:
> >> > > Hi Paulo, hi Greg,
> >> > > 
> >> > > On Tue, Jan 30, 2024 at 11:43:52PM +0100, Salvatore Bonaccorso wrote:
> >> > > > Hi Paulo, hi Greg,
> >> > > > 
> >> > > > Note this is about the 5.10.y backports of the cifs issue, were system
> >> > > > calls fail with "Resource temporarily unavailable".
> >> > > > 
> >> > > > On Mon, Jan 08, 2024 at 12:58:49PM -0300, Paulo Alcantara wrote:
> >> > > > > Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> >> > > > > 
> >> > > > > > Why can't we just include eb3e28c1e89b ("smb3: Replace smb2pdu 1-element
> >> > > > > > arrays with flex-arrays") to resolve this?
> >> > > > > 
> >> > > > > Yep, this is the right way to go.
> >> > > > > 
> >> > > > > > I've queued it up now.
> >> > > > > 
> >> > > > > Thanks!
> >> > > > 
> >> > > > Is the underlying issue by picking the three commits:
> >> > > > 
> >> > > > 3080ea5553cc ("stddef: Introduce DECLARE_FLEX_ARRAY() helper")
> >> > > > eb3e28c1e89b ("smb3: Replace smb2pdu 1-element arrays with flex-arrays")
> >> > > > 
> >> > > > and the last commit in linux-stable-rc for 5.10.y:
> >> > > > 
> >> > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit?id=a280ecca48beb40ca6c0fc20dd5a7fdd9b3ee0b7
> >> > > > 
> >> > > > really fixing the issue?
> >> > > > 
> >> > > > Since we need to release a new update in Debian, I picked those three
> >> > > > for testing on top of the 5.10.209-1 and while testing explicitly a
> >> > > > cifs mount, I still get:
> >> > > > 
> >> > > > statfs(".", 0x7ffd809d5a70)             = -1 EAGAIN (Resource temporarily unavailable)
> >> > > > 
> >> > > > The same happens if I build
> >> > > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit?id=a280ecca48beb40ca6c0fc20dd5a7fdd9b3ee0b7
> >> > > > (knowing that it is not yet ready for review).
> >> > > > 
> >> > > > I'm slight confused as a280ecca48be ("cifs: fix off-by-one in
> >> > > > SMB2_query_info_init()") says in the commit message:
> >> > > > 
> >> > > > [...]
> >> > > > 	v5.10.y doesn't have
> >> > > > 
> >> > > >         eb3e28c1e89b ("smb3: Replace smb2pdu 1-element arrays with flex-arrays")
> >> > > > 
> >> > > > 	and the commit does
> >> > > > [...]
> >> > > > 
> >> > > > and in meanwhile though the eb3e28c1e89b was picked (in a backported
> >> > > > version). As 6.1.75-rc2 itself does not show the same problem, might
> >> > > > there be a prerequisite missing in the backports for 5.10.y or a
> >> > > > backport being wrong?
> >> > > 
> >> > > The problem seems to be that we are picking the backport for
> >> > > eb3e28c1e89b, but then still applying 
> >> > > 
> >> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit?id=a280ecca48beb40ca6c0fc20dd5
> >> > > 
> >> > > which was made for the case in 5.10.y where eb3e28c1e89b is not
> >> > > present.
> >> > > 
> >> > > I reverted a280ecca48beb40ca6c0fc20dd5 and now:
> >> > > 
> >> > > statfs(".", {f_type=SMB2_MAGIC_NUMBER, f_bsize=4096, f_blocks=2189197, f_bfree=593878, f_bavail=593878, f_files=0, f_ffree=0, f_fsid={val=[2004816114, 0]}, f_namelen=255, f_frsize=4096, f_flags=ST_VALID|ST_RELATIME}) = 0
> >> > 
> >> > So this works?  Would that just be easier to do overall?  I feel like
> >> > that might be best here.
> >> > 
> >> > Again, a set of simple "do this and this and this" would be nice to
> >> > have, as there are too many threads here, some incomplete and missing
> >> > commits on my end.
> >> > 
> >> > confused,
> >> 
> >> It is quite chaotic, since I believe multiple people worked on trying
> >> to resolve the issue, and then for the 5.10.y and 5.15.y branches
> >> different initial commits were applied. 
> >> 
> >> For 5.10.y it's the case: Keep the backport of eb3e28c1e89b and drop
> >> a280ecca48be (as it is not true that v5.10.y does not have
> >> eb3e28c1e89b, as it is actually in the current 5.10.y queue).
> >
> > I think we are good now.
> >
> >> Paulo can you please give Greg an authoratitative set of commits to
> >> keep/apply in the 5.10.y and 5.15.y series.
> >
> > Yes, anything I missed?
> 
> The one-liner fix (a280ecca48be) provided by Harshit was only required
> if not backporting eb3e28c1e89b.  As both 5.10.y and 5.15.y now have
> eb3e28c1e89b queued up, LGTM.
> 
> Salvatore, please let us know if you can still hit the issue with
> eb3e28c1e89b applied.

Correct, I cannot reproduce anymore the issue with 5.10.210-rc1.

Regards,
Salvatore
