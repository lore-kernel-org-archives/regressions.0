Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD8C1847
	for <regressions@lists.linux.dev>; Sun, 11 Dec 2022 08:26:42 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id t17so20995989eju.1
        for <regressions@lists.linux.dev>; Sun, 11 Dec 2022 00:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df12UQhWiYTYmdTCUvBoHsOBYTq2DGnQpQX0Hny7LVU=;
        b=iH+2AItbsTINdOr0Cj28qQmO2p56KfxkOIyQJl/yjKRAmjwb9acWJh/+Vd0E6Ahoeb
         mMq8nEb2WmHUcXwcQE2oY8N3FBbbMDwT4iuXyZV9ACkXkH2LCEBCsZ1XNOHOWKiX9VlT
         eAUshl7Bj+PG6ouRCLGKRhdgEsP6ykJvCnIDMW5gl2h7PHFrZsccJSm9kbBQ2SfwuSQy
         j8/dMUbcUIhYJ9noiW4E7jhX++Xkk2yUCfyeqiZ1zpOFYZ9kuQ8bahEUuU6amf+q0gOT
         oLOW4eBsfY8FX3clPot4jSlbDaOqN801X/wBsrUsiyBPllp+Ti4m8gWLCQI9Jx6+mc1m
         D4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df12UQhWiYTYmdTCUvBoHsOBYTq2DGnQpQX0Hny7LVU=;
        b=qPTM1sqAbLXW8P42Mv/T56+kMtyu2H/JIbR1+h+JrJGHUnwEFQDeWjJp8xNXwmPiv9
         jB5ZxlcyGXK+mfEXsAhn/VyPjHjs3nwoxy7YmSETaYDrzezywdpo6o6Ro8aAc5+KenYH
         3Bhvm2hgBn6TJvEzYr6a2U4GMaSYbsCjW4BXHaY0ZN6ci6mcuWW/Bod8Z01Vl+dUPOGV
         IUUTyvOFcMpibZZzTxLxHwj6VYxbsQAdBCIZklv41nA0GfB5r2TZ2OMZUFk/7tnLjPXn
         nJNaWl1+1r1PljTWlk06z3jIDFyZQGpuE1drLc1bGyb3qoru4xz/349ApWgeKc/zI7md
         MyNw==
X-Gm-Message-State: ANoB5pk6Jyxew0qJY92tycJjxZhL1IoRT63wvb83GKaULLJzkpFV7EHT
	J25sO8tPk3n8rJ6VpNuGeGRDIz+iGOElvyDcZYk=
X-Google-Smtp-Source: AA0mqf7ZMdYKNktXbDEDsUat0++lY1WTIOMpXUb/tlsZdsovERwynkwAvgxd5PA7NHNObE1yohlrO37VKDTfvyH6zNQ=
X-Received: by 2002:a17:906:6d03:b0:78d:9d0b:a9f6 with SMTP id
 m3-20020a1709066d0300b0078d9d0ba9f6mr34394004ejr.661.1670747200885; Sun, 11
 Dec 2022 00:26:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
 <CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com> <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
In-Reply-To: <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 11 Dec 2022 11:26:29 +0300
Message-ID: <CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
Subject: Re: Fwd: nvmem-cells regression after adding 'call
 of_platform_populate() for MTD partitions'
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>On 10.12.22 10:52, Maxim Kiselev wrote:
>>
>> After applying
>
>This makes me wonder: "applying" as in "applying it to some version that
>doesn't contain this change normally" or as it "after it was applied to
>mainline I have the following problem with vanilla kernel version <???>"?

Sorry for confusing you, I mean "after it was applied to mainline".
I have this problem with vanilla kernel version 6.0.

>>> I faced with a problem that my ethernet device can't be probed because =
it
>>> wait when 'nvmem-cells' device will be probed first.
>>
>>FWIW, there is a discussion about a problems that at least to my
>>untrained eyes looks similar:
>>https://lore.kernel.org/all/Yyj7wJlqJkCwObRn@lx2k/

Yes it looks like the same issue.


I think the root of the problem was the choice of 'compatible'
device tree property to mark the mtd partition node as a nvmem provider.

I'm talking about this part in 'mtd_nvmem_add' function.
> config.no_of_node =3D !of_device_is_compatible(node, "nvmem-cells");

Maybe we should change the 'compatible' property to something else?

