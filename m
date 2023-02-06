Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7C55251
	for <regressions@lists.linux.dev>; Mon,  6 Feb 2023 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675691516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9YVDV0WHJtj9goRzXg46j5xnLvIAcC5r2x8qMrbNHdM=;
	b=fMu4Cz2q65rf4U6heqd5fzJjG9sXAFRoQeZd/h/khETI7Op/omHAs2dlT8GJQmizpC293u
	CLkQxw6QJXCvxE5I+PYFZ1S0QwJFSnKdQFpN4IeW6TN3etP9m9iPwi4qF8h69T1z7ZNQhe
	jzXKosI15rqVQtq8Nm8OYcxQJJWhcAs=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-F3IuECoFOFK9wT5HmdQJVQ-1; Mon, 06 Feb 2023 08:51:55 -0500
X-MC-Unique: F3IuECoFOFK9wT5HmdQJVQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-5269bcf4247so70740637b3.17
        for <regressions@lists.linux.dev>; Mon, 06 Feb 2023 05:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YVDV0WHJtj9goRzXg46j5xnLvIAcC5r2x8qMrbNHdM=;
        b=0+X/qpzdo4ly5oTh5kf3r6sxc5EGcdgwSkB4yg7M3GCSSJGAon+yxRtjnt3PMxJx/w
         axVy4SYAPcVIncHPSRKSTFPmE+wDaKoKKw0QMjuW6n6zRjHD46aM9RiXc1/KwGfi2lw6
         pZF9x7ODRJgyOftreu7rjvu7EdOtBJQtbwyYGfs3d8fJdc5bx2VzWfQB74AiFzDPKVWu
         eNRlRYBO0h+5bBmmb+y4L+k48tY+0YKzdZCyMNHeebGM5upjFIUC9nlOmmS1lGAZzmG0
         Mmx/avY9LheXb/icY7qmEudVZ5VJqwmHk6TLqiDRkKYXDodM7bWpZPfHfVHxGlKPLmDR
         FX0w==
X-Gm-Message-State: AO0yUKVfPeiiGeYnZ0Nr6UQJC3hV1845W13V8AaXFG69wZi+iPqfjEHX
	CdP83/ATj4JEiAgmQW1EB8B8zGsgcivC73cDxtN1KdloOpqR1r8INY2rTWWrWvfuMQinJwK/BgH
	a+SrPtcf9NMS75NLTHiNHI0Ux9WtDBmnznNgs+XQ=
X-Received: by 2002:a81:6c86:0:b0:52a:887d:e7f2 with SMTP id h128-20020a816c86000000b0052a887de7f2mr88440ywc.461.1675691514132;
        Mon, 06 Feb 2023 05:51:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZFRiuQygg+ADtAaXAU6Jqau3OUrennznTgJW9/QMu+T7Y3QZWTaGCg7BCvr+e8wcshnrpNhuwAdUBD4xhUt0=
X-Received: by 2002:a81:6c86:0:b0:52a:887d:e7f2 with SMTP id
 h128-20020a816c86000000b0052a887de7f2mr88426ywc.461.1675691513686; Mon, 06
 Feb 2023 05:51:53 -0800 (PST)
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
 <CAJD_bP+RUemsss_YiAZ5v08ak8aTzXCB0gk7q623zyF455bh7g@mail.gmail.com> <a423c627-d303-3b50-5f11-78c06ed3b985@linux.intel.com>
In-Reply-To: <a423c627-d303-3b50-5f11-78c06ed3b985@linux.intel.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Mon, 6 Feb 2023 08:51:42 -0500
Message-ID: <CAJD_bPKO+zCeRojkOr2uY+nXvhsjO3Um86Lh53ZCuCUm3Ci3PA@mail.gmail.com>
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

