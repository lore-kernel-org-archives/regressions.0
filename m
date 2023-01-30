Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4262643
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 10:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675074960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/wXvsciQ0KooaHBSOQrZRetD56/VUpWj90cA08FSe/s=;
	b=IQ3zD6XltGlwWXVE2ZerORI+gydX6zFhIiwUbIYlG7LW1ptKPipaahCLieNp8Lr6Bsa+Eo
	GIvRaY8xfRYUW/GdLqVD38wVexw8nwD8rH34dMH1DERXIWjmKSu/33HsmDO1/u0VcbmudB
	Qiut1eqjfCDiZteTxD+hJtvhyIWJVis=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-Ig1cgeW2NKeNNoijdJ81JQ-1; Mon, 30 Jan 2023 05:35:59 -0500
X-MC-Unique: Ig1cgeW2NKeNNoijdJ81JQ-1
Received: by mail-yb1-f198.google.com with SMTP id g138-20020a25db90000000b0080c27bde887so8787974ybf.18
        for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 02:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wXvsciQ0KooaHBSOQrZRetD56/VUpWj90cA08FSe/s=;
        b=n6I1+v9oWISY3oYsA1z0pAmBrbwQ88Yav4b++aKI/wRdtaI+H5G4rjsh8AzG3WwHiS
         E3yAou1aHmT+dm6IzpVFVjvxUhZeGfmVp45P9iW2Z2DXM0rlrAJLifDPKDaq10WLLl0J
         dXZLq+lmvP9Pyw05NG1jOlfx9PXkMNWwsqnD8QpejaZ8/U+aslwzOgtplskacU4w46B2
         X+WUcuwHxFi1QzAQD2h83AVxJSccxQAHFx3NS3ItMi0YlLqnmcexu45qR6j8PWlgjIBh
         QhCkhEGwvGanA+KsxT796V8ewrcgc+eygnxuXkiQq62kOuitqBGCqL1zZ58z4CyTMVMV
         QszQ==
X-Gm-Message-State: AFqh2krZUjQUM1iSLFq8Ilsz+tyWFfHGuV3pXFZP49TB6Nr0c1gI39at
	btuIaOVMqILRw5COYdogXy3o84pasTgDvRypd32+bmY1MTK0teaCdIP0YAPuR7y216FnC211jvp
	6cxdJeqbfLEVXx+0//U1CebiKERWrBCFKl17KlZM=
X-Received: by 2002:a25:c881:0:b0:7e8:ee11:9717 with SMTP id y123-20020a25c881000000b007e8ee119717mr5586433ybf.495.1675074958755;
        Mon, 30 Jan 2023 02:35:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs3NALW6sRFXMXHjsUm5AoXYtnmMaer0VfPdK6xb8TQcw5A5v00DIlVSANsdRqDaB39Vmu+u8RPCUZpf3gyL2I=
X-Received: by 2002:a25:c881:0:b0:7e8:ee11:9717 with SMTP id
 y123-20020a25c881000000b007e8ee119717mr5586426ybf.495.1675074958451; Mon, 30
 Jan 2023 02:35:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1bb93259-1c9f-5335-a0bf-fc8641b26650@leemhuis.info> <be545e72-8312-f213-0250-86a128b7b629@leemhuis.info>
In-Reply-To: <be545e72-8312-f213-0250-86a128b7b629@leemhuis.info>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 30 Jan 2023 11:35:47 +0100
Message-ID: <CAO-hwJJtK3B2x8CAAYsB41X8D=1EpEYK+nSuVA+fXuz1LHkmSg@mail.gmail.com>
Subject: Re: [Regression] Bug 216885 - HID++ Logitech G903 generates full
 scroll wheel events with every hi-res tick when attached via USB
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>, 
	David Roth <davidroth9@gmail.com>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Tobias Klausmann <klausman@i-no.de>, Linus <luna+bugzilla@cosmos-ink.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 30, 2023 at 10:56 AM Linux kernel regression tracking
(Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>
> [ccing a few people that CCed to the bug]
>
> Hi, this is your Linux kernel regression tracker.
>
> On 05.01.23 09:12, Thorsten Leemhuis wrote:
> > [...] Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216885 :
> >
> >>  David Roth 2023-01-04 20:37:22 UTC
> >>
> >> Created attachment 303526 [details]
> >> Libinput record with G903 attached directly to USB
> >>
> >> Since
> >> https://lore.kernel.org/linux-input/20220914132146.6435-1-hadess@hadess.net/T/#u
> >> my Logitech G903 has gained hi res support. While normally a good
> >> thing, it seems that in this case it leads to generating one normal
> >> REL_WHEEL with each REL_WHEEL_HI_RES event instead of just a couple
> >> of REL_WHEEL_HI_RES, followed by the standard REL_WHEEL once a
> >> notch/tick is reached. This leads to overly sensitive scrolling and
> >> makes the wheel basically useless.
>
> Bastien, Benjamin, Jiri, that problem was reported 25 days ago now and
> there is still no fix in sight afaics (please correct me if I'm wrong)
> -- and based on the reports I've seen it seem quite a few people are
> hitting it. Hence please allow me to ask:
>
> Wouldn't it be best to revert that change for now (both in mainline and
> stable of course) and then reapply it once a fix for this problem is
> available? Or

Last I heard was that Bastien was actively trying to understand the
problem. I do have a G903 here but it is lacking the feature the
reporters have, and so I can not reproduce (there is likely a new
firmware/model around).

After a quick search on
https://support.logi.com/hc/en-us/search#q=G903&s=all it seems that
there are 2 G903: M-R0081 and M-R0068. I only own the 68 one which
explains why I can not reproduce it. :(

Cheers,
Benjamin


>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> >> Interestingly this only happens when the mouse is connected directly via
> >> cable (PID:0xC091) and not via the Lightspeed wireless dongle
> >> (PID:0x4087) where it will lead to correctly applying the times 8
> >> multiplier and the relevant set of HI_RES and REL_WHEEL event once a
> >> notch is reached.
> >>
> >> I originally thought about patching the module/adding a param to simple
> >> disable high res support in general, assuming this might be something
> >> people might want to configure, but seeing that this can be "fixed" that
> >> way I decided to hold off on the thought.
> >>
> >> However it seems like we'd need to trade one set of quirks for another,
> >> so not sure what the correct approach might be.
> >>
> >> I'll attach some libinput debug logs when the issue happens.
> >
> > See the ticket for more details.
> >
> > BTW, let me use this mail to also add the report to the list of tracked
> > regressions to ensure it's doesn't fall through the cracks:
> >
> > #regzbot introduced: 908d325e1665
> > https://bugzilla.kernel.org/show_bug.cgi?id=216885
> > #regzbot title: hid: overly sensitive scrolling with Logitech G903 that
> > makes the wheel basically useless
> > #regzbot ignore-activity
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
>

