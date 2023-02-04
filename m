Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF38B2586
	for <regressions@lists.linux.dev>; Sat,  4 Feb 2023 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675523789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ms8eBc48Rg3NStcu4ZOpEF4W9fY8TJN/5yrtf8umZlg=;
	b=T/fEdvbMNEL9HkjFImAPSdY0eNzU7Y/i5obflIcCc+zMbXdbRuUm8bCGeW1IPNCbgiIIax
	MLt9TkMX1ChHtujPBZIwHKpk/lH6Jld+dzNxLvuCdBqdSsQxYilq0Z25cs9kv2YniG8qKE
	Yc1SQ96/5w6uGVvUfHqPLGmz0uNNgKc=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-h4TpQvbZMhW9oxl_uSB9zA-1; Sat, 04 Feb 2023 10:16:28 -0500
X-MC-Unique: h4TpQvbZMhW9oxl_uSB9zA-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-4bdeb1bbeafso78374767b3.4
        for <regressions@lists.linux.dev>; Sat, 04 Feb 2023 07:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ms8eBc48Rg3NStcu4ZOpEF4W9fY8TJN/5yrtf8umZlg=;
        b=xGqFih7dovIheu+VK4jF8yRkraw0+XBBL+L8R6pP4gGvSqRLneYCoVCXDuyQS4vhQi
         MsNlkC0lOw0ejy2wE3I6YM7d2rYGU3VMyMOw5ok8bxLLN9mWCoXs/JzT2RPsRzf9+SBN
         jbUjqPQ/N5wRa4g8onFDn4FkpHYMf9rHetvcuPQWI49dqAwcqo+CBh7FE+SLsIJdNq0i
         iydH3V2d1oM1Hpi1iXIv2MI4siI5uDKzVJt5GJF+HaNlBZqHP4WFllQmtupLwjyqDFZa
         8Fs2tgEBEz30cVDWwhsj9ZEJ0KRml35uFRkwcm4JSJgpTrqIaxDcnvMmNlX44XJ4fi80
         Hx6g==
X-Gm-Message-State: AO0yUKWWl0pfvAe/fKY5d0bbNcgEq08WerwETxWCQTUx20klv6HY7yU7
	mIA25fbzE/WXQM3nSHuRi/2WhGIC0UeSRjBg1omrO1WnX/PcXOpCLixQc9KfCKs4dTvlX3+Gq+a
	V3GeaoFxJJn85k90kE/8wIJ4VReWZn2WOvXfNw1k=
X-Received: by 2002:a81:5455:0:b0:507:4ba0:f1bc with SMTP id i82-20020a815455000000b005074ba0f1bcmr1615509ywb.293.1675523786649;
        Sat, 04 Feb 2023 07:16:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/z4nqUGxrT5mGhN+3vcEvHvdHOxeequ+3Lt5QZZsSTVuGGwHDqHsvF6Uvpd6jwn8uEyBdidRMVyaKUDukaOZ4=
X-Received: by 2002:a81:5455:0:b0:507:4ba0:f1bc with SMTP id
 i82-20020a815455000000b005074ba0f1bcmr1615499ywb.293.1675523786206; Sat, 04
 Feb 2023 07:16:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJD_bPJ1VYTSQvogui4S9xWn9jQzQq8JRXOzXmus+qoRyrybOA@mail.gmail.com>
 <Y9Vg26wjGfkCicYv@kroah.com> <CAJD_bPLkkgbk+GO66Ec9RmiW6MfYrG32WP75oLzXsz2+rpREWg@mail.gmail.com>
 <CAJD_bPK=m0mX8_Qq=6iwD8sL8AkR99PEzBbE3RcSaJmxuJmW6g@mail.gmail.com>
 <02834fa9-4fb0-08fb-4b5f-e9646c1501d6@leemhuis.info> <288d7ff4-75aa-7ad1-c49c-579373cab3ed@intel.com>
 <CALFERdw=GwNYafR3q=5=k=H_jrzTZMyDBQLouFGV0JGu8i9sCg@mail.gmail.com>
 <04a9f939-8a98-9a46-e165-8e9fb8801a83@intel.com> <CAJD_bP+Te5a=OfjN9YrjGOG2PzudQ87=5FEKj6YLFxfKyFe5bw@mail.gmail.com>
 <6262bd72-cc2b-9d2a-e8f0-55c2b2bb7861@linux.intel.com> <CAJD_bPKxbsDi10FGX2mrMeuxcphDOvO8Q87j+AvnnQpe5cvmSA@mail.gmail.com>
In-Reply-To: <CAJD_bPKxbsDi10FGX2mrMeuxcphDOvO8Q87j+AvnnQpe5cvmSA@mail.gmail.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Sat, 4 Feb 2023 10:16:14 -0500
Message-ID: <CAJD_bP+RUemsss_YiAZ5v08ak8aTzXCB0gk7q623zyF455bh7g@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Sasa Ostrouska <casaxa@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, 
	lma@semihalf.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	stable@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have built kernels for 6.0.19 (I don't think anyone confirmed
whether or not it worked), plus every 6.1 tag from 6.1-rc1 up to
6.1.7. 6.0.19 worked. No 6.1 kernels worked. For rc1 to rc5 I built
with and without the legacy dai renaming patch added in rc6 that I
believe would be necessary, but it made no difference either way.

