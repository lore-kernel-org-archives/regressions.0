Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB3015A4;
	Sun,  2 Oct 2022 08:53:22 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id s9so5187670qkg.4;
        Sun, 02 Oct 2022 01:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Dg8wAyXlxOGTFI2BY11fpPc+9jHYON03ZefK5xf63Fg=;
        b=iuycntbGKvahOBPP/DpUQiF1SbYvo5Bym+t8AR3/u134XG0BLp1CQOjDa9NPqK63Je
         rb14sOB7/E9spUy1T/pSHrEv0ysKHw6ILwy6b4EfzVFI13ZPIxBUwV/XCbvYw7owmDy0
         8hNADahARs6PV/4FhoscA2i/GMgpTJ3zdmC10ZEQX+j5/kKXeojQIafiLcC9pnxQ6uhO
         wdy/mbwB6J55iRnkNkmZB4lO1FUV34iVlsyHoDJFKW6sbjRWI+7obMXtuPQDMT9M8kHf
         G77xNvdeC3VOrLcin8ViR3n5J2UoQDV3CIowz8XRMBCvC93YPf433MFsZIIIL8C6DrSO
         wnzQ==
X-Gm-Message-State: ACrzQf2HWcx05RwPkH6GcPclh0lrMKBNqwpZ/TQBaFh632wyE1mOAP7D
	1NSOAIaazqjDQRd6DrDck3CnhFB0a3xRTQ==
X-Google-Smtp-Source: AMsMyM644YFzFGT3l1MxmVy9Snbhqvw2c1CpEO2f71rTbFqSzA5aB6iRI7buZkt6OT6jVyvi0e7sxw==
X-Received: by 2002:a37:648f:0:b0:6d1:debe:4c9a with SMTP id y137-20020a37648f000000b006d1debe4c9amr5636804qkb.502.1664700801616;
        Sun, 02 Oct 2022 01:53:21 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id u22-20020a05620a431600b006af1f0af045sm8551673qko.107.2022.10.02.01.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Oct 2022 01:53:21 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-3573ed7cc15so37394957b3.1;
        Sun, 02 Oct 2022 01:53:21 -0700 (PDT)
X-Received: by 2002:a81:a24e:0:b0:358:934b:980c with SMTP id
 z14-20020a81a24e000000b00358934b980cmr3246499ywg.383.1664700800822; Sun, 02
 Oct 2022 01:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info> <9a2fdff8-d0d3-ebba-d344-3c1016237fe5@gmx.com>
 <87pmfavfpt.wl-tiwai@suse.de> <56a04cae-7240-9005-4931-5b3e9f598ffb@gmx.com>
In-Reply-To: <56a04cae-7240-9005-4931-5b3e9f598ffb@gmx.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 2 Oct 2022 10:53:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuEnfOkbw2zYXBS+WSZbrkajAPFoYVGFAZBuXK+ac8oA@mail.gmail.com>
Message-ID: <CAMuHMdVuEnfOkbw2zYXBS+WSZbrkajAPFoYVGFAZBuXK+ac8oA@mail.gmail.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla blues"
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Takashi Iwai <tiwai@suse.de>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Artem,

On Sun, Oct 2, 2022 at 10:23 AM Artem S. Tashkinov <aros@gmx.com> wrote:
> On 10/2/22 07:37, Takashi Iwai wrote:
> > On Sat, 01 Oct 2022 12:30:22 +0200,
> > Artem S. Tashkinov wrote:
> >> Here's another one which is outright puzzling:
> >>
> >> You run: dmesg -t --level=emerg,crit,err
> >>
> >> And you see some non-descript errors of some kernel subsystems seemingly
> >> failing or being unhappy about your hardware. Errors are as cryptic as
> >> humanly possible, you don't even know what part of kernel has produced them.
> >>
> >> OK, as a "power" user I download the kernel source, run `grep -R message
> >> /tmp/linux-5.19` and there are _multiple_ different modules and places
> >> which contain this message.
> >>
> >> I'm lost. Send this to LKML? Did that in the long past, no one cared, I
> >> stopped.
> >>
> >> Here's what I'm getting with Linux 5.19.12:
> >>
> >> platform wdat_wdt: failed to claim resource 5: [mem
> >> 0x00000000-0xffffffff7fffffff]
> >> ACPI: watchdog: Device creation failed: -16
> >> ACPI BIOS Error (bug): Could not resolve symbol
> >> [\_SB.PCI0.XHC.RHUB.TPLD], AE_NOT_FOUND (20220331/psargs-330)
> >> ACPI Error: Aborting method \_SB.UBTC.CR01._PLD due to previous error
> >> (AE_NOT_FOUND) (20220331/psparse-529)
> >> platform MSFT0101:00: failed to claim resource 1: [mem
> >> 0xfed40000-0xfed40fff]
> >> acpi MSFT0101:00: platform device creation failed: -16
> >> lis3lv02d: unknown sensor type 0x0
> >>
> >> Are they serious? Should they be reported or not? Is my laptop properly
> >> working? I have no clue at all.
> >
> > That's a dilemma.  The kernel can't know whether it's "properly"
> > working, either -- that is, whether the lack of some functions matters
> > for you or not.  In your case above, it's about a watchdog, something
> > related with USB, TPM, and acceleration sensor, all of which likely
> > come from a buggy BIOS.  Would you mind if those features are missing?
> > Or even whether your device has a correct hardware implementation?
> > Kernel doesn't know, hence it complains as an error.
> >
> > In many drivers, there are mechanisms to shut off superfluous error
> > messages for known devices.  So it's case-by-case solutions.
> >
> > Or you can completely hide those errors at boot by a boot option
> > (e.g. loglevel=2).
>
> The problem is some of such messages are indeed indicative of certain
> real issues which result in HW not working properly, including:
>
> 1) missing/incorrect firmware
> 2) most importantly: not enabled power saving modes
> 3) not enabled high performance modes
> 4) not enabled devices
> 5) not enabled devices' functions
> 6) drivers conflicts (i.e. the wrong module gets loaded for the device)
> 7) physically failing hardware
>
> I'm quite sure you don't really know what half of those messages
> actually mean.
>
> Speaking of 7. Various kernel subsystems/drivers deal with e.g. mass
> storage which is known to fail quite often. There's not a single driver
> in the kernel which is actually brave enough to spew something like this:
>
> "/dev/xxxx might be failing, please RMA or seek help online"
>
> instead you get a dmesg choke full of "unable to read sector XXX" or
> something like that.
>
> To return to the previous errors: it's impossible for the user to assess
> their severity and that sucks. What is "platform device creation
> failed"? What is "unknown sensor type"? What am I missing? Who's
> responsible? The kernel? My HW vendor? Are those errors actionable? In
> my understanding a properly working computer must not produce
> "emerg,crit,err" errors. I'm not even talking about "warn,info" and such.

I am afraid that for most of the above, the kernel cannot know the
answer.  Hence more investigation/debugging is needed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
