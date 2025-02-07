Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14718194C94
	for <regressions@lists.linux.dev>; Fri,  7 Feb 2025 17:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949362; cv=none; b=GhpJbmtf+Hp2jvXvtyzDGIFKK0G39VHsW9bxiQ4E7ga9t+LXOZ43eVspniOAb+JzdNKzGq7f/jS67vN1vS17oKYjlqec/EjHtNBwfdWXfbRuwWlm+vL0z9DMMs6LaUzJJivUnDMU8hrjm3VFUDiZ14fzDV4m9UKi2OLYlZRE52g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949362; c=relaxed/simple;
	bh=8IjbTZjGhl0GZHrQmy0RQjKJ1BrqeqmFZwEnevxtmfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JATfMEc/vjuxrmEVtFpt6uWhhsEA6TXh4rFGqdErYb//a0CYawIwCO3+B7k3/ih0qz4a1cgY4Y3uQ9+RiZTvC/3b2tMNwt6RLayCzggAmFdJXlN1yxNaaWGBaVY9xVZs8Lo7l154u8iaMvQwRZqhmbNFHiMe4qazHcvgZQadi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=none smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b=N3rGO+jd; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda-com.20230601.gappssmtp.com header.i=@toxicpanda-com.20230601.gappssmtp.com header.b="N3rGO+jd"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e5b296611d1so2720422276.1
        for <regressions@lists.linux.dev>; Fri, 07 Feb 2025 09:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1738949360; x=1739554160; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pe1yEE3okQrQxigiaI6rQOtX6Rzf5xYLvQlxPdLkV2A=;
        b=N3rGO+jdxUBFdWqothF7VbANRnGcG4MSeHXxBpUnQjP+5t3lNI8HJ7SL0bppW/96bT
         ljWXGqoMy7QLywsHi3yGSKGCBGkpUnwaxZjcgFXAKZHgi8Ow3O6U8hlDnbCycfEVokMr
         OnokXo+T1sg9gx7L5V8g5zYE5wyIqLLi4DUZCxOhFgsu/Z2I2e1quxwL7qgPpCvfNHvn
         ZJJdUI4wwmwczSYJSux8j5xlq6jJQqOwMlUq2XymrQf+izdiTegUMVC64DX5h+oxwiaH
         Ib9q7fORC1DXPkpZYNJIUHOs4xwh64W8wO1eKnG++/+Ri5+lxXK4JbmOKeABmDNWVSaQ
         6yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949360; x=1739554160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pe1yEE3okQrQxigiaI6rQOtX6Rzf5xYLvQlxPdLkV2A=;
        b=SB4WZArqt98ygW3UQ1fgAHgCXJfO/Nt/Q9PLTZj5LJazX82JSP6TaA5sXHsA/TeYZm
         LVSu0yyRW1ac99a4Gl4NWYreHeJaC15PcoHvjzgXMXHl5kNKf8IXJxZ+dvzv9RfX70NQ
         1+FeOnp5rzabwufWohg+WY3LHKmnbi8Q+icmBnKiHIv6Nnb+9MxcNxf1fxtVZLEy7dAn
         D6YQB2wL+QKCKSP9Fuvr2V4CDXKZ+laQrH3nu48PivuPwpk0kG0/lQNIgTFqM6ZpqHTl
         AOObvhk6bw+XXsbnTaPW65De3UTX7rm3hkeDCdq86ayPIMrDTIvZbiya//8CeVPK5m8p
         qALQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+2rt8OXGDN1vuKFarI4eERygstUcPLcvIRBvGVC+6Gjp4lQJYTpqTjN/2jwxOQSv/nan31sCgZY0Ezg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVJjxoI+SYZ+Y/452Q4xoQHax+KL0GmWMKtPmGtFlcaZBWKgeV
	HPbNiWuH1tf/rwa/kqBwaL30Yb0QaV+Ad0CoyWCSjKWgKxRYLEBOglFS8Jq+/RA=
