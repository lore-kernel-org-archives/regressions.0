Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF799EA5
	for <regressions@lists.linux.dev>; Wed,  5 Jul 2023 05:31:02 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-c50c797c31bso3633581276.0
        for <regressions@lists.linux.dev>; Tue, 04 Jul 2023 22:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1688535061; x=1691127061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhZT6HGQXrVs8HZ8Yfrd/PZq4RDzl4JlYHbBSawlJgI=;
        b=R5OVgpIC90iWV3nWzt2HXZGAIvsOeD/ei/ifmVZdzx6b4rVqE8L79w94X/5VBCpfQ1
         hPrCtKY1IzJm8mwCi4kDeLrfwlk3Ip3KPawv70AgPxJjDEKJRueNME6H9QNikl3J6/j4
         bMMnID1Wxnw6A56aOLw7sDJeGDDD6ikNpJQFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688535061; x=1691127061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhZT6HGQXrVs8HZ8Yfrd/PZq4RDzl4JlYHbBSawlJgI=;
        b=Hzh19f6ACrulc8VCVS5Hs+Ihgpc1oCuf4KVI2ewy+PBP75hagatn42TBQK6zRB4dlW
         tqAv98ZfPqM1v+SDY0EYr1bbBHB1Xp0pRo9wwQKGjLsqw3SgKTiOu8pHMwM/nLWu/F7L
         ffe5iDPKBBz/EK32/fwBHecmxddH1Jsge8iBj48A1cWxsApIxGA3uBY+BAcn0ea06ytn
         /fMYQC9ZhfO+2h+PsVCBfxgG3Qrah5VwWh7DqWxISt2jfmVsSHg5vxenHcKqLluC/1+E
         9QY7x0+9gpZGgAu0EdKR0k3XvU/2e5oeUO8p6D6kXOzRHxyoz2NmD8cBzP6SxPQbe2hK
         qA3Q==
X-Gm-Message-State: ABy/qLYvPDKfQLnzZwcYyBs7CrgNhHglyq9Nc+js1N9mpHop9pY6QR+e
	1ulmkl8YMrZUJScUnB1I3NJETmprnpRgOnAsua083Q==
X-Google-Smtp-Source: APBJJlGhxcdbaq6knM24Q2XbhP4OqN8lqf9RuZf+WpretMgSEJbM954+clOOc+Jp7/XBlDYvX88W3zII7F/VAeLDgx0=
X-Received: by 2002:a5b:5c8:0:b0:c63:7758:701f with SMTP id
 w8-20020a5b05c8000000b00c637758701fmr355911ybp.65.1688535061715; Tue, 04 Jul
 2023 22:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230403221233.500485-1-marex@denx.de> <20230403221233.500485-2-marex@denx.de>
 <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
In-Reply-To: <CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 5 Jul 2023 11:00:49 +0530
Message-ID: <CAMty3ZBNFu=f-FS4YFN4wfmiTuk=48nna-vub1eMYwidDt+msg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
 EOT packet
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Walle <michael@walle.cc>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Amit,

On Wed, Jul 5, 2023 at 10:15=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org=
> wrote:
>
> Hi Marek,
>
> On Wed, 5 Jul 2023 at 01:48, Marek Vasut <marex@denx.de> wrote:
> >
> > Do not generate the HS front and back porch gaps, the HSA gap and
> > EOT packet, as these packets are not required. This makes the bridge
> > work with Samsung DSIM on i.MX8MM and i.MX8MP.
>
> This patch broke display on Dragonboard 845c (SDM845) devboard running
> AOSP. This is what I see
> https://people.linaro.org/~amit.pundir/db845c-userdebug/v6.5-broken-displ=
ay/PXL_20230704_150156326.jpg.
> Reverting this patch fixes this regression for me.

Might be msm dsi host require proper handling on these updated
mode_flags? did they?

Thanks,
Jagan.