On Wed, Feb 1, 2023 at 9:33 AM Jason Montleon <jmontleo@redhat.com> wrote:
>
> On Wed, Feb 1, 2023 at 6:05 AM Amadeusz S=C5=82awi=C5=84ski
> <amadeuszx.slawinski@linux.intel.com> wrote:
> >
> > On 1/31/2023 4:16 PM, Jason Montleon wrote:
> > > On Tue, Jan 31, 2023 at 7:37 AM Cezary Rojewski
> > > <cezary.rojewski@intel.com> wrote:
> > >>
> > >> On 2023-01-30 1:22 PM, Sasa Ostrouska wrote:
> > >>
> > >>> Dear Czarek, many thanks for the answer and taking care of it. If
> > >>> needed something from my side please jest let me know
> > >>> and I will try to do it.
> > >>
> > >>
> > >> Hello Sasa,
> > >>
> > >> Could you provide us with the topology and firmware binary present o=
n
> > >> your machine?
> > >>
> > >> Audio topology is located at /lib/firmware and named:
> > >>
> > >> 9d71-GOOGLE-EVEMAX-0-tplg.bin
> > >> -or-
> > >> dfw_sst.bin
> > >>
> > >> Firmware on the other hand is found in /lib/firmware/intel/.
> > >> 'dsp_fw_kbl.bin' will lie there, it shall be a symlink pointing to a=
n
> > >> actual AudioDSP firmware binary.
> > >>
> > > Maybe this is the problem.
> > >
> > > I think most of us are pulling the topology and firmware from the
> > > chromeos recovery images for lack of any other known source, and it
> > > looks a little different than this. Those can be downloaded like so:
> > > https://gist.github.com/jmontleon/8899cb83138f2653f520fbbcc5b830a0
> > >
> > > After placing the topology file you'll see these errors and audio wil=
l
> > > not work until they're also copied in place.
> > > snd_soc_skl 0000:00:1f.3: Direct firmware load for
> > > dsp_lib_dsm_core_spt_release.bin failed with error -2
> > > snd_soc_skl 0000:00:1f.3: Direct firmware load for
> > > intel/dsp_fw_C75061F3-F2B2-4DCC-8F9F-82ABB4131E66.bin failed with
> > > error -2
> > >
> > > Once those were in place, up to 6.0.18 audio worked.
> > >
> > > Is there a better source for the topology file?
> > >
> > >> The reasoning for these asks is fact that problem stopped reproducin=
g on
> > >> our end once we started playing with kernel versions (moved away fro=
m
> > >> status quo with Fedora). Neither on Lukasz EVE nor on my SKL RVP.
> > >> However, we might be using newer configuration files when compared t=
o
> > >> equivalent of yours.
> > >>
> > >> Recent v6.2-rc5 broonie/sound/for-next - no repro
> > >> Our internal tree based on Mark's for-next - no repro
> > >> 6.1.7 stable [1] - no repro
> > >>
> > >> Of course we will continue with our attempts. Will notify about the
> > >> progress.
> > >>
> > >>
> > >> [1]:
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?h=3Dv6.1.7&id=3D21e996306a6afaae88295858de0ffb8955173a15
> > >>
> > >>
> > >> Kind regards,
> > >> Czarek
> > >>
> > >
> > >
> >
> > Hi Jason,
> >
> > as I understand you've tried to do bisect, can you instead try building
> > kernels checking out following tags:
> > v6.1      v6.1.1    v6.1.2    v6.1.3    v6.1.4    v6.1.5    v6.1.6
> > v6.1.7    v6.1.8
> > and report when it stops working, so it narrows scope of what we look
> > at? I assume that kernel builds are done using upstream stable kernel
> > (from https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/=
).
> >
> > Thanks,
> > Amadeusz
> >
> Hi Amadeusz,
> Yes, I did the bisects using
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/
>
> The only thing I did to these was add
> 392cc13c5ec72ccd6bbfb1bc2339502cc59dd285, otherwise audio breaks with
> the dai not registered error message in dmesg from the rt5514 bug from
> 6.0 and up. It wasn't added to 6.1 until rc6, I believe. If there's a
> better way to work around the multiple bugs I can try again, otherwise
> I will start working on builds from tags and see if I learn anything.
>
> FWIW, I've seen two people complain that Arch isn't working either
> since it moved to 6.1. For the one who was trying, patching out the
> commit I came to with the first bisect did not regain them sound like
> it did for me. And yet Sasa reports Slackware is mostly working for
> him with 6.1.8 on Slackware. I don't know what to make of it, but
> thought I'd share in case it helps point someone else to something.
> https://github.com/jmontleon/pixelbook-fedora/issues/51#issuecomment-1410=
222840
> https://github.com/jmontleon/pixelbook-fedora/issues/51#issuecomment-1410=
673371
> https://github.com/jmontleon/pixelbook-fedora/issues/53#issuecomment-1408=
699252
>
> Probably less relevant since they aren't from upstream and I know they
> don't mean as much, but I have tried 6.1.5-6.1.8 Fedora packages for
> certain, and went back trying several others from koji back into rc
> builds, although using prebuilt kernels, anything before 6.1-rc6 won't
> work, as mentioned above. Nothing worked. But as I said I'll build
> from tags and see if I can learn anything.
>
> Thank you,
> Jason Montleon
>
> --
> Jason Montleon        | email: jmontleo@redhat.com
> Red Hat, Inc.         | gpg key: 0x069E3022
> Cell: 508-496-0663    | irc: jmontleo / jmontleon



--=20
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

