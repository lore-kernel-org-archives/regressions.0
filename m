Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDDF6FD6
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667481637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ovqy3PKqpWLl3OLA2y49toePIlWwBHL4i7iH80Fhx1A=;
	b=Pc+3xoTIHow8agTJUyepPIqHvREElBcxBraIdKWl5i2ukixdZX/CJKaDySwX2wOWQ5rcHF
	Vkr/xcgLiUcOkZIOPm1XX8yCDa4Wg+2SH8SyrIdxrrYswns6/dCN0NBSwo5/dPYOEQ2pR2
	rOH3Cp0GKo1y77IZWI8oCkDl6EzNAjk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-PcTMeYhUNpmBWWPlQSUVXQ-1; Thu, 03 Nov 2022 09:20:36 -0400
X-MC-Unique: PcTMeYhUNpmBWWPlQSUVXQ-1
Received: by mail-ej1-f71.google.com with SMTP id nc4-20020a1709071c0400b0078a5ceb571bso1233483ejc.4
        for <regressions@lists.linux.dev>; Thu, 03 Nov 2022 06:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ovqy3PKqpWLl3OLA2y49toePIlWwBHL4i7iH80Fhx1A=;
        b=JrZMladpmRr/J0iyLGeWSCAZNYh9HGqkZ031V7z/zvGc7e4DwmUbHvBZeFxEhCDtXz
         f1hYZZX5iMDMX9oX4TiiiYC2tpK8vyQLn5CJ765R5P3E7gUCWja+7CXMc3L8H/6S2Pjf
         iqcBb7RuCnZhvGAGb3qwdEs575W2F224YLupyYh7tG7sQA/OxsqVLE5s+TccQzvAWdya
         BSnfaEFYjJ2UtrEwglmx5h2VQWb1Sa1+ehVRDurdGMIUZM0NJ7hLPGgfFg4TLt+MU5oN
         a7TvKbw3gs7hEoiojygdv1rln9OlJtAC6qKhTsQ0waHfdeyou8KWYIY0kfwNiOjtT5VE
         S+LQ==
X-Gm-Message-State: ACrzQf3wDn0Fm+s6/fTVbEfhneko9eXdGlw27sXFqUqJvv38tqIFG5KH
	xsb8hyidDBuU9vSfq4ZsLdZqtFbvwe/+YL/hHwuhJUm5nBMSJ9XECLmxk6URNd+HTpm/QjQ7Bcv
	R5hhtB/qCj+XuFVzYQLO7ZhMx2qH5H9EvlbWXkII=
X-Received: by 2002:a05:6402:1f84:b0:455:27b8:27aa with SMTP id c4-20020a0564021f8400b0045527b827aamr29906956edc.243.1667481634779;
        Thu, 03 Nov 2022 06:20:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4dSB/hFIGGg1daX/q2zXyhPTYqElWsOtD88QnVjE0ODSW0gMPiK5a6qFiztqjoR9Qd074eUZEbeRxeQ1+egl8=
X-Received: by 2002:a05:6402:1f84:b0:455:27b8:27aa with SMTP id
 c4-20020a0564021f8400b0045527b827aamr29906933edc.243.1667481634528; Thu, 03
 Nov 2022 06:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221102200527.4174076-1-jmontleo@redhat.com> <2bbe7bed-21d4-018a-8957-10d9dbe0c661@linux.intel.com>
 <87a658o4e0.wl-tiwai@suse.de> <20221103095404.GI92394@ediswmail.ad.cirrus.com>
 <87v8nwmgso.wl-tiwai@suse.de>
In-Reply-To: <87v8nwmgso.wl-tiwai@suse.de>
From: Jason Montleon <jmontleo@redhat.com>
Date: Thu, 3 Nov 2022 09:20:23 -0400
Message-ID: <CAJD_bPJet1Mk3mCrZc4eJm1gP=kk91VgmY-zMRFq5jxSQvBUPQ@mail.gmail.com>
Subject: Re: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression
To: Takashi Iwai <tiwai@suse.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, regressions@lists.linux.dev, 
	oder_chiou@realtek.com, cezary.rojewski@intel.com, 
	alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, 
	Takashi Iwai <tiwai@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Thanks all for the feedback. I've adjusted the commit message as
