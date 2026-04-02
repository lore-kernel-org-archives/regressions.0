Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619AD3CB2D0
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775156527; cv=none; b=ittKpG7HblFhhGde5TD6EpX4+tKBAtnlXBtMLtUwbRTB0rFjRoELx0Yd9UHZya9g/6hDCQMgdXmuSBzSNoLaBG3sTzzaG6NSd+MZg9hqY83MBLVdh7frtsa+V84hkrjdc2DIAP7r/eWkKVjKrgnT96XPQJw5c7Fc10e+ZV+c6r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775156527; c=relaxed/simple;
	bh=U9z6eCeNaklGoGFqr3cG8Q6RYZwYE9t/g9N0qHgEh3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdIeIjqxCFG1G/ShBDrQ/A6jo42oZWaFwxOqgqXRp+Uz+3f+9f/dDpkfUM9Yf7cPDXgTRCk47v/EYrvRR/zMBKNPT6S7G1vKWJIxcVWUgT8PKdrpQayAhlaxMn/zV71NET5N2mwwQe/9O1yd2mhxWVfk78HTKPfHF5SPjMo/VNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y+sbTl9B; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y+sbTl9B"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66ad907833dso2237378a12.3
        for <regressions@lists.linux.dev>; Thu, 02 Apr 2026 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1775156522; x=1775761322; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ePUNrbdwnW/6ontZGK8TOL9te6Vsn2aDppf76uZ2K98=;
        b=Y+sbTl9B6YjeZvrkGOltVX++1GJmJCYEG5Q5IBggKgwz82itMrb9m1B59SUEZRNfbz
         JIrVl72E372onpA51IvDtQK1o7Ar38jFhXNbW6NdSapeSjIGmmnpRd0xIvSL+8/8WONz
         aiybvQKZhLdsxSqnthsHekFVnPx7p83tHmCNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775156522; x=1775761322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePUNrbdwnW/6ontZGK8TOL9te6Vsn2aDppf76uZ2K98=;
        b=CPSryg6FyT1iWfju+xCOQsI6Efi+ffm2mkoGmnk2b0mhGFNSnB4NEv30wVuh5X81lJ
         g2hvm0w8PqmiCu4nynV8PnxwCn5jLx/PQSu9UJsZH4UzoewVFVSis7ZPyxym1soW/ojy
         cN+8TfleByQDCfiBcuTSq6ypMPLodDJrsGPkWdFVrAlGfJKAHefQVK//t9/T/+qFz+5W
         QjuqLfTqIMBK+kVqlHgU8cpevRMlPtl1YRwmxZGUFuhRn3MwUSb022ss4GLfBq8/zNfj
         90W8qzCADBaJoSRjjqxFJVpGGJy9AKj5vr5j1nCJmJBXfTbam1Odx3gjlo5PeVXPZb0O
         ql6A==
X-Forwarded-Encrypted: i=1; AJvYcCWR9wapeU2CBjypXwW+rkUj01Y72pNaLAnt0qENPzl8XRg76NEsuH0muzbtAxqhVqPgzM+quSwqn97bpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7EGPOdTql4xfnmoaqK/UKQ416n4vxTCFRFdDBF3NaKMsA3QIl
	ia4/xDYtVpoJoMvjI5EkOFFIIXG5Y/3eWP65zxzlzNt0+R0hAciiHsFuExFAaRpkTL9Wm1wdREC
	WTqjcmmA=
X-Gm-Gg: AeBDievOiqZV3zVmitwZ5+g5TXWlxqrnTJtBmaWWqhopEEy2N9kl++u7GSB4RjBdpM7
	PDztpHM+YUNbomJZPqL5sch9tUlq3dy1n7uEmWZzQUtKngo+gN9/03ZCYlhXSqj5anS6264ywBV
	VH9mZ1zlk8DjgHLloknPVB2BOvaL5dmIgk/7Kxrc+4bJdktCNimD4vNp2mqj+pQ6DU21YyDanu5
	iLEJjxruK6aPOmsEbZAenhuO0MOhdrcuUOZ0m6w7lhJSsUKEAsw9fZ8tlXMyO6bHlRQLrYYSHRN
	QG4gF1FzWj1Y1mihZnCy8F+LBfgucLfRSab9oqMBBuNZIEt5E1yayuNalnElSz1rt2qWumO40Px
	nw3qSARSX40joKsYZCkMRf2CSFdrZ9D6G+uvBvH0VUij5S3sftXNO+1jBPSKKGPfbbHbitXOBZo
	nPBRLL77s8CjkRWYWJOlC8m6nde0xRvju0sQmFec8L8yenAMMDvJW0K7yJxXn8i4lMF+mVzEVs
