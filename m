Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050244C89
	for <regressions@lists.linux.dev>; Fri,  2 Dec 2022 17:18:21 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id d6so8347242lfs.10
        for <regressions@lists.linux.dev>; Fri, 02 Dec 2022 09:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GdwYktE3SJ00+EzqM3Nkk4pKYtF1FV5Z9anlWL/Lco=;
        b=tTcJFrP39UoeTXqz9PAbwPDuDavbX/iiiE6vi/xXHT4Nppc0LfqmDerd9+6tkT+lj6
         uR0ma4f9WAVk8tKfW2l2WT8PZDccuToKgVjTzW2xWFVMWZcR0noPjtRxehnZrZnH2kPn
         IhAm8584aZqObuaUPudoYHoaAU6P47PspT85vwgA+HnOoqpGQ3UW4t8Y8YF5AmCtEGU6
         ZjH9VMvBJER5bh7SqXfaMfE96DmVMDvhQxCvRmXdH53I3Hw/+VOGitFmlW1ZRaAo7wNU
         GWVwHIemE88S1yDPEOeFvc2awVMnV6+jGceuyRpWil5iRbZBC9m9T56rcEQE2Ua7yij4
         SdNA==
X-Gm-Message-State: ANoB5pnPUt/odX3+WR3GIEVQa7xNq5YP2l6b+PLidgB5UDBwKpoRi3/5
	M2YrPY2ljog4TPp9rMm1dXcBjsq0YMxD4HbLsRg=
X-Google-Smtp-Source: AA0mqf7mw++LFCImmS6AAz3qcq50Md4DWIeLfBeysStDPkspvOUjh7HKStbv7/TM/Fnzbt9603nVpw==
X-Received: by 2002:a05:6512:34c6:b0:4a4:71b5:cbd3 with SMTP id w6-20020a05651234c600b004a471b5cbd3mr25513084lfr.518.1670001499017;
        Fri, 02 Dec 2022 09:18:19 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id h2-20020a2ea482000000b0027713ef5360sm673932lji.71.2022.12.02.09.18.16
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 09:18:17 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id cf42so2604071lfb.1
        for <regressions@lists.linux.dev>; Fri, 02 Dec 2022 09:18:16 -0800 (PST)
X-Received: by 2002:a19:f010:0:b0:4a2:2e81:9be5 with SMTP id
 p16-20020a19f010000000b004a22e819be5mr25394338lfc.486.1670001495941; Fri, 02
 Dec 2022 09:18:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <14722778-dda0-cb9f-8647-892493d94a5c@leemhuis.info>
 <2026016246ef719605c9932feeb56b105833593b.camel@intel.com>
 <CAMfi-DRE-u5TNu2zAL-7A-ENHM9EiJeYJ38BL_FMdk6QmW7c9w@mail.gmail.com>
 <9a03c244-adff-afaf-7385-d8e89cd3f338@leemhuis.info> <02F8DDF1-EC0D-4EBD-88F5-7E000841C337@holtmann.org>
In-Reply-To: <02F8DDF1-EC0D-4EBD-88F5-7E000841C337@holtmann.org>
From: Dave Chiluk <chiluk@ubuntu.com>
Date: Fri, 2 Dec 2022 11:18:03 -0600
X-Gmail-Original-Message-ID: <CAMfi-DQfuro4c_VUrFHBTv8sPnwuV8XhTV_W7qswGeCC2t-wzg@mail.gmail.com>
Message-ID: <CAMfi-DQfuro4c_VUrFHBTv8sPnwuV8XhTV_W7qswGeCC2t-wzg@mail.gmail.com>
Subject: Re: [regression] Bug 216753 - 6e 6 ghz bands are disabled since 5.16
 on intel ax211
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, "Coelho, Luciano" <luciano.coelho@intel.com>, 
	"Greenman, Gregory" <gregory.greenman@intel.com>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Running
$ iw reg set US
or
$ iw reg set DE
do not result in the bands becoming enabled.  I should have included
that in the initial bug report.   Additionally shouldn't the country
code should be getting gathered through 802.11d from the broadcast APs
within region?

Also crda is now disabled in both debian and Ubuntu.
https://bugs.debian.org/1003903
https://bugs.launchpad.net/ubuntu/jammy/+source/crda/+bug/1958918

I'm specifically on 22.04, and the 6ghz band works on the 5.15 ubuntu
kernel and the 5.15.79 linux-stable kernel.
The 6ghz band becomes disabled as soon as I upgrade to the 5.16+
linux-stable kernels. So from a user perspective this really is a case
of a kernel upgrade breaking user-space.  This is what led me down
this rabbit hole here.

If there's something that needs to be done differently from a
userspace perspective I'm all ears, but this seems as if it's a hard
disable by the above mentioned commit.

Thanks,

On Fri, Dec 2, 2022 at 10:46 AM Marcel Holtmann <marcel@holtmann.org> wrote=
:
>
> Hi Thorsten,
>
> >> The other possibility is that this is actually a bios bug, as the DSM
> >> is being read out of ACPI.  In which case that would be Dell's fault.
> >
> > Yes and no, but no:
> >
> > A kernel change exposed this problem, hence it doesn't matter if the
> > BIOS is faulty: it's makes it a kernel regression and those are not
> > allowed. For more on this see
> > https://docs.kernel.org/admin-guide/reporting-issues.html
> >
> > That at least would be the normal approach. But the thing is: the legal
> > implications when it comes to things like wifi make this somewhat
> > trickier. :-/
>
> so you need to set your country code first before any of the regulatory
> enabled channels on 6Ghz get used. Otherwise you are stuck in the world
> domain that doesn=E2=80=99t allow 6Ghz at all.
>
> Two choices, either you run iwd and just set Country=3DDE where this than
> would be persistent; see iwd.config(5). Or you do this via iw reg set DE
> manually. wpa_supplicant has a set_country wrapper, but I don=E2=80=99t s=
ee it
> being used anywhere, so I assume you have to do this manually when using
> wpa_supplicant.
>
> And of course tools like crda etc. need to be fully functional to load
> the appropriate regulatory information. Since any 6Ghz operation is
> blocked by default.
>
> Regards
>
> Marcel
>
