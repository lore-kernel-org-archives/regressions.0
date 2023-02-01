Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5495F7F4
	for <regressions@lists.linux.dev>; Wed,  1 Feb 2023 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675262037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQV4MSRR5AyeZEpBORcUlNAjy632Kxh6QOq4hbhVmNQ=;
	b=axWqrP7zbDIYGEFkKEZ9pAgfOxQ5ExUAM9G9gg4gQbgHqfZ2iO9D37T1HpcrtK/iTfgA0s
	2y+e8fsjaJR5GeoHSdU4W5y2/KGCqP6HcEfzeGJ6KFq/SusTfUTWxHBgo02MXaSwQGF/RI
	xUfMQ1d8ouwcwQoqtUmBOU3zHur7dQA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-XLJ2FKArPJGkCBih3q68Kw-1; Wed, 01 Feb 2023 09:33:56 -0500
X-MC-Unique: XLJ2FKArPJGkCBih3q68Kw-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-50fe0b4495cso121525867b3.14
        for <regressions@lists.linux.dev>; Wed, 01 Feb 2023 06:33:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQV4MSRR5AyeZEpBORcUlNAjy632Kxh6QOq4hbhVmNQ=;
        b=2skW/lcHy7ualhcUN9mfpUhqIkbIjWRBwpkfjvaQ4sILMCNxFOtaob4dzbF7lw1IZe
         ayya3de8Q/hn+MGx1l7ulZ0kN++YgwxvFNjtExUspckK/7rfCZUkUR+TpPmPK6kmPz6H
         ipO3ySrLFyb+xcaWsfUwdiwtS9FBN4MSKw0KU3OI4S3350EbPGclLj/3qYmgqqYFrHyA
         0AqemQA/VV0IdFLaF85qeWq4Ng7D/woxbhIoxxBzdL/T/aAMjGWtN/3bMbcmt8Mnigb6
         tv5SteDJXIgOKUaQc0zGPZtCa6mFLtyHtMEOEWJa0yaonR0C9AE8fLKzr47Rh2+XqLBo
         oLow==
X-Gm-Message-State: AO0yUKWEGmELLU1ZzwjxZBgdeONAe93TmWeo5QzWptlT9wERdEtV6abB
	q8Q8uwfWOtlfJxnAgQr1nkuoNqM32zyuhL3cUo3xMzQxM3BCC3C9GVgL1sGZBqdckODmDLaSFvq
	+ENQ0riztHZh9VHNeQ5AMZh2WYva7KXNtRrmNYEo=
X-Received: by 2002:a81:a204:0:b0:51c:2c61:8c9f with SMTP id w4-20020a81a204000000b0051c2c618c9fmr288752ywg.5.1675262034775;
        Wed, 01 Feb 2023 06:33:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+Pa5hOTLw/v3C7ub4sGvVIlhED9LaoJ7haug72PIG1FuUjVpf37Cm5B5jCLXGJDOamuuBgOGEITTKn8R07gTM=
X-Received: by 2002:a81:a204:0:b0:51c:2c61:8c9f with SMTP id
 w4-20020a81a204000000b0051c2c618c9fmr288749ywg.5.1675262034488; Wed, 01 Feb
 2023 06:33:54 -0800 (PST)
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
 <6262bd72-cc2b-9d2a-e8f0-55c2b2bb7861@linux.intel.com>
In-Reply-To: <6262bd72-cc2b-9d2a-e8f0-55c2b2bb7861@linux.intel.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Wed, 1 Feb 2023 09:33:43 -0500
Message-ID: <CAJD_bPKxbsDi10FGX2mrMeuxcphDOvO8Q87j+AvnnQpe5cvmSA@mail.gmail.com>
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

