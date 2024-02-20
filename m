Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF0B14A4E6
	for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 21:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708464321; cv=none; b=pqBLDMDw0PoU/cTWlqYMMaY1Qu2we9n89sTWxPki7ZRLxJ6T690RpJ+gEy3j2C9bkwToViILUoZn7nFexwEhOOVUzP9yDv1cFLeSThYRPnyHYRez4MrW0rR0drsDE9jxeSig8/kaGEYu+hhXvciKvcuvv6mVTGLqT7Alm5ywXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708464321; c=relaxed/simple;
	bh=ccOl1B6MJSrFYO960l0mfmHlslZSEKYjP4pFDELe8Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Co+j6+TNrqp5HeheiG2a94KtzuDgg+YUvq8U80Ft3c20/YKLxOpWW3Y7hMwQpjDo4uOIpxwUN0qZy+qzWD7l6FE0bMlyVzBeJteVN5zgt/hIRKpICGZWqBP08qvfEStl2X3NijWk3szLfBBIj7HK7kasn5KFk7HG2tdtD9z15Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJlm1Fs6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJlm1Fs6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-410e820a4feso39623665e9.1
        for <regressions@lists.linux.dev>; Tue, 20 Feb 2024 13:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708464318; x=1709069118; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2t1e11fIXYpiLcc52i34tjoEp92z5dlX1WlplkqNyU=;
        b=VJlm1Fs6JOsXubfMBIBMxfVkdATAumDOeqZIsmvh/2YeQTnF4J4h54wxYKfmpzevEN
         0yAmMRKvXHPw+2aTw42kbGP+ZcNW1s+YVUBtdY9RxX7UIFMOBBmuKEljh5vNmX1uKJKY
         /Kh8snQWwc05U2126xnJ0bxyKP7sniwQqaSnS+n8xp5GQsD+Q9YzJxllE8k1Tg1nS6aX
         6Pi7hy7qBU8Z6zqpq3c/oMAyq6kzTiK6/sExsK9zK1VmdLLjnRkmAsVpmBiNnNhE+ecN
         KEf4ZkpGoUetZZpHvYSlmDSjix4YOb7vXZgW5HCI34iSntfIqg9B7KKQDOS7XW/LR4tw
         lUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708464318; x=1709069118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2t1e11fIXYpiLcc52i34tjoEp92z5dlX1WlplkqNyU=;
        b=lDbqD19CohyB5QDVYM/ihIBM5l2qSkPUtrI39TgbD+7wEqDsN6JocfQoVBbe+YpHye
         vL5DRwkqt9kk7ethrn1/5yW7KRLxj9vZz9FELXBKSadU9LDh4OhJRF75TUA6KazffMnk
         FR9X2bgy1YjbgB1BiX0ROD744TgvYQhdAYxddJIuLKc8JiNAWyVxQW/SRXPAe/k/9LjA
         MmN1sNlgdIwiRDJoq5teYiv8UClMyWfbGlQl7vohACZTZMiG2zG35qO43sH61MIhz+Li
         xFS963LO7BTuhO0XRqOVe2QYf2HW+jikWt0NnG+XGHj3gz2ejd4n3yXhoi2GPTGMkr8+
         Loww==
X-Forwarded-Encrypted: i=1; AJvYcCX/rB7rO+pMnkzvLLKrchHl/foXHPmdeg+O2ncVlrUxiLs64CPMKdKtGEv+/Qxd+UrjPgQMRq1KYC4TJWs0LOYJcDve9i6D/g3q1pY=
X-Gm-Message-State: AOJu0YwOjAPVLkbYK1CoV1JmRRCf2fe93amMCiATuRl0l5Lrhix+EP+5
	pwLBPGqeVDF6WjMTJAVvMOFPawGNYeeaCNsnbkij3VF6bdJ/pOhR
X-Google-Smtp-Source: AGHT+IELfCQvBpF71Gvt8IsLC2VtPSSkkASqab5VZyRK93zl2RkycjKLamjrSRdP1y3CDVDG4j05RA==
X-Received: by 2002:a05:600c:1c1d:b0:412:529f:934a with SMTP id j29-20020a05600c1c1d00b00412529f934amr11279424wms.19.1708464317657;
        Tue, 20 Feb 2024 13:25:17 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id cl2-20020a5d5f02000000b0033d6bc17d0esm3387295wrb.74.2024.02.20.13.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 13:25:17 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 3E05EBE2EE8; Tue, 20 Feb 2024 22:25:16 +0100 (CET)
Date: Tue, 20 Feb 2024 22:25:16 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paulo Alcantara <pc@manguebit.com>,
	Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>,
	Leonardo Brondani Schenkel <leonardo@schenkel.net>,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	Mathias =?iso-8859-1?Q?Wei=DFbach?= <m.weissbach@info-gate.de>
Subject: Re: [REGRESSION 6.1.70] system calls with CIFS mounts failing with
 "Resource temporarily unavailable"
