Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5463CD04
	for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 18:27:17 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2bfea381255so1394421fa.3
        for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695234435; x=1695839235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B51hhManBxQCDJi8s/bZ6EVrxt2B6zMHpl9BIven/A=;
        b=NGNPuKZ4rtETSyRtHVPJ5OGosH8GG2+jR00rLE7FJ089ajmmgrX/Gcqznc4RKYy6du
         OcPrfkZCaCj6YosQXpcDSrfVvKXLlSM3aKPUSxwY4OEv5mtQxp/N0Bk3S28BxpUEt1Ww
         z6fjyQjlerkRMarRyUUTcOLcuvj4jltQuImEhlwCYyezSIuQuzU5y2ftXsHRWeoN7vlF
         cy/0OETwsu3ctClmvd1AxcOKJ8EnaAJXZHNaTWscaR7bsuiWDD1yEJxDbaQCjaArBL3G
         uwQg/KBaqExaO+zGvZJKLnhZ9CjEYuldt4In7HZwDBERLcAe5gh0CCTakWcjf7LA7CiK
         WpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695234435; x=1695839235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/B51hhManBxQCDJi8s/bZ6EVrxt2B6zMHpl9BIven/A=;
        b=nrI8PZV69NvLIyuHJw+bKKFweo4r0tM1ilzPXIUTHP4O96kKJmY4tJeJHXO58W/sSm
         aicOxodqPRoARQnQnK4xGWt07lcoRsmcvfupTJG6VG0OJW6J+FijlEs/gH88qNVXxjvg
         mCpTNuXnL64e4xat9Hv5lEbVHz0MOQD6IBKLozB18YLeRnsDUvTgczKyVDVDLGT01boo
         2+HXCKD76MJounNj5ag3VldimVOi+ALCnqGvG0Jb2TqdPP59VmbaSPG72TjIEUbs/bf/
         8DZD//82NEU5njjCuFr6sBZry0tRnLrMdajNwxQ8lTf7QuOnjLWXpD6zT+iqnTkirLms
         h5Kg==
X-Gm-Message-State: AOJu0YyGqC7uJh1/t1ut8GF7WrgDTHs4eoHPtwOty2iLzY8D4h/M7jaF
	xD0kk1fmV/GvpG8AV4hpj0GO7WaU1xVFH7jEx4o=
X-Google-Smtp-Source: AGHT+IF0iUJNRicLpJin3ByiycK68Xagu/oZrfx1jraD/qFlUAPWvrmPcx4u8CUjgnhAlieVUWLkWumO10WZWKvzyDY=
X-Received: by 2002:a05:651c:108:b0:2bd:133c:2d71 with SMTP id
 a8-20020a05651c010800b002bd133c2d71mr2718462ljb.52.1695234435115; Wed, 20 Sep
 2023 11:27:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230829205936.766544-1-luiz.dentz@gmail.com> <169343402479.21564.11565149320234658166.git-patchwork-notify@kernel.org>
 <de698d06-9784-43ed-9437-61d6edf9672b@leemhuis.info> <CABBYNZK2PPkLra8Au-fdN2nG2YLkfFRmPtEPQL0suLzBv=HHcA@mail.gmail.com>
 <574ca8dd-ee97-4c8b-a154-51faf83cabdf@leemhuis.info> <CABBYNZJ=5VH2+my7Gw1fMCaGgdOQfbWNtBGOc27_XQqCP7jD-A@mail.gmail.com>
 <ff2abfbe-a46b-414b-a757-8185495838b7@leemhuis.info> <cd12622b-bfc6-093d-5c10-493e10935440@leemhuis.info>
In-Reply-To: <cd12622b-bfc6-093d-5c10-493e10935440@leemhuis.info>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 20 Sep 2023 11:27:02 -0700
Message-ID: <CABBYNZKg8dbD0CY2yR=JUYLjXcRm_Pq7GU3W5gPErx6-_7GAJQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_sync: Fix handling of HCI_QUIRK_STRICT_DUPLICATE_FILTER
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, patchwork-bot+bluetooth@kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev <netdev@vger.kernel.org>, 
	Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Wed, Sep 20, 2023 at 7:02=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