On Mon, Feb 6, 2023 at 4:04 AM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 2/4/2023 4:16 PM, Jason Montleon wrote:
> > I have built kernels for 6.0.19 (I don't think anyone confirmed
> > whether or not it worked), plus every 6.1 tag from 6.1-rc1 up to
> > 6.1.7. 6.0.19 worked. No 6.1 kernels worked. For rc1 to rc5 I built
> > with and without the legacy dai renaming patch added in rc6 that I
> > believe would be necessary, but it made no difference either way.
>
> Hi,
>
> thank you for trying to narrow it down, if I understand correctly -rc1
> doesn't work, which means that problem was introduced somewhere between
> 6.0 and 6.1-rc1 (just for the sake of being sure, can you test 6.0
> instead of 6.0.19?) There is one commit which I'm bit suspicious about:
> ef6f5494faf6a37c74990689a3bb3cee76d2544c it changes how HDMI are
> assigned and as a machine board present on EVE makes use of HDMI, it may
> potentially cause some problems. Can you try reverting it?
> (If reverting on top of v6.1.8 you need to revert both
> f9aafff5448b1d8d457052271cd9a11b24e4d0bd and
> ef6f5494faf6a37c74990689a3bb3cee76d2544c which has minor conflict,
> easily resolved with just adding both lines.
>

Yes, happy to give that a shot and will report back.

> I also still wonder, why problem reproduces only on some
> distributions... any chance you can try and boot with
> pipewire/pulseaudio disabled and see if it still happens, iirc those
> tools try to check all FEs and this may be breaking something during
> enumeration.

I can definitely try disabling pulseaudio and switching to pipewire
and seeing if anything changes as well.

FWIW, I installed Arch on a thumb drive this weekend and was able to
reproduce the issue and work around it by reverting the commit from my
first bisect. So, for me it behaves just like Fedora. The instructions
for Arch for building a custom kernel are great except they generalize
the bootloader instructions, so you need to know what to do at the end
to add the grub boot entries, if using grub for example, and I suspect
that may be where the confusion came from, though I don't know. I'm
trying to get one of the two to reproduce my results to confirm and at
least get them a workaround.

I have slackware on another thumb drive already, but I have yet to
even get it updated to 6.1.8.

If any of them behave differently I was hoping to tease out whether
it's firmware, kernel config, or something else, but so far the first
has been more of the same.

> Thanks,
> Amadeusz
>
> >
> > On Wed, Feb 1, 2023 at 9:33 AM Jason Montleon <jmontleo@redhat.com> wro=
te:
> >>
> >> On Wed, Feb 1, 2023 at 6:05 AM Amadeusz S=C5=82awi=C5=84ski
> >> <amadeuszx.slawinski@linux.intel.com> wrote:
> >>>
> >>> On 1/31/2023 4:16 PM, Jason Montleon wrote:
> >>>> On Tue, Jan 31, 2023 at 7:37 AM Cezary Rojewski
> >>>> <cezary.rojewski@intel.com> wrote:
> >>>>>
> >>>>> On 2023-01-30 1:22 PM, Sasa Ostrouska wrote:
> >>>>>
> >>>>>> Dear Czarek, many thanks for the answer and taking care of it. If
> >>>>>> needed something from my side please jest let me know
> >>>>>> and I will try to do it.
> >>>>>
> >>>>>
> >>>>> Hello Sasa,
> >>>>>
> >>>>> Could you provide us with the topology and firmware binary present =
on
> >>>>> your machine?
> >>>>>
> >>>>> Audio topology is located at /lib/firmware and named:
> >>>>>
> >>>>> 9d71-GOOGLE-EVEMAX-0-tplg.bin
> >>>>> -or-
> >>>>> dfw_sst.bin
> >>>>>
> >>>>> Firmware on the other hand is found in /lib/firmware/intel/.
> >>>>> 'dsp_fw_kbl.bin' will lie there, it shall be a symlink pointing to =
an
> >>>>> actual AudioDSP firmware binary.
> >>>>>
> >>>> Maybe this is the problem.
> >>>>
> >>>> I think most of us are pulling the topology and firmware from the
> >>>> chromeos recovery images for lack of any other known source, and it
> >>>> looks a little different than this. Those can be downloaded like so:
> >>>> https://gist.github.com/jmontleon/8899cb83138f2653f520fbbcc5b830a0
> >>>>
> >>>> After placing the topology file you'll see these errors and audio wi=
ll
> >>>> not work until they're also copied in place.
> >>>> snd_soc_skl 0000:00:1f.3: Direct firmware load for
> >>>> dsp_lib_dsm_core_spt_release.bin failed with error -2
> >>>> snd_soc_skl 0000:00:1f.3: Direct firmware load for
> >>>> intel/dsp_fw_C75061F3-F2B2-4DCC-8F9F-82ABB4131E66.bin failed with
> >>>> error -2
> >>>>
> >>>> Once those were in place, up to 6.0.18 audio worked.
> >>>>
> >>>> Is there a better source for the topology file?
> >>>>
> >>>>> The reasoning for these asks is fact that problem stopped reproduci=
ng on
> >>>>> our end once we started playing with kernel versions (moved away fr=
om
> >>>>> status quo with Fedora). Neither on Lukasz EVE nor on my SKL RVP.
> >>>>> However, we might be using newer configuration files when compared =
to
> >>>>> equivalent of yours.
> >>>>>
> >>>>> Recent v6.2-rc5 broonie/sound/for-next - no repro
> >>>>> Our internal tree based on Mark's for-next - no repro
> >>>>> 6.1.7 stable [1] - no repro
> >>>>>
> >>>>> Of course we will continue with our attempts. Will notify about the
> >>>>> progress.
> >>>>>
> >>>>>
> >>>>> [1]:
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/co=
mmit/?h=3Dv6.1.7&id=3D21e996306a6afaae88295858de0ffb8955173a15
> >>>>>
> >>>>>
> >>>>> Kind regards,
> >>>>> Czarek
> >>>>>
> >>>>
> >>>>
> >>>
> >>> Hi Jason,
> >>>
> >>> as I understand you've tried to do bisect, can you instead try buildi=
ng
> >>> kernels checking out following tags:
> >>> v6.1      v6.1.1    v6.1.2    v6.1.3    v6.1.4    v6.1.5    v6.1.6
> >>> v6.1.7    v6.1.8
> >>> and report when it stops working, so it narrows scope of what we look
> >>> at? I assume that kernel builds are done using upstream stable kernel
> >>> (from https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.gi=
t/).
> >>>
> >>> Thanks,
> >>> Amadeusz
> >>>
> >> Hi Amadeusz,
> >> Yes, I did the bisects using
> >> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/
> >>
> >> The only thing I did to these was add
> >> 392cc13c5ec72ccd6bbfb1bc2339502cc59dd285, otherwise audio breaks with
> >> the dai not registered error message in dmesg from the rt5514 bug from
> >> 6.0 and up. It wasn't added to 6.1 until rc6, I believe. If there's a
> >> better way to work around the multiple bugs I can try again, otherwise
> >> I will start working on builds from tags and see if I learn anything.
> >>
> >> FWIW, I've seen two people complain that Arch isn't working either
> >> since it moved to 6.1. For the one who was trying, patching out the
> >> commit I came to with the first bisect did not regain them sound like
> >> it did for me. And yet Sasa reports Slackware is mostly working for
> >> him with 6.1.8 on Slackware. I don't know what to make of it, but
> >> thought I'd share in case it helps point someone else to something.
> >> https://github.com/jmontleon/pixelbook-fedora/issues/51#issuecomment-1=
410222840
> >> https://github.com/jmontleon/pixelbook-fedora/issues/51#issuecomment-1=
410673371
> >> https://github.com/jmontleon/pixelbook-fedora/issues/53#issuecomment-1=
408699252
> >>
> >> Probably less relevant since they aren't from upstream and I know they
> >> don't mean as much, but I have tried 6.1.5-6.1.8 Fedora packages for
> >> certain, and went back trying several others from koji back into rc
> >> builds, although using prebuilt kernels, anything before 6.1-rc6 won't
> >> work, as mentioned above. Nothing worked. But as I said I'll build
> >> from tags and see if I can learn anything.
> >>
> >> Thank you,
> >> Jason Montleon
> >>
> >> --
> >> Jason Montleon        | email: jmontleo@redhat.com
> >> Red Hat, Inc.         | gpg key: 0x069E3022
> >> Cell: 508-496-0663    | irc: jmontleo / jmontleon
> >
> >
> >
>


--
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

