Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1093D4C71
	for <regressions@lists.linux.dev>; Fri,  2 Dec 2022 15:38:09 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id cf42so2176142lfb.1
        for <regressions@lists.linux.dev>; Fri, 02 Dec 2022 07:38:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhdW6X1bGFq1GUdOEe+pRgDK494GKVDs9c7r4mfiruQ=;
        b=IjiMPlHFVHkaMamI9Fxrd2+aSsNuI1EM8Q9G82DA1tP5ACvsbbvDlGhsLDYxk3cfEW
         VCYVdglQLBxj3ew1jWqqbSTetbjJYveLZPpHoJFgSyltPeXwcLtI1q/X4swuq5Khsubx
         u1aL+5N4i9dH7FdU4wNIFFMp9GQ4teN4Xgpdjj91UB3tOcBwTYkcn+K8LCx2oxSfB2W+
         aCYQJyfYgud2gOgX8F0zi0UNYkduvU/L/EU9savqjaUJkJJjISdBDfL1DDAFnuKTk1YQ
         E1krQKHHvyOMqRul9ODF1EGbAT4JRHcjztqFzqsqqeZbq+6brNIlrtjT8PFGGJ05k/zE
         8G3Q==
X-Gm-Message-State: ANoB5pnGO5DAVJxVAtBJvDh8I3a84ThkNK3UaCroVFecmqmIWoxyOGb/
	mVa33R4qFhCuq1fTdgq7hL5XIB1tmEMZW7iy
X-Google-Smtp-Source: AA0mqf69dikMj6Tr8URY4LySI+xQw9J7SqZj52ieRXhYrPnbTZU3kuiGeGd8JOWv5YNuSKsALMPZNA==
X-Received: by 2002:a05:6512:36c3:b0:4b4:c0c:8995 with SMTP id e3-20020a05651236c300b004b40c0c8995mr22634327lfs.326.1669995487307;
        Fri, 02 Dec 2022 07:38:07 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id h8-20020a05651c124800b0027965d3cc9fsm661804ljh.47.2022.12.02.07.38.04
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 07:38:05 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id l8so5794473ljh.13
        for <regressions@lists.linux.dev>; Fri, 02 Dec 2022 07:38:04 -0800 (PST)
X-Received: by 2002:a05:651c:200c:b0:279:3d7a:c240 with SMTP id
 s12-20020a05651c200c00b002793d7ac240mr19420636ljo.289.1669995484289; Fri, 02
 Dec 2022 07:38:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <14722778-dda0-cb9f-8647-892493d94a5c@leemhuis.info> <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
In-Reply-To: <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
From: Dave Chiluk <chiluk@ubuntu.com>
Date: Fri, 2 Dec 2022 09:37:51 -0600
X-Gmail-Original-Message-ID: <CAMfi-DRE-u5TNu2zAL-7A-ENHM9EiJeYJ38BL_FMdk6QmW7c9w@mail.gmail.com>
Message-ID: <CAMfi-DRE-u5TNu2zAL-7A-ENHM9EiJeYJ38BL_FMdk6QmW7c9w@mail.gmail.com>
Subject: Re: [regression] Bug 216753 - 6e 6 ghz bands are disabled since 5.16
 on intel ax211
To: "Coelho, Luciano" <luciano.coelho@intel.com>
Cc: "regressions@leemhuis.info" <regressions@leemhuis.info>, 
	"Greenman, Gregory" <gregory.greenman@intel.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The other possibility is that this is actually a bios bug, as the DSM
is being read out of ACPI.  In which case that would be Dell's fault.
Either way I appreciate any guidance you can provide.

Thanks,
Dave.


On Thu, Dec 1, 2022 at 5:33 AM Coelho, Luciano <luciano.coelho@intel.com> w=
rote:
>
> On Thu, 2022-12-01 at 11:14 +0100, Thorsten Leemhuis wrote:
> > Hi, this is your Linux kernel regression tracker.
> >
> > Luca, I noticed a regression report in bugzilla where I'd like your
> > advice on. To quote https://bugzilla.kernel.org/show_bug.cgi?id=3D21675=
3
>
> Hi Thorsten wearing-the-regression-hat, =F0=9F=99=82
>
> I'm not the maintainer of iwlwifi anymore, so I'm adding the new
> maintainer here, Gregory Greenman.
>
> Gregory, can you take a look?
>
>
> > > It looks like the self-managed regulatory information is causing the =
6ghz band to be disabled on my AX211 (in the US).
> > > iw reg get shows no 6ghz bands (output at the bottom).
> > >
> > > $ sudo iw phy0 channel
> > > ...
> > > Band 4:
> > >     * 5955 MHz [1] (disabled)
> > >     * 5975 MHz [5] (disabled)
> > >     * 5995 MHz [9] (disabled)
> > >         ....(continues with all disabled
> > >         * 7115 MHz [233] (disabled)
> > > ...
> > >
> > > I was able to narrow this down to having been introduced during the 5=
.16 development window, as 5.15.79 linux-stable kernel works and the 5.16.1=
2 does
> > > not (earlier builds of 5.16 kernel fail to boot on my machine for som=
e reason).
> > >
> > > I found https://community.frame.work/t/kernel-5-16-6ghz-disabled-ax21=
0/15675/5
> > > and they imply that this regression was introduced by
> > > 698b166ed3464e1604a0e6a3e23cc1b529a5adc1
> > > I haven't independently verified this commit as the definitive issue.
> >
> > You authored 698b166ed346 ("iwlwifi: mvm: read 6E enablement flags from
> > DSM and pass to FW"). As it is a regressions is ideally should be dealt
> > with. But this area in tricky due to the legal implications. Hence I
> > wonder: is there anything we can do about this, or is this simply a cas=
e
> > where we have to bite the bullet and live with this regression?
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat=
)
> >
> > P.S.: As the Linux kernel's regression tracker I deal with a lot of
> > reports and sometimes miss something important when writing mails like
> > this. If that's the case here, don't hesitate to tell me in a public
> > reply, it's in everyone's interest to set the public record straight.
