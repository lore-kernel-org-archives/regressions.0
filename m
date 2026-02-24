Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3704E279346
	for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771916759; cv=pass; b=elbigWkca5svKpyz3Xv4qTtmCn8T4DnrSWTQl+0QWw3tClmnlmuDYRLy8n8wmhKSf0DEAAtzjGPjKaZGcgjUDsl7saSrJJg5sEfYINjij7FCuSv7lIzGwgpUMsXp/LiUinX2s5JVhPI9jV5BEa9H1t9KAYbv3nMeC8RtNc9QLdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771916759; c=relaxed/simple;
	bh=W/oTXro1YXhmybSFyR2RhCuOX+slA3JE6hCX+t4KmPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umX/dnYVQUjildHOqsxTZ40ubDdHqscGJy3lbcQwgaTAhdBPSbKPqCNEv8Ro/GMZGoyK5oSnevJtkJu5ABg9ybG3Oy5VfZQ/vlSkzWGyDUakLW5ZCJhojRfKS2s+MVBcScTLzdy8yWDcCjOhfEUuFqmYY7lb/FvVX4bGGBNVLH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W12GvefZ; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W12GvefZ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-896f632d206so61832526d6.0
        for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 23:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771916757; cv=none;
        d=google.com; s=arc-20240605;
        b=gxPVxAXJZbKWQ201UyvdJ0ByCSIsOTLhI4d6BwhzcCzAHCO+yBvjpacAVj/wLNwU8B
         WMLBy1z8wxk2D4cHRi7vskXVq74JhLpFzcyVKpFMdvukm5M4agEx+tJMR+tl1ZEOxlQc
         t1x/OgDpsw49rXGgrM5blOCKd+SyCG5ru2tTnFbFa5LovrPAlPzpMewCA/YaqGgF/8MB
         XcNgTYhodtoQPIgRj7rsDRaqh6HGyXBvgw+R8trENcLde48+rIOAggSYV1Q32RoyGQH0
         zVhIz03NssS1GO3WD6oliQ8lJBTjN3Hh6y8FHkn1Y9TmoER15kW+VHgyyEvvSAhDMI8o
         TH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W/oTXro1YXhmybSFyR2RhCuOX+slA3JE6hCX+t4KmPA=;
        fh=1uAhEBXK4aTNNICJ6rowiZg/elsf0dakXK19P0PJgsc=;
        b=IpKDNir371O28lOIOWK/lp5/Whfz5O3ood1Ua0iBiVenC5yDxsSJa7o3x0L5Vu9GZg
         nZ038ogBNTct3ptWeACUg+EdLtmMRxzFkU4Hfphc8ArHrGm8NXwmmf0G00aSRZL96I8C
         3QP+CbIWluoELqG+DAOww5mKJhuY1xYogXmOym3ig37b+baUFn0HWG00pk0YXUxBTUQM
         cn9DHMtmlG93DjvE0gBEqXgQ2pKJ/1FO1IFrlWxkmuHCJSEJLNdRDPdXScWx6ACdbYbW
         mFFcbMaBDKPI6muYnDwwcBLwB09QfUUAGGFrf0yVydT3isiXj7JBixrVTcr2E0H3yHkl
         rGzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771916757; x=1772521557; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/oTXro1YXhmybSFyR2RhCuOX+slA3JE6hCX+t4KmPA=;
        b=W12GvefZkGbnmFOt1Dz04HVwTUiS8ZuTb5rDxDaM7M+a6utGxbdYbWpsecWY8g8Qq0
         5znOsY2nkkTomrNNjQNIc3ukEhB8TQCf+KtjAG+9QnS7oNCISZ76+RFsIIuVZK9v/65o
         gn9DKEJcOLoDW/e5aJrdQwu6qz3chTjErwEFf0ddPqrqFTz2ANENQWFWkonHrk3OgwY0
         RlWzxdOLJ9cyuprNUHKF5xUeD1hCnUg1ZulhLClL50+fjFtBB78HNZtisYkcS5kXmT+K
         mn2bX0kAB47CkchUMEkjLzhlnMUJqgRMwE42NvhtGoSlHWVcV0AujP9TE8GIbR+2GP2q
         H1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771916757; x=1772521557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W/oTXro1YXhmybSFyR2RhCuOX+slA3JE6hCX+t4KmPA=;
        b=SdVat6eTFGr5lTJFRREMs1yaflSIDQDV7HlYs20rFreye6xxL7z7kEdDnbIYv2pJjz
         ewgFH1p3FJ6rfz+drHvXr99EX0KXrVcmp+eN1gU3rCeF6hL+iCkGK5p9beGGqIwA84WT
         +8AOECLF9Pqfe65IFRhk5PXhEYSeyE5tFI/U6rP1PRlrWSqmw7w+vTJkWWoCiQLkKpxz
         O2phmUQfgBSz792fkmcf5g7nPoRgGazV3KAI/HpYfxOPRNmt2xnQ8ABuvCdwOOa1w3OV
         mzt0AZ9z0f8cp5awTROVU8teVZ65TvTk1W79AlYCGygvmY4WyshZk0ZiBA36+/cXG1fh
         rknQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZzWTW31cg2ZTX9qNhq8Bti0hdViM0GpnTbJY0xXTskCiNnri9aVOerVoNkwPVXoEU3jya4MXtdykOZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIQ5t9swhvwxOcGwSqfItUcXYkiqCqgj7sN7EBbmcXQwVsuZd1
	yKC4+GjjVtFAkMjZpoTXwb/nk8Q1l8UBS8jupecLeYP7CwqxoIfFOPXu4mU28ySgqwr1Tad9Zz3
	xUKeAvIavj6sgc5/8y5NsDOUILLgzRQ0=
