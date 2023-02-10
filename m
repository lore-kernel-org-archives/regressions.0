Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C229B2
	for <regressions@lists.linux.dev>; Fri, 10 Feb 2023 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676041025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oEOymRRxSv7u9Ork8A05joGPvZPnO7Rh5Oh4a1kzpGg=;
	b=Q8IywdB4dFNSzbFr6yVVD5QyFCRHHEpY2GsCy9+O+XYXx1kilp76DnLfG575DUBZYNh3xh
	bjHHSPAxR6sWVG2aVaB1QWppeOu06rZmZ+lJudRQx2xqDB3nx2vhsjYNLcA+h3PeU7fe5x
	peqnPxe1EESqOJxFMp3RISQmO6nHUPQ=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-IuR4IYYCMce9QrKeQYfPXA-1; Fri, 10 Feb 2023 09:57:04 -0500
X-MC-Unique: IuR4IYYCMce9QrKeQYfPXA-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-52eb75aeecdso43596957b3.13
        for <regressions@lists.linux.dev>; Fri, 10 Feb 2023 06:57:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEOymRRxSv7u9Ork8A05joGPvZPnO7Rh5Oh4a1kzpGg=;
        b=G8IL9UuEVyPqVJv0jHUCOuwaP9Sbj75YSzCLvboD/mQIum5J/fApb2AmbMAdBet3hr
         XlV9d/y26NlC2LD9XQXFPUdFnQOpKXJBDFkVGCjF8vc7hL87dD0WBefApi5ftnRfx/cx
         jjEpPDcvOr2j4O+Q7+ISZZOHqf1ACWZPTxaySDgCTGeZ0u+7gHfEDrMonoHquE7HJUUv
         f09Yb0fEjiWm/1IrNkgqdlGDmOmhok5gJ32XOv3FepU2BtM+9V9CqVcvXpTWKpSBWIEh
         qbcFdQepADk7OtEL16ZRjC94yJbD1QaYgJUqfPrehUxbO/TXAXvcHblqXN4gYLEASvh5
         QbGA==
X-Gm-Message-State: AO0yUKVpEGjrfyDjytPXYj+ftEBD0qIvErUz0nTuW7pxrdzMJ8L8SiEM
	CoArlfcp8C7ct3yKBG03TCPP5Dhi8QXphpjNNwL1Ojy8pLh9QeruoLJjWKn7yXUWUTi5ql9M+z6
	vNLzi4faijdN6X5hfmgGCSjTGF2DmvUAErm3+ipY=
X-Received: by 2002:a0d:e484:0:b0:50a:87fe:1e45 with SMTP id n126-20020a0de484000000b0050a87fe1e45mr1888911ywe.338.1676041023322;
        Fri, 10 Feb 2023 06:57:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+JL2W1ZKEsZKTguBU3eOVEX+eQb3ZnucpqVhlAN00MqkZvQCvEFO8pihQDS5kQ0zkB8dow7X4GBJ3BtjZJ6Es=
X-Received: by 2002:a0d:e484:0:b0:50a:87fe:1e45 with SMTP id
 n126-20020a0de484000000b0050a87fe1e45mr1888908ywe.338.1676041023043; Fri, 10
 Feb 2023 06:57:03 -0800 (PST)
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
 <CAJD_bP+RUemsss_YiAZ5v08ak8aTzXCB0gk7q623zyF455bh7g@mail.gmail.com>
 <a423c627-d303-3b50-5f11-78c06ed3b985@linux.intel.com> <CAJD_bPKO+zCeRojkOr2uY+nXvhsjO3Um86Lh53ZCuCUm3Ci3PA@mail.gmail.com>
 <CAJD_bPJfT5DA8EdN+timzXa3-itnPD5epq552S=NQ6Spr7iTUw@mail.gmail.com>
 <CAJD_bPLHPfLO=192Ohrxvg5OGtAfAgTim0O+fdmxo753VS83iQ@mail.gmail.com> <478bb609-8615-31b4-e6f3-8eaaf95b84d6@intel.com>
