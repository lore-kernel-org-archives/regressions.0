Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B6F6FB3
	for <regressions@lists.linux.dev>; Wed,  5 Jul 2023 11:57:00 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4715cbe0422so2045210e0c.3
        for <regressions@lists.linux.dev>; Wed, 05 Jul 2023 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688558219; x=1691150219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYzFOXrpHjMbau6LdBUr//Enq3hi9M8IF1iSIElak94=;
        b=g6COHjjX6H1jp8F3+hb7jSPsaJqivsIH24rJGOJVcEtbKhzNF5ISzY8ii3ouLDdwcP
         YlKNvcDTJHCk49YdLyZcOxvHeeP1GYrPIXXrzQSzOqPCWEllvjfGlhZ1eK/7+j1hTBLW
         eAOtb8dY6Lv70Z4+i6oaKkkTLheyO0o2pBUemkz9wq/RBZ6FSL/l7TjLLYcSnfId9ebn
         yAHVH3t1kYwr/2R1FfLOO5ZNsKP4yonuPzzw5D6Dybr1CeP5QpPpY6m9zac/uLpWBq7W
         lDihrjhQ8hF/Qd9ro0sv26veYR8HAuvbB9gk9I+3vX8BuZZmGA4464B3fwy2NXEIK4AU
         PzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688558219; x=1691150219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYzFOXrpHjMbau6LdBUr//Enq3hi9M8IF1iSIElak94=;
        b=EClMTPTrfs1akLgkAvbh1/QH6ilG42C3nc4va8ObKGU91HdClBqxPKFwwdjn5VtpJP
         50RaquW+R/1tQ3ODOdSkky+Q7dNdS4RkPqItef9P5k9n8mTrFq13omVz3dwUuDiWE/9k
         MgMBsUjiPdf2nlS4I52Crb2EaHKjuZBcnjv+g+UnVvmOa7oQH36+toGe3jGjbo9ezwCi
         aJAScerFNR5dWaAltsPTju125401wkg9Rr8uoiOpwIKzIdZ42adp7IhiNckENDBUL+UF
         UPQTvTPSiizekfWFkARfl4g5WCzR4vtnbZT0WI+WxghzTURaQyKqnVanUhOrwljdW+7Y
         G2UA==
X-Gm-Message-State: ABy/qLaZz4zFPdrCjImWI14Cb4aQnhRq+FHNjmlCV3phO//FeSMaYEvY
	/OkIPFYIqyGKR2QVU6Tt3LxMg0SML0bba95gzOPKFtKAOjvE1PRQ
X-Google-Smtp-Source: APBJJlFFhOiBBRrEk3tyW0G/UO66q38pjXFSGKhoVHIsv25St86l3kpyWAQnFh8VA2c8QwfNLNINF3KnHnHTkCORxnE=
X-Received: by 2002:a1f:4ec6:0:b0:47e:3f56:e91e with SMTP id
 c189-20020a1f4ec6000000b0047e3f56e91emr3134115vkb.15.1688558219280; Wed, 05
 Jul 2023 04:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230429020951.082353595@lindbergh.monkeyblade.net>
 <CAAJw_ZueYAHQtM++4259TXcxQ_btcRQKiX93u85WEs2b2p19wA@mail.gmail.com>
 <ZE0kndhsXNBIb1g7@debian.me> <b9ab37d2-42bf-cc31-a2c0-a9b604e95530@gmail.com>
 <CAAJw_Zug6VCS5ZqTWaFSr9sd85k=tyPm9DEE+mV=AKoECZM+sQ@mail.gmail.com> <7fee3284-b9ba-58f4-8118-fe0b99ae6bf7@leemhuis.info>
In-Reply-To: <7fee3284-b9ba-58f4-8118-fe0b99ae6bf7@leemhuis.info>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Wed, 5 Jul 2023 19:56:48 +0800
Message-ID: <CAAJw_Zu=MPtGPARgCB2fteP+7F793YDFXE9RuzSH8EqYBS-OOw@mail.gmail.com>
Subject: Re: Linux-6.5 iwlwifi crash
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: lkml <linux-kernel@vger.kernel.org>, 
	Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 4:37=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi! Thanks for your report.
>
> Side note: is there any relation to the thread[1] you posted this in?

Sorry, I was just posting to the same email list that I had reported
about a different wifi list earlier. No relation to this, but it's a
new wifi issue.

> Doesn't look like it from here.
>
> Side note: discussing multiple unrelated issues in one thread increases
> the risk a lot that some or all of them are ignored:
> https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-k=
ernel-bug-reports-are-ignored/
>
> [1] https://lore.kernel.org/all/ZE0kndhsXNBIb1g7@debian.me/
>
> On 05.07.23 09:24, Jeff Chua wrote:
> > Latest linux-6.4
>
> What do you mean by that? From later in the mail it sounds like you mean
> latest mainline -- is that correct?

It's from linux git pull. It's 6.5-rc but I didn't write that way
becuase Linus's branch is still 6.4 ... that 6.5-rc0 or rc1 should
have more appropriate.

> > after June 27 crash my whole linux notebook once
> > iwlwifi is loaded. Anyone seeing this?
>
> I haven't heard of any such problems, but that doesn't have to mean much.

> > Bisect? Or there's a patch for this?
> >
> > # modprobe iwlwifi
> > ... Whole system frozen!
> >
> >
> > Here's my system before the crash ...
> >
> > # dmesg
> > cfg80211: Loading compiled-in X.509 certificates for regulatory databas=
e
> > Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> > iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
> > iwlwifi 0000:00:14.3: api flags index 2 larger than supported by driver
> > thermal thermal_zone1: failed to read out thermal zone (-61)
> > iwlwifi 0000:00:14.3: Sorry - debug buffer is only 4096K while you
> > requested 65536K
> >
> > # lspci
> > 00:14.3 Network controller: Intel Corporation Alder Lake-P PCH CNVi
> > WiFi (rev 01)
> >
> > # linux git log
> > commit d528014517f2b0531862c02865b9d4c908019dc4 (HEAD -> master,
> > origin/master, origin/HEAD)
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Tue Jul 4 15:05:12 2023 -0700
> >
> > # lsmodModule                  Size  Used by
> > iwlmvm                397312  0
> > mac80211              626688  1 iwlmvm
> > iwlwifi               307200  1 iwlmvm
> > cfg80211              413696  3 iwlmvm,iwlwifi,mac80211
> >
> >
> > Bisect?
>
> If none of the others CCed comes up with an idea within the next few
> hours then yes please!

I will wait for a day, then bisect.

Thank you!


> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
