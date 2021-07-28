Received: from mo1.intermailgate.com (mo1.intermailgate.com [91.203.103.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8531D72
	for <regressions@lists.linux.dev>; Wed, 28 Jul 2021 17:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mo1.intermailgate.com (Postfix) with ESMTP id 1C675205AE
	for <regressions@lists.linux.dev>; Wed, 28 Jul 2021 19:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bof.de; s=20180522;
	t=1627494733; bh=5bGJsXBGg9eBp/sF/Tf2AlcQl9aqIYuM09bV826wIM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PGh+DB1KU1Uye0aVVvDGYmrghtk81In9V38jygSNFeEikCJCgR1kEbJ0w+e5HJ3ZC
	 0bT/mDGj+7mmPchMbE1Pz8GVGnKTwUrpQoRHMaVzO87PI4lyoRk4vNJq6l5DvqsYNf
	 VYz1bMWfYICaSZ2lBO3tJbbt19sUx4N+4S99/54Q=
Received: from mail-lf1-f41.google.com (unknown [162.158.183.104])
	by mo1.intermailgate.com (Postfix) with ESMTPSA id 6DF9420437
	for <regressions@lists.linux.dev>; Wed, 28 Jul 2021 19:52:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bof.de; s=20180522;
	t=1627494732; bh=5bGJsXBGg9eBp/sF/Tf2AlcQl9aqIYuM09bV826wIM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e1Bo/6FDkVp0LCIzm/ItGzzpW+P34CidTjhlzF7UKUvU8Hfdzyzu6n5FT2ihmTTWf
	 rS3rZMHBi79oluXoo5BHXV35J3AWH1IdUKAOudNotbX+XjiImPMGrOzVTDIc8cGcD3
	 QJ57ISISus505TZtxp2Z/wte25LgflrmCO/1nTy4=
Received: by mail-lf1-f41.google.com with SMTP id d18so5515138lfb.6
        for <regressions@lists.linux.dev>; Wed, 28 Jul 2021 10:52:12 -0700 (PDT)
X-Gm-Message-State: AOAM532adqTZ+BpMuoBWvqyZH1I3HwfTGpHD1JhVCzL1DVWbRcATp3FU
	WzIZIQwyoxPVQHJl7bytteVGvrCfEr8IPdiicEA=
X-Google-Smtp-Source: ABdhPJzHXR0WEPz1Rv5D5/vceG3HPZ4Tj4qIJQ3a0lPbIIm3aJpP4AiiDT9WWuASR0AXdSPzkQza2NUEV7ZAB7sO4X8=
X-Received: by 2002:ac2:5e28:: with SMTP id o8mr517051lfg.209.1627494731965;
 Wed, 28 Jul 2021 10:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <61018d93.xsvXcO161PFLQFCX%bof@bof.de> <YQGXyiMb1IntqacG@kroah.com>
In-Reply-To: <YQGXyiMb1IntqacG@kroah.com>
From: Patrick Schaaf <bof@bof.de>
Date: Wed, 28 Jul 2021 19:51:59 +0200
X-Gmail-Original-Message-ID: <CAJ26g5Rtu+LwCctckwWUHTSidpav5_RHgx9o5T_ZLbBzsLLOKQ@mail.gmail.com>
Message-ID: <CAJ26g5Rtu+LwCctckwWUHTSidpav5_RHgx9o5T_ZLbBzsLLOKQ@mail.gmail.com>
Subject: Re: stable 5.4.135 REGRESSION / once-a-day WARNING: at kthread_is_per_cpu+0x1c/0x20
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Patrick Schaaf <bof@bof.de>, stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 28, 2021 at 7:45 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> > to roll out 5.4.135 on a few of the hosts, and encounter a rare "WARNING: CPU ... PID ... at kthread_is_per_cpu+0x1c/0x20" splat (see full dmesg below)
> >
> > Previous kernel I was running there, never seeing that, was 5.4.114
>
> Can you narrow this down to a specific commit using 'git bisect'?

Not set up for it, but can try - I normally build from .tar.xz's.
Given the WARNING seems to take a day to happen, it'll take a while to
bisect that by commits.

I'll try to revert that one 5.4.118 change in kernel/sched/fair.c, in parallel.

best regards
  Patrick