=D1=81=D0=B1, 10 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 15:35, Thorsten Le=
emhuis <regressions@leemhuis.info>:
>
> [CCing the regression mailing list, as it should be in the loop for all
> regressions, as explained in
> https://docs.kernel.org/admin-guide/reporting-regressions.html ]
>
> Hi, this is your Linux kernel regression tracker. Thx for the report.
>
> On 10.12.22 10:52, Maxim Kiselev wrote:
> >
> > After applying
>
> This makes me wonder: "applying" as in "applying it to some version that
> doesn't contain this change normally" or as it "after it was applied to
> mainline I have the following problem with vanilla kernel version <???>"?
>
> > this commit 'mtd: call of_platform_populate() for MTD
> > partitions' (bcdf0315),
>
> CCing Rafa=C5=82, who authored bcdf0315.
>
> > I faced with a problem that my ethernet device can't be probed because =
it
> > wait when 'nvmem-cells' device will be probed first.
>
> FWIW, there is a discussion about a problems that at least to my
> untrained eyes looks similar:
> https://lore.kernel.org/all/Yyj7wJlqJkCwObRn@lx2k/
>
> Rafa=C5=82, has some progress been made to resolve this?
>
> To me it sounds like this might warrant a "revert, and reapply later
> when the cause for the regression was addressed". Rafa=C5=82, it seems yo=
u
> suggested something like that, but it doesn't look like that happened
> for one reason or another. Or am I missing something?
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
>
> > But there is no such driver which is compatible with 'nvmem-cells' beca=
use
> > 'nvmem-cells' is just a mark used by the 'mtd_nvmem_add' function.
> >
> > So this leads to appeating of unresolved dependency for the ethernet de=
vice.
> > And that's why the ethernet device can't be added and probed.
> >
> > Here is a part of kernel log when spi flash probe start:
> >
> >> device: 'spi0': device_add
> >> device: 'spi0.0': device_add
> >> spi-nor spi0.0: mx66l51235f (65536 Kbytes)
> >> 7 fixed-partitions partitions found on MTD device spi0.0
> >
> > After 'm25p80' probe 'f1070000.ethernet' linked to 'partition@1' :
> >
> >> device: 'f1010600.spi:m25p80@0:
> > partitions:partition@1': device_add
> >> device: 'platform:f1010600.spi:m25p80@0:partitions:partition@1--platfo=
rm:f1070000.ethernet': device_add
> >> devices_kset: Moving f1070000.ethernet to end of list
> >> platform f1070000.ethernet: Linked as a consumer to f1010600.spi:m25p8=
0@0:partitions:partition@1
> >> ethernet@70000 Dropping the fwnode link to partition@1
> >
> > And as a result I got `-EPROBE_DEFER` for `f1070000.ethernet`
> >
> >> platform f1070000.ethernet: error -EPROBE_DEFER: supplier f1010600.spi=
:m25p80@0:partitions:partition@1 not ready
> >
> > Here is a part of my device tree:
> >
> >     enet1: ethernet@70000 {
> >         status =3D "okay";
> >         nvmem-cells =3D <&macaddr>;
> >         nvmem-cell-names =3D "mac-address";
> >         phy-mode =3D "rgmii";
> >         phy =3D <&phy0>;
> >     };
> >
> >     spi@10600 {
> >         status =3D "okay";
> >
> >         m25p80@0 {
> >             compatible =3D "mx66l51235l";
> >             reg =3D <0>;
> >             #address-cells =3D <1>;
> >             #size-cells =3D <1>;
> >
> >             partitions {
> >                 compatible =3D "fixed-partitions";
> >                 #address-cells =3D <1>;
> >                 #size-cells =3D <1>;
> >
> >                 partition@0 {
> >                     reg =3D <0x00000000 0x000080000>;
> >                     label =3D "SPI.U_BOOT";
> >                 };
> >
> >                 partition@1 {
> >                     compatible =3D "nvmem-cells";
> >                     reg =3D <0x000A0000 0x00020000>;
> >                     label =3D "SPI.INV_INFO";
> >                     #address-cells =3D <1>;
> >                     #size-cells =3D <1>;
> >                     ranges =3D <0 0x000A0000 0x00020000>;
> >
> >                     macaddr: mac@6 {
> >                         reg =3D <0x6 0x6>;
> >                     };
> >                 };
> >
> >             };
> >         };
> >     };
> >
> > In the example above 'ethernet@70000' requires 'macaddr: mac@6' which i=
s
> > located inside mtd 'partition@1' of 'm25p80@0' spi flash.
>
> P.P.S.: let me add this to the regression tracking:
>
> #regzbot ^introduced bcdf0315
> #regzbot title mtd: ethernet device can't be probed anymore due to
> broken nvmem-cells dep
> #regzbot monitor: https://lore.kernel.org/all/Yyj7wJlqJkCwObRn@lx2k/
> #regzbot ignore-activity