X-Gm-Gg: ASbGncvY4p0ijyy+hsS7/LC0YInn93YmOYPaDRyG41yy+oDvryKahf6XAA2ixqzWB8N
	HfrRmf+N0MSipqPYFxMUtaUdTa6zhO6ZIe6cM3IxhGzULu61/ciNv05hCPidHwYxc+Sktq9OIsY
	VSYI44AnwerYXnbXAe6M1O5ZQqI0mK9Ix8oU9lIU4wDDf3lBIQEyWd+F8hzaLaK9+J/rmYOw/bq
	svVA2DJWyoKQkPFie9VmBEFI9tuVpKbLcM26789GR4YpqXExBRfo0NYGDzKAve3W2gwvMXvP22D
	16wKRRamaQqiSdF6IPiaBBVhN9EhRieMR3v+RB2Owl7f0J3wdXzJ
X-Google-Smtp-Source: AGHT+IFwqoWDn7YO/bjFq7nIBquQqHcFTa9mKO/aRiVcSKON9nOTdNqg5xXZEzC8DXFG8NATZDlxfA==
X-Received: by 2002:a05:6902:2089:b0:e5b:4a7b:c518 with SMTP id 3f1490d57ef6-e5b4a7bc795mr2727436276.1.1738949359866;
        Fri, 07 Feb 2025 09:29:19 -0800 (PST)
Received: from localhost (syn-076-182-020-124.res.spectrum.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b437d6841sm667699276.15.2025.02.07.09.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:29:18 -0800 (PST)
Date: Fri, 7 Feb 2025 12:29:17 -0500
From: Josef Bacik <josef@toxicpanda.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	Christian Heusel <christian@heusel.eu>,
	Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Joanne Koong <joannelkoong@gmail.com>,
	Matthew Wilcox <willy@infradead.org>, linux-mm <linux-mm@kvack.org>,
	Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for
 FUSE/Flatpak related applications since v6.13
Message-ID: <20250207172917.GA2072771@perftesting>
References: <2f681f48-00f5-4e09-8431-2b3dbfaa881e@heusel.eu>
 <CAJfpegtaTET+R7Tc1MozTQWmYfgsRp6Bzc=HKonO=Uq1h6Nzgw@mail.gmail.com>
 <9cd88643-daa8-4379-be0a-bd31de277658@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cd88643-daa8-4379-be0a-bd31de277658@suse.cz>

On Fri, Feb 07, 2025 at 05:49:34PM +0100, Vlastimil Babka wrote:
> On 2/7/25 10:34, Miklos Szeredi wrote:
> > [Adding Joanne, Willy and linux-mm].
> > 
> > 
> > On Thu, 6 Feb 2025 at 11:54, Christian Heusel <christian@heusel.eu> wrote:
> >>
> >> Hello everyone,
> >>
> >> we have recently received [a report][0] on the Arch Linux Gitlab about
> >> multiple users having system crashes when using Flatpak programs and
> >> related FUSE errors in their dmesg logs.
> >>
> >> We have subsequently bisected the issue within the mainline kernel tree
> >> to the following commit:
> >>
> >>     3eab9d7bc2f4 ("fuse: convert readahead to use folios")
> 
> I see that commit removes folio_put() from fuse_readpages_end(). Also it now
> uses readahead_folio() in fuse_readahead() which does folio_put(). So that's
> suspicious to me. It might be storing pointers to pages to ap->pages without
> pinning them with a refcount.
> 
> But I don't understand the code enough to know what's the proper fix. A
> probably stupid fix would be to use __readahead_folio() instead and keep the
> folio_put() in fuse_readpages_end().

Agreed, I'm also confused as to what the right thing is here.  It appears the
rules are "if the folio is locked, nobody messes with it", so it's not "correct"
to hold a reference on the folio while it's being read.  I don't love this way
of dealing with folios, but that seems to be the way it's always worked.

I went and looked at a few of the other file systems and we have NFS which holds
it's own reference to the folio while the IO is outstanding, which FUSE is most
similar to NFS so this would make sense to do.

Btrfs however doesn't do this, BUT we do set_folio_private (or whatever it's
called) so that keeps us from being reclaimed since we'll try to lock the folio
before we do the reclaim.

So perhaps that's the issue here?  We need to have a private on the folio + the
folio locked to make sure it doesn't get reclaimed while it's out being read?

I'm knee deep in other things, if we want a quick fix then I think your
suggestion is correct Vlastimil.  But I definitely want to know what Willy
expects to be the proper order of operations here, and if this is exactly what
we're supposed to be doing then something else is going wrong and we should try
to reproduce locally and figure out what's happening.  Thanks,

Josef