In-Reply-To: <478bb609-8615-31b4-e6f3-8eaaf95b84d6@intel.com>
From: Jason Montleon <jmontleo@redhat.com>
Date: Fri, 10 Feb 2023 09:56:51 -0500
Message-ID: <CAJD_bPKiT91yx9FJNS3VEU2JemJvBtUW-4idWXBSy1hzfz8bsQ@mail.gmail.com>
Subject: Re: Google Pixelbook EVE, no sound in kernel 6.1.x
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Sasa Ostrouska <casaxa@gmail.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, 
	lma@semihalf.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	stable@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 10, 2023 at 8:10 AM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2023-02-09 5:13 PM, Jason Montleon wrote:
> > I've done some more digging. The only line that needs to be reverted
> > from f2bd1c5ae2cb0cf9525c9bffc0038c12dd7e1338, moving from
> > snd_hda_codec_device_init back to snd_hda_codec_device_new is:
> > codec->core.exec_verb = codec_exec_verb;
> > (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/sound/pci/hda/hda_codec.c?h=v6.1.11#n931)
> >
> > I added a bunch of debug statements and all the code in
> > codec_exec_verb runs at boot with this in snd_hda_codec_device_init,
> > whereas it does not when in snd_hda_codec_device_new.
> >
> >  From what I can tell we end up in snd_hda_power_up_pm and then get
> > hung up at snd_hdac_power_up.
> >
> > There are a bunch of pin port messages that show up from
> > hdac_hdmi_query_port_connlist when things are working, that never
> > appear when broken:
> > [   14.618805] HDMI HDA Codec ehdaudio0D2: No connections found for pin:port 5:0
> > [   14.619242] HDMI HDA Codec ehdaudio0D2: No connections found for pin:port 5:1
> > [   14.619703] HDMI HDA Codec ehdaudio0D2: No connections found for pin:port 5:2
> > ...
> >
> > I do see hdac_hdmi_runtime_suspend run a moment before things go bad,
> > but I have no idea if it is related.
> >
> > Without patching anything and CONFIG_PM unset everything works.
> >
> > I don't know if that helps anyone see where the problem is. If not
> > I'll keep plugging away.
> >
> > Incidentally, commit 3fd63658caed9494cca1d4789a66d3d2def2a0ab, pointed
> > to by my second bisect, starts making using of skl_codec_device_init
> > where I believe snd_hda_codec_device_init is called and starts the
> > problem. I believe this is why reverting either of the two works
> > around the problem.
>
>
> This is some exceptional debugging, Jason.
>
> I believe this finding reveals a long standing problem that was covered
> by a very specific codec-fields initialization order:
>
> During initial part of codec-device initialization, VERBs execution
> follows different flow than one happening once the device is fully
> initialized. This comes down to the if-statement preset in
> snd_hdac_exec_verb() and the fact codec_exec_verb() differs from
> snd_hdac_bus_exec_verb() in PM-handling - the latter is devoid of it.
>

Thank you for the explanation! I was not following this well, but it
makes sense to me now.

> That is until ->exec_verb gets initialized and codec_exec_verb() becomes
> the sole handler of VERB execution process. As PM is not yet configured
> at the time - snd_hda_codec_device_init() happens early, whereas PM
> configuration is done later with snd_hda_set_power_save() during
> skl_hda_audio_probe() in sound/soc/intel/boards/skl_hda_dsp_generic.c -
> it should not be touched yet.
>
> I'm up for reverting this single line to where it was before the
> offending patch. We still want to avoid the page fault the very patch is
> addressing.
>
> Does the proposed change address both problems? i.e. no sound and hang
> during shutdown?

Yes, moving the one line back fixes both the no sound and shutdown hang.

Thank you!
Jason Montleon

>
> Kind regards,
> Czarek
>



--
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