X-Gm-Gg: ATEYQzybV1AHjagDTLuT+m4LczNmclSMoeqKpA0RFKW65U3T7BBpm6Tr1ffPhuYg3kS
	7dlQz0A47lBnetTpRf5sD/k9lmVimSt5U+8lo4IDmlOinhavjAuOir3+qtx5I+apb237etYd5dd
	nxkX3jlJPev89QdzXnOrRzRC8r3yspMinjyWwIZ4F5FHFaC2EPg1Je+Q46/8ZBFXFEJ8+f+zgVH
	VGVnH/wSu4snrW/TJUYRi5uChpuu+YEi5WCe9Eh8HWpqJFyG2BDVmpm0oDnf0bbph1zV4A2TAcN
	zbxGm265iluyRfSGdQ78WiVHvTcJT+kBy0u3R4gqZprAI04G2fGjHaF0RQRW61upiuA=
X-Received: by 2002:a05:6214:1bcf:b0:88a:31e5:80fa with SMTP id
 6a1803df08f44-89965b0dc7cmr242060706d6.16.1771916757086; Mon, 23 Feb 2026
 23:05:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
 <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info> <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
In-Reply-To: <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 24 Feb 2026 17:05:45 +1000
X-Gm-Features: AaiRm51R70KjFTh7wa8zEsBJxwdqC6EDhAe99m3KuEjog0yTvukpXbhfeIOKYr8
Message-ID: <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
Subject: Re: Time from regression report to a merge of a fix (was Re: [git
 pull] drm fixes for 7.0-rc1)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Imre Deak <imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Feb 2026 at 16:50, Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 23 Feb 2026 at 22:52, Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > Lo!
> >
> > On 2/20/26 21:53, Dave Airlie wrote:
> > >
> > > This is the fixes and cleanups for the end of the merge window, it's
> > > nearly all amdgpu, with some amdkfd, then a pagemap core fix, i915/xe
> > > display fixes, and some xe driver fixes. Nothing seems out of the
> > > ordinary, except amdgpu is a little more volume than usual.
> > >
> > > Let me know if there are any issues,
> >
> > Well, there were two fixes in here that made me wonder if our processes
> > need some optimization to get regressions fixed at least somewhat as
> > fast as Linus wants them to be fixed[1]:
> >
> > * One fix in here was for a amdgpu regression introduced in v6.19-rc6
> > (and also affecting many stable series due to backports). The fix was
> > ready within ~2 days and could even have made v6.19 -- but it only
> > reached mainline through this PR on Friday. IOW: After two weeks. Which
> > got me wondering, "Should we do something to merge fixes like that
> > faster"? And yes, it's the merge window =E2=80=93 but that's also when =
Arch
> > Linux and openSUSE Tumbleweed usually jump to the latest mainline serie=
s
> > and thus expose regressions like this to many users, so I guess it woul=
d
> > be good to get them fixed at least as fast as outside of merge windows.

I think due to the patch pipeline depth and volume that amdgpu and
i915/xe are dealing with we may need to consider some better
regression revert pipelines,

The problem is most patches get fed into the start of their -next
pipelines, where CI etc picks up on them, but there isn't enough
urgency to create separate trees or pulls outside the regular fixes
ones.

The amdgpu one definitely should have been fixed in 6.19, Alex any
idea how we can alleviate that sort of problem, esp if a bug has
multiple regression reports.

> >
> > * One fix in here was for a i915/xe regression introduced in v6.18-rc1.
> > Once reported, it took about six weeks to get fixed =E2=80=93 and then =
nearly 10
> > days for the fix to reach mainline. Looking at this, I once more
> > wondered if this could have been merged faster. But even more I wondere=
d
> > why the culprit wasn't reverted, as that's what Linus afaics wants when
> > it takes this long.

I think for the i915 one the problem patch should have been reverted
asap, but I just don't think there was a responsible person to do it,
maintainers need to be in the loop for these sort of problems, but if
they aren't in the loop and the regression sits in the bug tracker
without them being looped on it, we rely on the reporter or developer
to find it and do the right thing. Esp when developers are head down
on fixing it, but then it doesn't get flagged as urgent once it goes
into the -next pipeline and so on. We don't usually break the weekly
fixes cycles for drm, because CI backlogs and other things it just
fits nicely, if we do have regressions like this it might be that we
need to start having urgent PRs out of cycle, which I don't object to,
it's just a matter of whether maintainers can have this sort of
insight into patches in the pipeline when there is quite a long
backlog.

Thanks for the detailed analysis, I've cc'ed some more Intel people.

Dave.
