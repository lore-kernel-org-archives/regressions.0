Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2D1A22
	for <regressions@lists.linux.dev>; Sat,  9 Apr 2022 16:28:36 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id n6so22798293ejc.13
        for <regressions@lists.linux.dev>; Sat, 09 Apr 2022 09:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X8ihlJGLhQulzBr/Bw9/Kc42S0CR8w0u1LhcgfZff4w=;
        b=Rp5rWZgYKg3NYBOapq+5W42sOwe5sZwVG6LIf5HaeCPInbvjU0qENaMOcWl2u7Yioz
         2CAkBusW1Tlk7lvxsin8/3fPhtBWRzQUB1jlA54wcT1PyRrcXrhGbImU5hhRpiS5ZLnM
         jNdluI4j17cvS9/d6TkdYLdKWaSkV3Q9RVfepdq6awvnqeVvMXb7FS+Mj1bwwlzpu95n
         bWivfy9DDpteMj3dmzXn9D9cLwDRN+fJd9f+Z9Avkq56gYvOZkS7ZTfM+yHks/LPrs7E
         Gtd9UBb5UNKZXIZugtXUmbQ1kUdoaHATod1JUB/sJ7F3wPp0EGdBxchMDGKCxwLgtZIM
         U31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X8ihlJGLhQulzBr/Bw9/Kc42S0CR8w0u1LhcgfZff4w=;
        b=yg0X6Udn/rusPcqgwAParnIeJYXaOUrwIZYfldOCNrD2XHmCiQCstomaVyDt2iSiF4
         hm0CcMLdLtuZ6/CZMIesHic5Pp70czEPbcH79j+G4nUkxm2jhj+RxFAqxwnXlHY+m5os
         OxsSa3XEFOLHyAhff30FoMsUhfW+PtVhtGd4Ze8MD20UFU0LwAetSXASif0Q4m9SSrVK
         EtdMiWpFC1w7OU5TnMDkfNWuJRhBetFl12kCe60mPTkfllyVCL10RKcO2TDjp4NKXbKz
         mlplJgHd3sPK6ENwoGFqR5FBqLqOLKgRoeZMJA88lCoKp9pCnvtC1gdv9NfB3GtOk+Xe
         usCQ==
X-Gm-Message-State: AOAM530ynM7TbnBjP/Vx8IWI2nlniMIb8JYFcYcuUtqTREEEiUIyi4QN
	3JyLp488cViJKQTdVfW7Ka0=
X-Google-Smtp-Source: ABdhPJzNhxcvXvOdUp2SPEdE1BxJ9UHfBbGj0DPO7wTlUcLd9orD8k6sLkiR4VVw23suwE1/u0blTA==
X-Received: by 2002:a17:906:2bd7:b0:6ce:698b:7531 with SMTP id n23-20020a1709062bd700b006ce698b7531mr22560580ejg.146.1649521714475;
        Sat, 09 Apr 2022 09:28:34 -0700 (PDT)
Received: from darkstar.example.org (host-79-21-204-193.retail.telecomitalia.it. [79.21.204.193])
        by smtp.gmail.com with ESMTPSA id l17-20020a056402231100b0041d0718a3e3sm3586587eda.23.2022.04.09.09.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 09:28:33 -0700 (PDT)
Date: Sat, 9 Apr 2022 18:28:31 +0200
From: Michele Ballabio <ballabio.m@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, Maling
 list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>
Subject: Re: AMDGPU: regression on 5.17.1
Message-ID: <20220409182831.185e5d92@darkstar.example.org>
In-Reply-To: <CADnq5_PhaFbVCb=-AUCx4L-sCyPCPOsY3tNpiAg=gfCN7hFcJA@mail.gmail.com>
References: <20220403132322.51c90903@darkstar.example.org>
	<CADnq5_M+M_iykM0Ag6RF+kxzgpEopUBtp82h7tRM3G+B3AWZ2w@mail.gmail.com>
	<20220404213940.09a56d15@darkstar.example.org>
	<CADnq5_PhaFbVCb=-AUCx4L-sCyPCPOsY3tNpiAg=gfCN7hFcJA@mail.gmail.com>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 5 Apr 2022 10:23:16 -0400
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Mon, Apr 4, 2022 at 3:39 PM Michele Ballabio
> <ballabio.m@gmail.com> wrote:
> >
> > On Mon, 4 Apr 2022 13:03:41 -0400
> > Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > > On Sun, Apr 3, 2022 at 10:19 AM Michele Ballabio
> > > <ballabio.m@gmail.com> wrote:
> > > >
> > > > Hi,
> > > >         I've hit a regression on 5.17.1 (haven't tested 5.17.0,
> > > > but 5.16-stable didn't have this problem).
> > > >
> > > > The machine is a Ryzen 5 1600 with AMD graphics (RX 560).
> > > >
> > > > The regression I hit seems to trigger when the machine is left
> > > > idle at boot (I don't boot straight to X, I boot to a tty, login
> > > > and then start X). The machine after a while blanks the screen.
> > > > Usually, the screen unblanks as the keyboard is hit or the mouse
> > > > moves, but with kernel 5.17.1 the screen does not wake up. The
> > > > machine seems to run mostly fine: I can login from ssh, but I
> > > > cannot reboot or halt it: a sysrq sequence is needed for that.
> > > > Note that if the screen goes blank under X, it wakes up fine.
> > > >
> > > > Below a dmesg and two traces from syslog (they're quite
> > > > similar).
> > >
> > > Can you bisect?  Does setting amdgpu.runpm=0 help?
> >
> > I can try to bisect, should I narrow the search to drivers/gpu/drm/
> > ?
> 
> I would just do a full bisect if possible in case the change happens
> to be outside of drm.
> 
> >
> > Setting amdgpu.runpm=0 works, the display now unblanks without
> > problems.
> 

Hi,
    I bisected this, and the first bad commit is
[087451f372bf76d971184caa258807b7c35aac8f] drm/amdgpu: use generic fb
helpers instead of setting up AMD own's.

Let me know if you need some more testing.

Thanks,
    Michele Ballabio