On Wed, Feb 1, 2023 at 6:05 AM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 1/31/2023 4:16 PM, Jason Montleon wrote:
> > On Tue, Jan 31, 2023 at 7:37 AM Cezary Rojewski
> > <cezary.rojewski@intel.com> wrote:
> >>
> >> On 2023-01-30 1:22 PM, Sasa Ostrouska wrote:
> >>
> >>> Dear Czarek, many thanks for the answer and taking care of it. If
> >>> needed something from my side please jest let me know
> >>> and I will try to do it.
> >>
> >>
> >> Hello Sasa,
> >>
> >> Could you provide us with the topology and firmware binary present on
> >> your machine?
> >>
> >> Audio topology is located at /lib/firmware and named:
> >>
> >> 9d71-GOOGLE-EVEMAX-0-tplg.bin
> >> -or-
> >> dfw_sst.bin
> >>
> >> Firmware on the other hand is found in /lib/firmware/intel/.
> >> 'dsp_fw_kbl.bin' will lie there, it shall be a symlink pointing to an
> >> actual AudioDSP firmware binary.
> >>
> > Maybe this is the problem.
> >
> > I think most of us are pulling the topology and firmware from the
> > chromeos recovery images for lack of any other known source, and it
> > looks a little different than this. Those can be downloaded like so:
> > https://gist.github.com/jmontleon/8899cb83138f2653f520fbbcc5b830a0
> >
> > After placing the topology file you'll see these errors and audio will
> > not work until they're also copied in place.
> > snd_soc_skl 0000:00:1f.3: Direct firmware load for
> > dsp_lib_dsm_core_spt_release.bin failed with error -2
> > snd_soc_skl 0000:00:1f.3: Direct firmware load for
> > intel/dsp_fw_C75061F3-F2B2-4DCC-8F9F-82ABB4131E66.bin failed with
> > error -2
> >
> > Once those were in place, up to 6.0.18 audio worked.
> >
> > Is there a better source for the topology file?
> >
> >> The reasoning for these asks is fact that problem stopped reproducing =
on
> >> our end once we started playing with kernel versions (moved away from
> >> status quo with Fedora). Neither on Lukasz EVE nor on my SKL RVP.
> >> However, we might be using newer configuration files when compared to
> >> equivalent of yours.
> >>
> >> Recent v6.2-rc5 broonie/sound/for-next - no repro
> >> Our internal tree based on Mark's for-next - no repro
> >> 6.1.7 stable [1] - no repro
> >>
> >> Of course we will continue with our attempts. Will notify about the
> >> progress.
> >>
> >>
> >> [1]:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commi=
t/?h=3Dv6.1.7&id=3D21e996306a6afaae88295858de0ffb8955173a15
> >>
> >>
> >> Kind regards,
> >> Czarek
> >>
> >
> >
>
> Hi Jason,
>
> as I understand you've tried to do bisect, can you instead try building
> kernels checking out following tags:
> v6.1      v6.1.1    v6.1.2    v6.1.3    v6.1.4    v6.1.5    v6.1.6
> v6.1.7    v6.1.8
> and report when it stops working, so it narrows scope of what we look
> at? I assume that kernel builds are done using upstream stable kernel
> (from https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/).
>
> Thanks,
> Amadeusz
>
Hi Amadeusz,
Yes, I did the bisects using
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/

The only thing I did to these was add
392cc13c5ec72ccd6bbfb1bc2339502cc59dd285, otherwise audio breaks with
the dai not registered error message in dmesg from the rt5514 bug from
6.0 and up. It wasn't added to 6.1 until rc6, I believe. If there's a
better way to work around the multiple bugs I can try again, otherwise
I will start working on builds from tags and see if I learn anything.

FWIW, I've seen two people complain that Arch isn't working either
since it moved to 6.1. For the one who was trying, patching out the
commit I came to with the first bisect did not regain them sound like
it did for me. And yet Sasa reports Slackware is mostly working for
him with 6.1.8 on Slackware. I don't know what to make of it, but
thought I'd share in case it helps point someone else to something.
https://github.com/jmontleon/pixelbook-fedora/issues/51#issuecomment-141022=
2840
https://github.com/jmontleon/pixelbook-fedora/issues/51#issuecomment-141067=
3371
https://github.com/jmontleon/pixelbook-fedora/issues/53#issuecomment-140869=
9252

Probably less relevant since they aren't from upstream and I know they
don't mean as much, but I have tried 6.1.5-6.1.8 Fedora packages for
certain, and went back trying several others from koji back into rc
builds, although using prebuilt kernels, anything before 6.1-rc6 won't
work, as mentioned above. Nothing worked. But as I said I'll build
from tags and see if I can learn anything.

Thank you,
Jason Montleon

--=20
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

