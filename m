Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44966323D
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677590798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0nflL+RFyijy+MOrYN/ocNgDme0JSg3TrgUceQka/qA=;
	b=iwe2ynDD+3rCGMnUfHuZNXtrbqv80wXOSpPB2xgOdSxdLMVlcH7aF1WoJ9qTegwdvSLetR
	6QpK9hrCklFgCNHD5Eu5LEL2o/4OaCjZoWItGKqBIRWaZUTlAcOy5QyPdRprfs2qWT3n8v
	YAY8u9M1th5jd/BXUZjSB6mYBFuIzOw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-Bt1pXQ_XNHGd7bmtX7jnQA-1; Tue, 28 Feb 2023 08:26:37 -0500
X-MC-Unique: Bt1pXQ_XNHGd7bmtX7jnQA-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-536bbaa701aso208763927b3.3
        for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 05:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nflL+RFyijy+MOrYN/ocNgDme0JSg3TrgUceQka/qA=;
        b=Q4P/BLRqr6bxgK8mjGRcx6iA+NVE40qtXgWBWb/2uOGSmqiZ+7pv0gt39VvMwxM48u
         K1YX2ZM0EtJjvJV+rchTNXlC6iiMPdJAv+EzntPsVnTKGM4BGaESUVq2gGuif8/RPUGN
         mg8b0kIwz4MPuaRm5epNu+JHhU1gA651SF4HR9n3A+hApFzaOO8zm5uJW3Lp167SQjz/
         zCc4TLOLCY2sGuuUjatnHJ6ZuDHmPXUCu2vUtBidp4Pb751lRovENXqnrtgUt60U0BMX
         HSUnGinoiEWRxwY0vpcUTB0d+Z3gpSI/zqZJfq3lcr4eA7IRhWiQv+vfkrQZxoTDEZmj
         nDcw==
X-Gm-Message-State: AO0yUKUdnly3rGvtEqJltzGy8jVZeSMugThRdDpFn833uG9ZDIiwf1Kq
	8lLjF84iWsqJdm0gIwshtqlmC33nq61rJUmZvfZYiMWFz7sNubYc1f7mUapzYovdr28H0kT1UOz
	z+lv28avoJU4nYHJtrgInaLHPd5wX/m8wjnqEq7AoCuuFWxA=
X-Received: by 2002:a81:b705:0:b0:533:9252:32fa with SMTP id v5-20020a81b705000000b00533925232famr1578243ywh.4.1677590796200;
        Tue, 28 Feb 2023 05:26:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/3bX4Gi9ZZkPRvxv4eE2vCAWG/LKy0mNnDqFLbSl9TB9oMlrHOu7ukkN8cStIHo0bp2imE/jCHAgG4yhN9/PM=
X-Received: by 2002:a81:b705:0:b0:533:9252:32fa with SMTP id
 v5-20020a81b705000000b00533925232famr1578233ywh.4.1677590795935; Tue, 28 Feb
 2023 05:26:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <32a14a8a-9795-4c8c-7e00-da9012f548f8@leemhuis.info> <abb495f7-f973-4614-846b-d3922dc0fe25@leemhuis.info>
In-Reply-To: <abb495f7-f973-4614-846b-d3922dc0fe25@leemhuis.info>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 28 Feb 2023 14:26:24 +0100
Message-ID: <CAO-hwJJ2OMFgpmrXK_Z43z0ddujaS1fNjaAJSWwao4qQN+pJ6w@mail.gmail.com>
Subject: Re: [regression] Bug 216946 - Toshiba satellite click mini l9w-b:
 touchscreen: no touch events with kernel 6.1.4
To: Linux regressions mailing list <regressions@lists.linux.dev>, Hans De Goede <hdegoede@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	=?UTF-8?B?R8OpIEtvZXJrYW1w?= <ge.koerkamp@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 12:32=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 19.01.23 16:06, Linux kernel regression tracking (Thorsten Leemhuis)
> wrote:
> > Hi, this is your Linux kernel regression tracker.
> >
> > I noticed a regression report in bugzilla.kernel.org. As many (most?)
> > kernel developer don't keep an eye on it, I decided to forward it by
> > mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=3D216946=
 :
>
> The reporter recently confirmed in the ticket that the issue still
> happens with 6.2.
>
> There wasn't any reply from any of the input developers here or in
> bugzilla afaics. :-/ Hmmm. Could someone from that camp maybe please
> take a minute and at least briefly look into this as answer something
> like "that might be due to a problem in subsystem 'foo'", "maybe ask bar
> for an option", or "we have no idea what might cause this, this needs to
> be bisected"? That would help a lot.

The working dmesg shows a line with:
hid-generic 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00 Device
[SIS0817:00 0457:10FB] on i2c-SIS0817:00
and then
hid-multitouch 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00
Device [SIS0817:00 0457:10FB] on i2c-SIS0817:00

But these 2 lines do not appear on the 6.1.4 logs.

So the device is not properly enumerated by ACPI or I2C. Hans might
have an idea on how to debug/solve that issue.

Also there were no changes between v5.15 and v5.16 in i2c-hid.ko, so
it's unlikely to be an issue there (unless '5.16' means '5.16.x').

Cheers,
Benjamin

>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
> >>  G=C3=A9 Koerkamp 2023-01-17 20:21:51 UTC
> >>
> >> Created attachment 303619 [details]
> >> Kernel configuration for v6.1.4/ journalctl (dmesg)/ ACPIdump/lsmod
> >>
> >> Overview:
> >> The touchscreen does not react on touch events.
> >> Touchscreen display and touchpad are working.
> >>
> >> Step to reproduce:
> >> Open any UI page
> >> Try to use touch on relevant UI controls (buttons etc.)
> >>
> >> Result:
> >> No reaction on screen touches
> >>
> >> Expected result:
> >> Reaction on touched control, same as when using the touch pad or conne=
cted mouse (which do work).
> >>
> >> Build information:
> >> The error happens with kernel version 6.1.4
> >> After rebuilding with different kernel versions, it appears that it fi=
rst fails with kernel 5.16
> >>
> >> Additional builds:
> >> The click mini l9w-b still works with kernel 5.10.y LTS and 5.15.y LTS=
.
> >>
> >> Important remark:
> >> Touchscreen still works fine with kernel 6.1.4 using
> >> - an HP x2 detachable 10-p0xx or
> >> - a Lenovo yoga 520-14ikb
> >>
> >> So it could be a hardware dependent issue
> >
> > See the ticket for more details.
> >
> >
> > [TLDR for the rest of this mail: I'm adding this report to the list of
> > tracked Linux kernel regressions; the text you find below is based on a
> > few templates paragraphs you might have encountered already in similar
> > form.]
> >
> > BTW, let me use this mail to also add the report to the list of tracked
> > regressions to ensure it's doesn't fall through the cracks:
> >
> > #regzbot introduced: v5.15..v5.16
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D216946
> > #regzbot title: hid: touchscreen broken with Toshiba satellite click
> > mini l9w-b
> > #regzbot ignore-activity
> >
> > This isn't a regression? This issue or a fix for it are already
> > discussed somewhere else? It was fixed already? You want to clarify whe=
n
> > the regression started to happen? Or point out I got the title or
> > something else totally wrong? Then just reply and tell me -- ideally
> > while also telling regzbot about it, as explained by the page listed in
> > the footer of this mail.
> >
> > Developers: When fixing the issue, remember to add 'Link:' tags pointin=
g
> > to the report (e.g. the buzgzilla ticket and maybe this mail as well, i=
f
> > this thread sees some discussion). See page linked in footer for detail=
s.
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat=
)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
>

