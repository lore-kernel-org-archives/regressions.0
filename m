Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9867F7C
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 12:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A92CC433A0
	for <regressions@lists.linux.dev>; Tue,  4 Apr 2023 12:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680611028;
	bh=xPu8vfjSrCVgwrhzmwn/0p5UHMuS/nK+J+klpq8JqWc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=UBvh+FySmqDEdFMtTQpbKQAnBbyjxqAalRdrBT8fOvL57redaOPwXOHuSC5Z9Q3KC
	 4gbd24ychBCkuY8HB5xpxogHqPSw8Hv7vAHnclTgGs+FefnCgd1Fx8YWW8vVHRuroW
	 0DfT1wE+KT9yoOk6yqsVlKrUkCztJFdWBD3MocMM0/2dQkLNIrwGwU41v7KEORF2D3
	 GC3KlhFrPn2fiGNvzzxlQyApR+0hn9nAYgFtiwFF1hF2RDohkDHt5iRvTK5LMCKtqE
	 dFTTrwgs37UGUczPohVPvI8P5EzsiryPzmcVLvFLtHgnaGtHzKaTcwhrrTfssxNNSn
	 CsCXGSDAylqnw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-545cb3c9898so534890297b3.7
        for <regressions@lists.linux.dev>; Tue, 04 Apr 2023 05:23:48 -0700 (PDT)
X-Gm-Message-State: AAQBX9fUVaaiVluyS8J9Oae6ODbF45p3VIuvMI6ur8ex/wRrhPDHOppi
	p0YBziuesF3b4UFGwixJdPgvUcggPhrmatqZpLw=
X-Google-Smtp-Source: AKy350ZBySpI0McsdrPqN/WXrKRZQ/2OoxLvTamgDcuwM2k1IV1dL8bOe4GdjE1bGF9L2+jYSFyWhk4kKH2RKGZJCms=
X-Received: by 2002:a81:a9c7:0:b0:541:8ce6:b9ad with SMTP id
 g190-20020a81a9c7000000b005418ce6b9admr1443234ywh.2.1680611027228; Tue, 04
 Apr 2023 05:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <889f3db6ca4008047595f4392388acc1f165e03c.camel@realtek.com>
 <CA+5PVA4H9Quu1954ubbcZfH-e1cOy2K27r0GfLemQcMBG-6AQA@mail.gmail.com> <7cc69aa5-e003-6ac7-9b2f-a95b67eb98e8@leemhuis.info>
In-Reply-To: <7cc69aa5-e003-6ac7-9b2f-a95b67eb98e8@leemhuis.info>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 4 Apr 2023 08:23:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5T=fNG4R-jfrnZEW2yF0g3tm2cBjkr70YZNDSh=V5G-A@mail.gmail.com>
Message-ID: <CA+5PVA5T=fNG4R-jfrnZEW2yF0g3tm2cBjkr70YZNDSh=V5G-A@mail.gmail.com>
Subject: Re: pull request: rtw89: 8852b: rollback firmware to v0.27.32.1 and
 introduce new file to new format
To: Linux regressions mailing list <regressions@lists.linux.dev>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Ping-Ke Shih <pkshih@realtek.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kvalo@kernel.org" <kvalo@kernel.org>, 
	"rb0171610@gmail.com" <rb0171610@gmail.com>, 
	"Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>, "tiwai@suse.de" <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 6:25=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 20.03.23 12:43, Josh Boyer wrote:
> > On Sat, Mar 18, 2023 at 9:59=E2=80=AFAM Ping-Ke Shih <pkshih@realtek.co=
m> wrote:
> >>
> >> In discussion threads [1] [2], the new format of 8852b break user spac=
e.
> >> To avoid this, introduce new filename rtw89/rtw8852b_fw-1.bin that old
> >> drivers will not try to load it.
> >>
> >> Rollback firmware version of rtw89/rtw8852b_fw.bin to the latest
> >> version of original format (i.e. v0.27.32.1) supported by old driver.
> >>
> >> The patches to support new filename in new driver are almost done,
> >> and I will submit them soon. Thanks for the advice in mail and
> >> bug threads.
> >> [...]
> > Pulled and pushed out.
>
> Thx to both of you for submitting the revert and applying it.
>
> Josh, do you plan to do another release soon? I fear that otherwise more
> distros and users will run into this regression.

I've done another release.  Apologies, I was on PTO.

josh
