Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA1A14D2B5
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724266956; cv=none; b=h+zi5ghi1AGzuxrtpmVlBeEIx6skULmrrrNjrQDQ38OAAGbeK5J8oGsVuQuvpoyAvbRLkKYuP8KdEKoasIrGI2XHJ7r+JXtFkoX1NdyEPeTnJd4wYzN0zGtI/Hmf9Xyhf/YfEasY5kPV3hZ3BZs5Bq1oZzHEYizTimoEAUZMeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724266956; c=relaxed/simple;
	bh=1ahm9esPITVeZ0QIpZcT8JjHfRFyH7cLMPiUbwzxhbM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCnVL8ss9eA8Ksl7LGOZQlpOHP0euZvalnQ44HrT5QnHoNWfvQSEBuwKVH6hrURXgPy435TDQdlVsHijpUJVDmQckMnpoO1G8ePb2nfXa3h5Uddl+j1SKTD6epXPUBp8HGIkMYDZxWdRi2ZZtJUsn9tPlfSW3RX4mFNas+ulkJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fSneaFwG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fSneaFwG"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ef9714673so8317e87.0
        for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 12:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724266951; x=1724871751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTk2wQSGpS2A9NuKFMEhj1HJguytFPmwi5TTNL6/m+0=;
        b=fSneaFwGruJt/2P1C+R+07f2CDJijdWMFdN/2M+xSU6Oe09DzMxnIACpl8cB/nyv4v
         TqfbKAZzryq2prvqpiHsz+GfdDHrA5GVLAtEP64TFD0dPGGteIYsjPhhIEuBAgfpH94b
         tOVPhdu/1ODKlEyf/fUrt37GdP9N0EqGPsLc8N0LXR4BcPuDQefNzrnNhM6VdQBPUXqQ
         iMUnAJZ/QaW5aou7YWShsis1hEr9KL6/3wBD9b5MIdYoAEaRDMIhLl9YFCpU6Zajy1Ly
         G2Dl1ioI1I8ZBK9luE6bxZzHqNAVFzlNDvvJZjXaNfrNvjPGfJGTF6PsmPmIn/wLAtKo
         pALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724266951; x=1724871751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sTk2wQSGpS2A9NuKFMEhj1HJguytFPmwi5TTNL6/m+0=;
        b=IJHIG8bxYR+dggXBaRMd/n23OeUp4SgPXoZ2GRRQ3o9EU4pfp7zzZ+AI2M716ufn9t
         dtqyKHS1iOyqL81zVSZ1l0vMjRhfsgvWgwhEvr/BgXTEn+uuKiytj4o7/7MUEKG6atSB
         b7a8uq60O1ZcpwJ3YGX0RDYiFBIe2Aa0UXgZgnGgRZoswlGcowZRvUJkilUeA2Y/+2a1
         lRZBqbfH69CNupiF5D67Op9GaTqOqZBXvawduukOWt2/90a9COHHiJEFWHFQwUlX5UOd
         dt4Mv5mnfd/ZKvqf1H0VUJzjYotfoWo205zGj7RLDtScYKyKsMy0ckTnYKTZEMsj7Sbz
         hMAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs4IIpXP2jqHczqDLoousSZ/M86SYWCNEyEdXrMV1lDwNwZsRstT8Q0nblYqQcLs3k0H0DDwW/e2qHbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYoQJMonxzUP0F5qxXRGowy+zMkLrx69UMDVDaF99AgfsX7J/6
	NBAvHWu9PJ8gzemOutCrhVIvAUc7vDBNcU5oYJhH1uQTOEi/3T/ZjRhJwRBiNGE=
X-Google-Smtp-Source: AGHT+IEKangxSdv8RKVt8xT7NwbFnlr1CTlLF5FaXGHO4SmBkB8s3awJT4QE1Buowd2DfM8UOn033w==
X-Received: by 2002:a05:6512:114d:b0:52f:e5:3765 with SMTP id 2adb3069b0e04-53348593647mr1102285e87.6.1724266950793;
        Wed, 21 Aug 2024 12:02:30 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868c23e1basm11382566b.204.2024.08.21.12.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 12:02:30 -0700 (PDT)
Date: Wed, 21 Aug 2024 21:02:26 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>, regressions@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Bagas Sanjaya
 <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] docs: bug-bisect: rewrite to better match the other
 bisecting text
Message-ID: <20240821210226.25862313@mordecai>
In-Reply-To: <e6681b51-297e-4ef8-a199-d36712088740@leemhuis.info>
References: <fbeae4056ae8174f454c3865bc45633281bb1b31.1723997526.git.linux@leemhuis.info>
	<20240820140751.0e024f21@mordecai>
	<e6681b51-297e-4ef8-a199-d36712088740@leemhuis.info>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Aug 2024 19:16:25 +0200
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> On 20.08.24 14:07, Petr Tesarik wrote:
> > On Sun, 18 Aug 2024 18:12:13 +0200
> > Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >  
> >> Rewrite the short document on bisecting kernel bugs. The new text
> >> improves .config handling, brings a mention of 'git skip', and explains  
> > Nitpick: git bisect skip  
> 
> Ohh, one of those cases where one misses the most obvious mistakes. Thx
> for pointing this out!
> 
> Also: many thx for your feedback in general, performed a most of the
> changes you suggested (thx again), only replying to a few other bits.
> 
>  
> > But it's still difficult to parse for me. Maybe it would be better to
> > reorder the sentence like this:
> > 
> >   After issuing one of these commands, if Git checks out another
> >   bisection point and prints something like 'Bisecting: 675 revisions
> >   left to test affter this (roughly 10 steps)', then go back to step 1.  
> 
> Chose to do it slightly different:
> 
>    After issuing one of these two commands, Git will usually check out another
>    bisection point and print something like 'Bisecting: 675 revisions left to
>    test after this (roughly 10 steps)'. In that case go back to step 1. 

That's just as good for me. Keep your wording.

> >> +  Git might reject this, for example when the bisection landed on a merge
> >> +  commit. In that case, abandon the attempt. Do the same, if Git fails to revert
> >> +  the culprit on its own because later changes depend on it -- at least unless
> >> +  you bisected using a stable or longterm kernel series, in which case you want
> >> +  to retry using the latest code from that series.  
> > 
> > Admittedly, this paragraph left me a bit confused. So, what is your
> > suggestion if I bisected using a stable or longterm kernel series (BTW
> > shouldn't we use Git-speak and call it a branch?)  
> 
> Not having a strong opinion here, but I'd say "series" is the better word
> here; but maybe "using" should go (see below).

Good point. I don't have a strong opinion either, so let's go with
"series".

> 
> > and Git fails to
> > revert the commit because some later changes depend on the commit?
> > Are you trying to say I should check out the current head of that
> > stable or longterm branch and retry the revert there?  
> 
> Yeah. Changed the text slightly; does it make things better?
>  
>   Git might reject this, for example when the bisection landed on a merge
>   commit. In that case, abandon the attempt. Do the same, if Git fails to revert
>   the culprit on its own because later changes depend on it -- at least unless
>   you bisected a stable or longterm kernel series, in which case you want to
>   check out its latest codebase and try a revert there.

Yes, this makes it crystal clear what I am supposed to do.

> > Overall, it all looks good to me.
> > Thank you very much for your effort!  
> 
> Thx for saying that, the time your spend, and your feedback, 
> much appreciated!

No problem. It's you who has done the hard work.

Petr T
