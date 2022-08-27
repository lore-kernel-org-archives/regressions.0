Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4603FED
	for <regressions@lists.linux.dev>; Sat, 27 Aug 2022 13:57:09 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3376851fe13so98467387b3.6
        for <regressions@lists.linux.dev>; Sat, 27 Aug 2022 06:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=XRLqy1+FzlAdLa/pIMYZh3Z1x4muDWm3/0zmL0cKOts=;
        b=4/COC1I9WQmN92QXea8A0DlTmvXBoDuw2Hy0N3GaWtxVjC+R4kWokvwoLvfEFNPbuv
         PlP0qKn9NmFCioaxADVOWO2aU82R508jBrp2RhmPCVS4UU+aabvIqRQhLh0ivNrk72bP
         FifS9viVhQ64lEkD76LihSyMuNALXQWJubENO1hoCOj2Y6JDqv52Nd4rsbuD941v22Gs
         8wfgN3Mvj+2WB4FLyeqFZBUfM1XNhXVp6Jdaw+zoaLmQ6Xc0skYe3GqegPz7m63AQvus
         ZM4UaqVXhPAs/SNArtu6KWGphz+luLXdOlf7vEIwalx+WT97BniTOLi+suvr3im6TPj/
         GeSA==
X-Gm-Message-State: ACgBeo3ZpRrs0ffskFqgkEA35axfy4dRjm+k38J/eUHKLRCHH3/jYuwV
	Wnx0XeNvT6AZzMkL4u1fmELDJr0hvSRlAjoVtqs=
X-Google-Smtp-Source: AA6agR6z0F9ZEyR3y2i8myIl7uZr6Wo1lwS9ctEdhNJqDqj7kzSOwuuNtSQAzSUQR8uhI4lrn7ExCb1Oj29p8j9NKmY=
X-Received: by 2002:a25:664a:0:b0:695:e7cc:9a20 with SMTP id
 z10-20020a25664a000000b00695e7cc9a20mr3441696ybm.153.1661608628211; Sat, 27
 Aug 2022 06:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d0433877-2971-b54d-fcbe-2837ae9248be@leemhuis.info>
 <CAJZ5v0iaAOH9MF5YziW_AjxKjP1uAfRYWvDapgbTbsStUG-g0Q@mail.gmail.com> <e9cf6b9e-df35-ab3a-4e9f-d73e2757a870@leemhuis.info>
In-Reply-To: <e9cf6b9e-df35-ab3a-4e9f-d73e2757a870@leemhuis.info>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sat, 27 Aug 2022 15:56:57 +0200
Message-ID: <CAJZ5v0ioAP9R=NcTS+m_i-vGtJfQd7vgLAa_Os6W=DvTf=8V3Q@mail.gmail.com>
Subject: Re: [Regression] Bug 216360 - No power to DVD drive
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: bhealey@live.co.uk, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 27, 2022 at 3:39 PM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 27.08.22 13:54, Rafael J. Wysocki wrote:
> > On Fri, Aug 26, 2022 at 12:13 PM Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> >>
> >> Hi Rafael. Could you help me out if you have a minute? I noticed
> >> a regression report in bugzilla that nobody looked at yet. According t=
o
> >> the reporter the DVD drive's drawer of a small form factor system won'=
t
> >> open anymore since v5.16; the device is not even mentioned anymore in
> >> the dmesg output. For details see:
> >>
> >> https://bugzilla.kernel.org/show_bug.cgi?id=3D216360
> >>
> >> Is that an ACPI problem and thus something you would handle?
> > I honestly don't think so.
>
> Okay, already suspected that, thx.
>
> >> If not: in which direction would you shove this?
> >
> > See https://bugzilla.kernel.org/show_bug.cgi?id=3D216360#c6
> >
> > This issue is not reported against the mainline kernel, so it should
> > be handled by whoever provided the kernel the reporter is using.
>
> Well, you for sure have a point. But well, from what I can tell the
> Manjaro kernel is not heavily patched (see
> https://gitlab.manjaro.org/packages/core/linux519; but the RT in the
> kernel's name makes me suspicious).

Even so, it is not the mainline and that's what we work on.

> And from my experience quite a few
> developer seem to be interested in regression reports from such kernels.
> That's why I (for now) pick some of them up (I use my best judgement
> here) and let the developers decide what to do with them.

Well, if you are absolutely sure that the third-party modifications
cannot be involved in the observed failure and you have the time to
assist the reporter, it is fine.  Otherwise you may not be helping.

> In this case I just don't really know whom to ask to look into this. :-/

Me neither.

> Anyway, Bruce, things really look a bit odd in this case. You should try
> to seek help from Manjaro -- or check if it really happens with a
> vanilla kernel(=C2=B9).

Good advice.

> If you do the latter, ideally consider to use "git
> bisect" to find the change that is causing the different behavior. Then
> we know for sure who needs to look into this.

Right.

> See also:
>
> https://docs.kernel.org/admin-guide/reporting-issues.html
> https://docs.kernel.org/admin-guide/reporting-regressions.html
>
> Ciao, Thorsten
>
> (=C2=B9) e.g. try a vanilla 5.15 kernel to see if your DVD works; use the
> config from the Manjaro 5.15 kernel (consider running "make
> localmodconfig" to reduce build times). Then compile a 5.16 vanilla
> kernel with the config from your 5.15 kernel processed by 'make
> olddefconfig'