>
> @Luiz Augusto von Dentz: did you make any progress to get this into net
> to make sure this rather sooner then later heads to mainline? Doesn't
> looks like it from here, but maybe I'm missing something.

Just sent the pull-request:

https://patchwork.kernel.org/project/bluetooth/patch/20230920181344.571274-=
1-luiz.dentz@gmail.com/

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
>
>
> On 14.09.23 20:08, Thorsten Leemhuis wrote:
> > On 14.09.23 19:51, Luiz Augusto von Dentz wrote:
> >> On Wed, Sep 13, 2023 at 10:13=E2=80=AFPM Thorsten Leemhuis
> >> <regressions@leemhuis.info> wrote:
> >>> On 12.09.23 21:09, Luiz Augusto von Dentz wrote:
> >>>> On Mon, Sep 11, 2023 at 6:40=E2=80=AFAM Linux regression tracking (T=
horsten
> >>>> Leemhuis) <regressions@leemhuis.info> wrote:
> >>>>> On 31.08.23 00:20, patchwork-bot+bluetooth@kernel.org wrote:
> >>>>>> This patch was applied to bluetooth/bluetooth-next.git (master)
> >>>>>> by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
> >>>>>> On Tue, 29 Aug 2023 13:59:36 -0700 you wrote:
> >>>>>>> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> >>>>>>>
> >>>>>>> When HCI_QUIRK_STRICT_DUPLICATE_FILTER is set LE scanning require=
s
> >>>>>>> periodic restarts of the scanning procedure as the controller wou=
ld
> >>>>>>> consider device previously found as duplicated despite of RSSI ch=
anges,
> >>>>>>> but in order to set the scan timeout properly set le_scan_restart=
 needs
> >>>>>>> to be synchronous so it shall not use hci_cmd_sync_queue which de=
fers
> >>>>>>> the command processing to cmd_sync_work.
> >>>>>>> [...]
> >>>>>>
> >>>>>> Here is the summary with links:
> >>>>>>   - Bluetooth: hci_sync: Fix handling of HCI_QUIRK_STRICT_DUPLICAT=
E_FILTER
> >>>>>>     https://git.kernel.org/bluetooth/bluetooth-next/c/52bf4fd43f75
> >>>>>
> >>>>> That is (maybe among others?) a fix for a regression from 6.1, so w=
hy
> >>>>> was this merged into a "for-next" branch instead of a branch that
> >>>>> targets the current cycle?
> >> [...]
> >>> That answer doesn't answer the question afaics, as both 6.1 and 6.4 w=
ere
> >>> released in the past year -- the fix thus should not wait till the ne=
xt
> >>> merge window, unless it's high risk or something. See this statement
> >>> from Linus:
> >>> https://lore.kernel.org/all/CAHk-=3Dwis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5=
wmB6SRUwQUBQ@mail.gmail.com/
> >> Thanks for the feedback, I will try to push fixes to net more often.
> >
> > Great, many thx!
> >
> >>>> but I could probably have it marked for stable just
> >>>> to make sure it would get backported to affected versions.
> >>> That would be great, too!
> >> Well now that it has already been merged via -next tree shall we still
> >> attempt to mark it as stable? Perhaps we need to check if it was not
> >> backported already based on the Fixes tag.
> >
> > Changes only get backported once they hit mainline, which hasn't
> > happened yet. And to get them into the net branch (and from there to
> > mainline) a new commit is needed anyway, so you might as well add the
> > stable tag to it. Side note: And don't worry that identical commit is
> > already in -next, git handles that well afaik (but if you rebase
> > bluetooth-next for other reasons anyway you might as well remove it).
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat=
)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.



--=20
Luiz Augusto von Dentz
