Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345961870
	for <regressions@lists.linux.dev>; Fri, 10 May 2024 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715329991; cv=none; b=VJdjgqkfsYFfNoDtr9nyeD7soJ+q6AW0lOMjL8LpqqY1zwXoRNe5JkLSGsLLJCVo/K8AEC3oKl2U4MXhqtjw73utOxu523WQyd9KnEmo/SfrNAGmbQLWxuwqUXeyetj6B58GY/qHnCW3Jtp0D2aGi7jSRfgKxQwS1sEq39+kGic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715329991; c=relaxed/simple;
	bh=6Pf/x2zCrKY7gYZEuAi9RB8xsjV3BjQRcngR9f+xYb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ZEQ5HqOqeBlS3pRZJJYO+j/XTrrfZXAG5XUjqWmCEboy/2+Wy38CW4nvoYC2QpSJtnlPfg78PrOC9IOlQvmYq1zwJWMj+LftOV/OrirVBxeIjILgLeCHq3VrS0vgoeZA1eT5PTRL75pcZ7ngo6MSiApFId1jhio5yc1IXPIa57Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRwcu644; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRwcu644"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61df903aa05so17967227b3.3
        for <regressions@lists.linux.dev>; Fri, 10 May 2024 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715329989; x=1715934789; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Pf/x2zCrKY7gYZEuAi9RB8xsjV3BjQRcngR9f+xYb4=;
        b=JRwcu644NI97EZTGs6jVxz34YEEvU+BnBdZV/O5crDAZivA2yp0hFDgczR262LdN/A
         4SV+q32ETs0mMfA22Y8QzlkrJ1IFDlTO0ZlqJLc/gYUaR3xtgPVeQFEu7ROeyh94RrbS
         XfTjy969/eUdz0ZBMCE6wDoA7U0NAMAMMpJ25xwUSCupZKpC8e/rzAsPuV610TamZ72i
         iqHvdY7wqiNYbuQIysZpald4oh1mwD0l9I+KrvCn1wgI9BgtkonRfUT7t3wfRf4LaqpG
         21dro+I1BWfERabcSbMFWLo9McoXiHPLc7jHSZ9TfwtK0j5pteeVL3z6kCG1YKKeA8W1
         w2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715329989; x=1715934789;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pf/x2zCrKY7gYZEuAi9RB8xsjV3BjQRcngR9f+xYb4=;
        b=KoVMFba1YL704pIx/KU9IJoR19Z87B+SX6Hp33YX1vdiHrsmz98KyZoPw7sLEh0jgI
         xaHqMDXznblZWfolq41WlierUUkCNqVIiwgFgOWuqxRMOsuOrlJXi/ajzbtnlJ7ZhXR3
         Z856cgRHBM3drs1xjzeRQLyWm+ThoDkEEbKWW/HyPu5Xl/nOKkCHPaB0b/SsmOjy1WN0
         eWoelugVkaZfWskOrUcomZhLXJzabOEFg0+sWfJ2ggZQFGbejyxVJp6U0dQzcxWjtaPq
         ZEKTw3bfc8rBFXfR8iQoxq/OLIPdCH7nxjDDPxnQmZkxKYoijpyEy59V+r7IATEcKP+y
         cgpg==
X-Gm-Message-State: AOJu0Yy0Q5D59cAjiRLUuT/v2btszSvWRnEQfF42NgyHXo0IS8rG4qVu
	i+pZ1Uwy6hZRwE4ojfgT3rjFYnPFexRCprRcG3wrQKCm1r0XwlHn+/6WaeHpwFvKcr6Ejt5/YHX
	8yn8VX9h38ASMgVeAktU1Z5lMUT++dgpO
X-Google-Smtp-Source: AGHT+IG5HeYxxmJw6naZTo7LfqZkDlkhpxGT+OJJYJbi25/K9mqCE22rXdA+7rfCWqcGwIG0V6aTOUMshepUSavMKmE=
X-Received: by 2002:a81:ec09:0:b0:61a:d455:3dc6 with SMTP id
 00721157ae682-622aff7ead4mr22948817b3.11.1715329989080; Fri, 10 May 2024
 01:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAP-bSRa0ADA_wpkAVXJw60O8f=cxXVWuxwxfFBFE1y==jDSuZA@mail.gmail.com>
 <155168f6-f226-4052-942d-40f1249cb339@leemhuis.info>
In-Reply-To: <155168f6-f226-4052-942d-40f1249cb339@leemhuis.info>
From: Chris Bainbridge <chris.bainbridge@gmail.com>
Date: Fri, 10 May 2024 09:32:58 +0100
Message-ID: <CAP-bSRbKzkWe+AGsugNcw98bkyJixACRGf6fVNqRHqw01=gr1Q@mail.gmail.com>
Subject: Re: [REGRESSION] amdgpu: Unplug dock while suspended results in
 dcn21_link_encoder_acquire_phy crash on resume, *ERROR* dpcd write failed to
 set fec_ready
To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 May 2024 at 06:08, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 10.05.24 01:28, Chris Bainbridge wrote:
> > Details on AMD bugtracker https://gitlab.freedesktop.org/drm/amd/-/issues/3345
> >
> > #regzbot introduced: ec5fa9fcdeca69edf7dab5ca3b2e0ceb1c08fe9a
> > #regzbot monitor: https://gitlab.freedesktop.org/drm/amd/-/issues/3345
>
> Thx.
>
> It's likely unrelated, so just for the record: there was a earlier
> regression bisected to that commit; see the links in:
> https://lore.kernel.org/all/20231205195436.16081-1-mario.limonciello@amd.com/
>
> In the end there a firmware update of the dock seems to have helped:
> https://lore.kernel.org/all/5c7abd99-b4bb-4573-b2d5-2708c6ab2644@amd.com/
>
> Ciao, Thorsten
>
> P.S:
>
> #regzbot unmonitor: https://gitlab.freedesktop.org/drm/amd/-/issues/3345
> #regzbot duplicate: https://gitlab.freedesktop.org/drm/amd/-/issues/3345
>
> [note, regzbot support to track gitlab tickets is relative new and still
> in a kind of testing phase]

Thanks for the info. My dock already has the latest available
firmware, so the decision to close the bug report and not revert or
fix the issue in the kernel means this is still a regression for my
hardware.