asked, and updated rt5677-spi as well. From what I think I can see in
past commits it looks like separate drivers are done with separate
commits/patches. I didn't see any additional comments whether
endianness should or shouldn't also be set so I left it off. I can
make another updated if necessary.

I apologize if I'm mucking it up, This is my first kernel patch,
trying to follow along and do things right.

On Thu, Nov 3, 2022 at 7:14 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 03 Nov 2022 10:54:04 +0100,
> Charles Keepax wrote:
> >
> > On Thu, Nov 03, 2022 at 08:59:03AM +0100, Takashi Iwai wrote:
> > > On Wed, 02 Nov 2022 23:05:14 +0100,
> > > Pierre-Louis Bossart wrote:
> > > >
> > > > On 11/2/22 16:05, Jason Montleon wrote:
> > > > > Starting with 6.0-rc1 these messages are logged and the sound card
> > > > > is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
> > > > > it to function properly again.
> > > > >
> > > > > [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
> > > > > spi-PRP0001:00 not registered
> > > > > [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> > > >
> > > > Thanks for reporting this regression, much appreciated.
> > > >
> > > > a) you need to CC: maintainers Mark Brown and Takashi Iwai
> > > > b) the commit title should be something like "ASoC: rt5514: fix legacy
> > > > dai naming".
> > > > c) it's not clear if this is actually enough. there's no
> > > > legacy_dai_naming for e.g. rt5663 and the .endianness member is not set.
> > >
> > > IIUC, rt5663.c should be fine; it used to have non_legacy_dai_naming
> > > flag and it was dropped after the switch.
> > >
> > > But, through a quick glance, rt5677-spi.c seems to be the same pattern
> > > as rt5514-spi.c.  The rt5677.c was covered properly but the *-spi.c
> > > wan't.
> > >
> >
> > Yeah I think these got missed as they are effectively CPU side
> > devices but living in the CODEC space. Looks like it would be
> > reasonable to add legacy_dai_naming to both of them to me.
>
> BTW, the bug was reported on bugzilla:
>   https://bugzilla.kernel.org/show_bug.cgi?id=216641
>
> Please respond on there and add the link to the fix patch, too.
>
>
> thanks,
>
> Takashi
>
> >
> > Thanks,
> > Charles
> >
> > > > >  static const struct snd_soc_component_driver rt5514_spi_component = {
> > > > > -       .name           = DRV_NAME,
> > > > > -       .probe          = rt5514_spi_pcm_probe,
> > > > > -       .open           = rt5514_spi_pcm_open,
> > > > > -       .hw_params      = rt5514_spi_hw_params,
> > > > > -       .hw_free        = rt5514_spi_hw_free,
> > > > > -       .pointer        = rt5514_spi_pcm_pointer,
> > > > > -       .pcm_construct  = rt5514_spi_pcm_new,
> > > > > +       .name                   = DRV_NAME,
> > > > > +       .probe                  = rt5514_spi_pcm_probe,
> > > > > +       .open                   = rt5514_spi_pcm_open,
> > > > > +       .hw_params              = rt5514_spi_hw_params,
> > > > > +       .hw_free                = rt5514_spi_hw_free,
> > > > > +       .pointer                = rt5514_spi_pcm_pointer,
> > > > > +       .pcm_construct          = rt5514_spi_pcm_new,
> > > > > +       .legacy_dai_naming      = 1,
> > > > >  };
> > > > >
> > > > >  /**
> > > >
> >
>


-- 
Jason Montleon        | email: jmontleo@redhat.com
Red Hat, Inc.         | gpg key: 0x069E3022
Cell: 508-496-0663    | irc: jmontleo / jmontleon

