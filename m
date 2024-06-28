Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B81C004C
	for <regressions@lists.linux.dev>; Fri, 28 Jun 2024 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719594657; cv=none; b=AhvKppv6FFhKqiKELNizGvZOFXULk9ZZv5B1E7ZgZVQFMQ90HQNB4Yjxiz/5YA8JBTaKZ9sxtruZqBaE/KvZ9egH4gosaHmkxxwRQa0AUunFdGYEZk53rWwmVh5mNOHj/TY9dD19QnQRubApMAqtBVVl/kX44KFmSZjYSwUsZVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719594657; c=relaxed/simple;
	bh=xtXeNQngp/V7Bfl150hMSYnxsrRSSnLRns2tFkU6FOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSAWAmSIQIsmJA8HFjNhHYMPu5K1VnKz17pmMTTzVRhw+H0+j4ri+xDpK+GZOev4txp20WnAyw3H0TLTgXJI23na4lDbMEvkRED9EtNIjh8SdbDjhxxKs03MoMi9blp2vQdBOkA8lw480Rm/s6XhnUC6/O87eYim3VKXRAg9h2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhkLc5hm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhkLc5hm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f9c2640730so273815ad.3
        for <regressions@lists.linux.dev>; Fri, 28 Jun 2024 10:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719594655; x=1720199455; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XIE4oI18UW9Qs08g0RebvTYQQUB6+ib0OH13RWotfFc=;
        b=bhkLc5hmYnJD7V46ZBfEEBioQAY13WmpswO7zqABiD0297H8Lq2n1/CPfq8+NWPJzM
         oHvz8RRCeMunJ5I9y4PiWcGv7pOD7YTZdMuWxLaU7AOR5dGJbJ386XBvLRDkFt9m48jX
         DR6LW2tOkD2h/xLUviFw3jw/z5C5ZIsOKvBUzUl9qGI+Ga/AvSheOU0IhPFEp/OnzMan
         RrXdrV1/N11W2yzOUX+YdtpaVI+mypZrcn4/LdPiJlI4OvgZ/6pJCYrLvIL2eri+rQ4L
         hKqs00Jx5pst1e0fIl3iLZ5lB1RG9WeQDDborKSkpBEEJ4pWplkmtxvEXfLdyJrnJng7
         acgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719594655; x=1720199455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIE4oI18UW9Qs08g0RebvTYQQUB6+ib0OH13RWotfFc=;
        b=UtFd2wDql/CuKr1tKFXyMpnzhInm/k2j8EJoiDkCG2gxE7XSau/jt6tiraE8yHRX9w
         LB19DVLLsmfPHpjol0UVWVxx4OSYDny1ToxdXjBvB2hiRCfwHdxHU25l6LTwCShSj9JO
         eafjbp2m4QG1bDzflEbDGXJuN/krEgA2PYxXFQmWcMpfsuMIVxL/C3ehhRZb3MKbBHRs
         foRLwIEKeRp3HzkEs1m+nwAmc4hbkJRd/K3OZP8EpLZkLL1VvwKY1FVNTTjFoT4VUYjX
         JOyNeopkCxzqFOyRd0sc6MGL9lim8FpkqPw5YN6WofoRiO7UmbQagEE2WavmD97v5ezQ
         JrUw==
X-Gm-Message-State: AOJu0Yyc86u1YOQ0LTS4dI/A/9j/Mk5nkilDKTD/Ogx9XeLOsatGv/6V
	wPgOCzuGmUzfFyPX3ev7MNAzdivDfTk3M4o+U05kvpML4tbzDyLb0HTErw==
X-Google-Smtp-Source: AGHT+IFXDOCem1AfUDk+Yi7hzf391j0vfuZ9i9eMeQW8K+gnUyE5FmEGrvnKr1r0P2NvoJ0PDchhcw==
X-Received: by 2002:a17:903:32d0:b0:1f6:d81e:cf3 with SMTP id d9443c01a7336-1fa0d70d342mr205348785ad.1.1719594654470;
        Fri, 28 Jun 2024 10:10:54 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1535b5fsm17786225ad.174.2024.06.28.10.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 10:10:53 -0700 (PDT)
Date: Sat, 29 Jun 2024 01:10:50 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: akpm@linux-foundation.org, jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org, lkml@sdf.org, alexdeucher@gmail.com,
	Julian Sikorski <belegdol@gmail.com>
Subject: Re: [PATCH 2/2] lib/sort: Optimize heapsort with double-pop variation
Message-ID: <Zn7umr/VHtZ/Nhcu@visitorckw-System-Product-Name>
References: <20240113031352.2395118-3-visitorckw@gmail.com>
 <70674dc7-5586-4183-8953-8095567e73df@gmail.com>
 <61f43bdd-7f73-4605-96e7-843483a53bca@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61f43bdd-7f73-4605-96e7-843483a53bca@leemhuis.info>

On Fri, Jun 28, 2024 at 05:15:15PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 20.06.24 17:36, Julian Sikorski wrote:
> > 
> > it appears that this patch has caused suspend-to-idle regression:
> > 
> > https://gitlab.freedesktop.org/drm/amd/-/issues/3436
> > 
> > In brief, my laptop fails to suspend completely with the following error
> > in the log:
> > 
> > Jun 18 12:42:20 kernel: amd_pmc AMDI0005:00: Last suspend didn't reach
> > deepest state
> > 
> > Power consumption remains high enough that my battery has already
> > unexpectedly drained twice before I noticed something was off.
> > I am not entirely sure how changes to sorting function can influence
> > suspend, but it is what it is. 6.9.5 as shipped by Fedora 40 exhibits
> > the issue, 6.9.5 as shipped by Fedora with the patch reverted does not.
> 
> Andrew, could you maybe help out here or point us in the direction of
> somewhat that might be able to help? I'm asking, as from a quick search
> on lore it seems Kuan-Wei Chiu has not posted anything since nearly four
> weeks and thus also did not reply to Julian's regression report.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke

Sorry for the late reply.

I apologize for the regression caused by the patch. I am not familiar
with the power management domain. I would guess there might be some
side effects in the compare or swap functions that I was not aware of.

While reviewing the sort calls that could potentially cause the error,
I noticed that the compare function used in the sort call within
drivers/acpi/processor_idle.c might not satisfy the transitive
relation. Although I'm not sure if this is the root cause of the
problem, specifically, if there are two valid acpi_processor_cx
elements A and B, and an invalid element C, there could be a scenario
where A < B but simultaneously A = C and B = C. However, if I
understand correctly, this issue should have existed before this patch
but might not have been triggered previously. My patch might have
exposed this issue by changing the order of comparisons and swaps.

Regards,
Kuan-Wei