X-Received: by 2002:a05:6402:4345:b0:66b:3dec:e8d5 with SMTP id 4fb4d7f45d1cf-66e3f3bf4d0mr131548a12.2.1775156522340;
        Thu, 02 Apr 2026 12:02:02 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e1bfc789csm628169a12.6.2026.04.02.12.02.01
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 12:02:01 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66e36d12a00so613134a12.1
        for <regressions@lists.linux.dev>; Thu, 02 Apr 2026 12:02:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNp7QTn8tVPy8YVJjQok1dKrXJIvBqZE74MKo8XDUvpfxUoEgyW6BfWUEKMXiLeJn1krwbztYMkbEJCQ==@lists.linux.dev
X-Received: by 2002:a05:6402:5d3:b0:66d:f536:a63d with SMTP id
 4fb4d7f45d1cf-66e3f3bf8e4mr130709a12.4.1775156521322; Thu, 02 Apr 2026
 12:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401184456.3576660-1-alexander.deucher@amd.com>
 <47c508c3-3424-4e8a-a63c-1f29d13b6ebe@leemhuis.info> <CADnq5_MiFOYLP9aUnYw4HFb-xWLZdq245ZB3e6iGn09ywOsY2w@mail.gmail.com>
In-Reply-To: <CADnq5_MiFOYLP9aUnYw4HFb-xWLZdq245ZB3e6iGn09ywOsY2w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 2 Apr 2026 12:01:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiNdTNNxzRuxXYq1Ebpiv6YF4UMZApoQGnktbMjKFYP+w@mail.gmail.com>
X-Gm-Features: AQROBzAMZbuTN23P8TkIKiMVHa1tHl57TLivKQV-jC6Njhuyf6GRrqJ_sBY0N3w
Message-ID: <CAHk-=wiNdTNNxzRuxXYq1Ebpiv6YF4UMZApoQGnktbMjKFYP+w@mail.gmail.com>
Subject: Re: Regression fix for audio issues with pre-DCN401 chips (was: Re:
 [pull] amdgpu, amdkfd drm-next-7.1)
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Alex Deucher <alexander.deucher@amd.com>, 
	amd-gfx@lists.freedesktop.org, airlied@gmail.com, simona.vetter@ffwll.ch, 
	Linux kernel regressions list <regressions@lists.linux.dev>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 2 Apr 2026 at 11:27, Alex Deucher <alexdeucher@gmail.com> wrote:
>
> There are always new fixes.  Worse case it ends up in 7.0.1.  If it
> causes other regressions, then we end up introducing a new regression
> in rc7.

This was a regression in rc1, that was reported several weeks ago.
Anything that gets reported that early in the release cycle is bound
to hit lots of people, because the number of people testing early rc
kernels is relatively small.

So why pointlessly delay *known* regressions for fear of a potential new one?

And why point out rc7, when dammit, this could have been fixed long
before and *not* be that late in the release?

The bug was reported a month ago. The patch was posted  ten days ago.

It could have been in rc6 and gotten a bit more testing, but was
delayed for unknown reasons, and now the argument is that we should
avoid the testing in rc7 and just put it in a stable release instead?

What's the advantage of releasing 7.0 with a known problem, and delay
any potential reports of whatever new regressions in 7.0.1 instead?

What is the logic here? Really?

As you say, there are always new fixes. But how exactly does that
change anything?

The fact that there will be new fixes just means that delaying known
fixes will only result in all those fixes just piling up.

Or worse yet, all those known *problems* piling up, where known
problems may then end up hiding even more problems that people don't
even see because they hit the first issue.

So what is the point? Why are things delayed?

The whole reason we have rc release candidates is (a) finding bugs and
(b) GETTING THEM FIXED BEFORE THE ACTUAL RELEASE.

What did you think a "release candidate" was all about if that's not
your reading of the issue?

And if fixes look too scary or uncertain, we *revert* the change that
caused a regression. We don't go "fixing it is too scary".

And yes, we have more timely releases than pretty much any other
software project has, and that is partly exactly so that things don't
build up over time.

We don't want new features to build up over time - long long ago we
had long release cycles that then dragged out even *more* because
there just was too many changes and they all had issues that needed
fixing.

But we also don't want the known problems to build up over time.

One of the points of of "release early, release often" is to find bugs
quickly - and then *fix* them quickly so that we can leave the issue
behind instead of letting it fester and cause longer-term issues.

This "drag your feet because there will always be other fixes" makes
absolutely no sense to me, and it's not how we work.

So  honestly, there are exactly two choices: apply the fix, or just
revert the commit that caused the problem in the first place.

Because no, "let's just have a known regression" is not how we roll.

            Linus