Message-ID: <ZdUYvHe6u3LcUHDf@eldamar.lan>
References: <8ad7c20e-0645-40f3-96e6-75257b4bd31a@schenkel.net>
 <7425b05a-d9a1-4c06-89a2-575504e132c3@sairon.cz>
 <446860c571d0699ed664175262a9e84b@manguebit.com>
 <2024010846-hefty-program-09c0@gregkh>
 <88a9efbd0718039e6214fd23978250d1@manguebit.com>
 <Zbl7qIcpekgPmLDP@eldamar.lan>
 <Zbl881W5S-nL7iof@eldamar.lan>
 <2024022058-scrubber-canola-37d2@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024022058-scrubber-canola-37d2@gregkh>

Hi Greg,

On Tue, Feb 20, 2024 at 09:27:49PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 30, 2024 at 11:49:23PM +0100, Salvatore Bonaccorso wrote:
> > Hi Paulo, hi Greg,
> > 
> > On Tue, Jan 30, 2024 at 11:43:52PM +0100, Salvatore Bonaccorso wrote:
> > > Hi Paulo, hi Greg,
> > > 
> > > Note this is about the 5.10.y backports of the cifs issue, were system
> > > calls fail with "Resource temporarily unavailable".
> > > 
> > > On Mon, Jan 08, 2024 at 12:58:49PM -0300, Paulo Alcantara wrote:
> > > > Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > > > 
> > > > > Why can't we just include eb3e28c1e89b ("smb3: Replace smb2pdu 1-element
> > > > > arrays with flex-arrays") to resolve this?
> > > > 
> > > > Yep, this is the right way to go.
> > > > 
> > > > > I've queued it up now.
> > > > 
> > > > Thanks!
> > > 
> > > Is the underlying issue by picking the three commits:
> > > 
> > > 3080ea5553cc ("stddef: Introduce DECLARE_FLEX_ARRAY() helper")
> > > eb3e28c1e89b ("smb3: Replace smb2pdu 1-element arrays with flex-arrays")
> > > 
> > > and the last commit in linux-stable-rc for 5.10.y:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit?id=a280ecca48beb40ca6c0fc20dd5a7fdd9b3ee0b7
> > > 
> > > really fixing the issue?
> > > 
> > > Since we need to release a new update in Debian, I picked those three
> > > for testing on top of the 5.10.209-1 and while testing explicitly a
> > > cifs mount, I still get:
> > > 
> > > statfs(".", 0x7ffd809d5a70)             = -1 EAGAIN (Resource temporarily unavailable)
> > > 
> > > The same happens if I build
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit?id=a280ecca48beb40ca6c0fc20dd5a7fdd9b3ee0b7
> > > (knowing that it is not yet ready for review).
> > > 
> > > I'm slight confused as a280ecca48be ("cifs: fix off-by-one in
> > > SMB2_query_info_init()") says in the commit message:
> > > 
> > > [...]
> > > 	v5.10.y doesn't have
> > > 
> > >         eb3e28c1e89b ("smb3: Replace smb2pdu 1-element arrays with flex-arrays")
> > > 
> > > 	and the commit does
> > > [...]
> > > 
> > > and in meanwhile though the eb3e28c1e89b was picked (in a backported
> > > version). As 6.1.75-rc2 itself does not show the same problem, might
> > > there be a prerequisite missing in the backports for 5.10.y or a
> > > backport being wrong?
> > 
> > The problem seems to be that we are picking the backport for
> > eb3e28c1e89b, but then still applying 
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit?id=a280ecca48beb40ca6c0fc20dd5
> > 
> > which was made for the case in 5.10.y where eb3e28c1e89b is not
> > present.
> > 
> > I reverted a280ecca48beb40ca6c0fc20dd5 and now:
> > 
> > statfs(".", {f_type=SMB2_MAGIC_NUMBER, f_bsize=4096, f_blocks=2189197, f_bfree=593878, f_bavail=593878, f_files=0, f_ffree=0, f_fsid={val=[2004816114, 0]}, f_namelen=255, f_frsize=4096, f_flags=ST_VALID|ST_RELATIME}) = 0
> 
> So this works?  Would that just be easier to do overall?  I feel like
> that might be best here.
> 
> Again, a set of simple "do this and this and this" would be nice to
> have, as there are too many threads here, some incomplete and missing
> commits on my end.
> 
> confused,

It is quite chaotic, since I believe multiple people worked on trying
to resolve the issue, and then for the 5.10.y and 5.15.y branches
different initial commits were applied. 

For 5.10.y it's the case: Keep the backport of eb3e28c1e89b and drop
a280ecca48be (as it is not true that v5.10.y does not have
eb3e28c1e89b, as it is actually in the current 5.10.y queue).

Paulo can you please give Greg an authoratitative set of commits to
keep/apply in the 5.10.y and 5.15.y series.

Regards,
Salvatore
