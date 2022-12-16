Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283051FA4
	for <regressions@lists.linux.dev>; Fri, 16 Dec 2022 11:33:18 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id x22so5403632ejs.11
        for <regressions@lists.linux.dev>; Fri, 16 Dec 2022 03:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wp7xY02XT6L1Are9ykoIexwrwRSPJlIWQ4EVjYN7QUQ=;
        b=P7dewo/vW1+3kUsS1DF1U+BER8M/mycwRvSHH0ufamy/AoKmpVhSYp+qN/HguQ21ZM
         5PR1koGQ631rT+BZ1Fpr7Es8/iUYdu4JP4TXbYeNsvFztweDuDsZnufv/JtyoXBguA6N
         DjTqUBw/K9bcM4Ga1qzan46RAV9Rk1bKLHdls9dGzZtElagF/EtghJhjecxP01O/cQEd
         WhWyhGDb5/3rBUaqMhncK2UGGjRYE5kgp5nytaNT8FzahEwydSF36DfrftDG9gf4bK6g
         QhD42nZYDWUnm9aEw5tkv4YYDw4EhNtqjWjgGpXQZrmpIKuwPP43CCXZnJREfvxrltvw
         mOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wp7xY02XT6L1Are9ykoIexwrwRSPJlIWQ4EVjYN7QUQ=;
        b=UmQkJxAkuJrs0sYo0znkmfZFUTee2NYyzy1HH+acoxvCF7a8RPQa+K9iHK80BmDqe1
         99+FgEJRmjPeU1KoP6Yn8Q+9nSxwT8h+FifP9IDHHDYBWw+5SdARLAaHvyGWVT8vRUSs
         wv+aFCumACB2MAJanrjvMXS+2T9VBXTvg5FXrelgDe7TDg7OozWv+IMgN8HoDGnFd7Ga
         yAerdvpQNQBETeIums81ob9pA30YrpKJWFgcSfMK5NS3nWAn5YOTfM2L6UcLq4bOwXuk
         LGAP+XAF7mibgH1O+iHrpkpPggM9W402FnkH4PV1mnbo1CWTVsFG1fZ7YSTs4a877gvg
         YALw==
X-Gm-Message-State: ANoB5pkTaSEoLy+A9MwkD8Zwc3AAAnoO2l/496Qbq1YtruC45YNg+tw/
	z5MUfIPm5fkDVSEGu4Zeuh+WZzuOtaSmuX6Ft4vXEO0HIUFiWQ==
X-Google-Smtp-Source: AA0mqf6OZPkMlhYgAwWt2IXqGv0ChcU18EjMrOEG2UsLBCDXGjnVEG+1WcMrC5Tma3ZW6OtfIucg9nsUMeNdSwihdi4=
X-Received: by 2002:a17:907:766a:b0:7c0:f212:d9a with SMTP id
 kk10-20020a170907766a00b007c0f2120d9amr18292772ejc.423.1671190396154; Fri, 16
 Dec 2022 03:33:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
 <CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
 <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info> <CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
 <20221212101449.4e465181@xps-13> <CALHCpMimCqZB0bnHaOdCzucey+92NcRRZXCHXYYH5c9vj0nZaQ@mail.gmail.com>
 <20221212173730.64224599@xps-13> <b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
 <20221213104643.052d4a06@xps-13> <CALHCpMhOku2b+1y5Z=N5RJ6SvCvNakD2rSyRAqp6Gz3JWVvXGg@mail.gmail.com>
 <20221213175424.79895b63@xps-13> <CAGETcx8YvD5JABuJhah_6oOAUe=QgnOG5gWNL7Hcfxbvq0C2YQ@mail.gmail.com>
 <20221216120456.52072f9f@xps-13>
In-Reply-To: <20221216120456.52072f9f@xps-13>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Fri, 16 Dec 2022 14:33:04 +0300
Message-ID: <CALHCpMhEdq=Zxsj10cUNoi7Z56bqPORf1dztRKXgOL3O9C7bBQ@mail.gmail.com>
Subject: Re: nvmem-cells regression after adding 'call of_platform_populate()
 for MTD partitions'
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Saravana Kannan <saravanak@google.com>, Maxim Kochetkov <fido_max@inbox.ru>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Maxim, any chance you give this a try?
Ok, I'll try it as soon as possible.

=D0=BF=D1=82, 16 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 14:04, Miquel Rayn=
al <miquel.raynal@bootlin.com>:
>
> Hi Saravana, Maxim, Maxim,
>
> saravanak@google.com wrote on Wed, 14 Dec 2022 13:53:54 -0800:
>
> > On Tue, Dec 13, 2022 at 8:54 AM Miquel Raynal <miquel.raynal@bootlin.co=
m> wrote:
> > >
> > > Hi Maxim,
> > >
> > > bigunclemax@gmail.com wrote on Tue, 13 Dec 2022 14:02:34 +0300:
> > >
> > > > I looked closer at commit 658c4448bbbf and bcdf0315a61a, 5db1c2dbc0=
4c16 commits.
> > > > Looks like we have two different features binded to one property - =
"compatible".
> > > >
> > > > From one side it is the ability to forward the subnode of the mtd
> > > > partition to the nvmem subsystem (658c4448bbbf and ac42c46f983e).
> > > > And from another side is the ability to use custom initialization o=
f
> > > > the mtd partition (bcdf0315a61a and 5db1c2dbc04c16).
> > > >
> > > > What I mean:
> > > > According to ac42c46f983e I can create DT like this:
> > > >  - |
> > > >     partitions {
> > > >         compatible =3D "fixed-partitions";
> > > >         #address-cells =3D <1>;
> > > >         #size-cells =3D <1>;
> > > >
> > > >         partition@0 {
> > > >             compatible =3D "nvmem-cells";
> > > >             reg =3D <0x40000 0x10000>;
> > > >             #address-cells =3D <1>;
> > > >             #size-cells =3D <1>;
> > > >             macaddr_gmac1: macaddr_gmac1@0 {
> > > >                 reg =3D <0x0 0x6>;
> > > >             };
> > > >         };
> > > >     };
> > > >
> > > >
> > > > And according to 5db1c2dbc04c16 I can create DT like this:
> > > >  - |
> > > >     partitions {
> > > >         compatible =3D "fixed-partitions";
> > > >         #address-cells =3D <1>;
> > > >         #size-cells =3D <1>;
> > > >
> > > >         partition@0 {
> > > >             compatible =3D "u-boot,env";
> > > >             reg =3D <0x40000 0x10000>;
> > > >         };
> > > >     };
> > > >
> > > > But I can not use them both, because only one "compatible" property=
 allowed.
> > > > This will be incorrect:
> > > >  - |
> > > >     partitions {
> > > >         compatible =3D "fixed-partitions";
> > > >         #address-cells =3D <1>;
> > > >         #size-cells =3D <1>;
> > > >
> > > >         partition@0 {
> > > >             compatible =3D "u-boot,env";  # from ac42c46f983e
> > > >             compatible =3D "nvmem-cells"; # from 5db1c2dbc04c
> > >
> > > What about:
> > >
> > >               compatible =3D "u-boot,env", "nvmem-cells";
> > >
> > > instead? that should actually work.
> > >
> > > >             reg =3D <0x40000 0x10000>;
> > > >             #address-cells =3D <1>;
> > > >             #size-cells =3D <1>;
> > > >             macaddr_gmac1: macaddr_gmac1@0 {
> > > >                 reg =3D <0x0 0x6>;
> > > >             };
> > > >         };
> > > >     };
> > > >
> > > > > compatible: Duplicate property name
> > > >
> > > > =D0=B2=D1=82, 13 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 12:46, Miq=
uel Raynal <miquel.raynal@bootlin.com>:
> > > > >
> > > > > Hi Maxim,
> > > > >
> > > > > fido_max@inbox.ru wrote on Mon, 12 Dec 2022 20:57:49 +0300:
> > > > >
> > > > > > Hi, Miquel!
> > > > > >
> > > > > > On 12.12.2022 19:37, Miquel Raynal wrote:
> > > > > >
> > > > > > > Let me try to recap the situation for all the people I just i=
nvolved:
> > > > > > >
> > > > > > > * An Ethernet driver gets its mac address from an nvmem cell.=
 The
> > > > > > >    Ethernet controller DT node then has an "nvmem-cells" prop=
erty
> > > > > > >    pointing towards an nvmem cell.
> > > > > > > * The nvmem cell comes from an mtd partition.
> > > > > > > * The mtd partition is flagged with a particular compatible
> > > > > > >    (which is also named "nvmem-cells") to tell the kernel tha=
t the node
> > > > > > >    produces nvmem cells.
> > > > > > > * The mtd partition itself has no driver, but is the child no=
de of a
> > > > > > >    "partitions" container which has one (in this case,
> > > > > > >    "fixed-partitions", see the snippet below).
> > > > > > >
> > > > > > > Because the "nvmem-cells" property of the Ethernet node point=
s at the
> > > > > > > nvmem-cell node, the core create a device link between the Et=
hernet
> > > > > > > controller (consumer) and the mtd partition (producer).
> > > > > > >
> > > > > > > The device link in this case will never be satisfied because =
no driver
> > > > > > > matches the "nvmem-cells" compatible of the partition node.
> > > > > > >
> > > > > > > Reverting commit bcdf0315a61a ("mtd: call of_platform_populat=
e() for MTD
> > > > > > > partitions") would IMHO not make much sense, the problem come=
s from the
> > > > > > > device link side and even there, there is nothing really "wro=
ng",
> > > > > > > because I really expect the mtd device to be ready before the
> > > > > > > Ethernet controller probe, the device link is legitimate.
> > > > > > >
> > > > > > > So I would like to explore other alternatives. Here are a bun=
ch of
> > > > > > > ideas, but I'm open:
> > > > > >
> > > > > > How about to create simple driver with compatible=3D"nvmem-cell=
" and to move all the suff from main mtd driver which serves nvmem-cell to =
the probe function?
> > > > >
> > > > > This is probably worth the try but I doubt you can make it work w=
ithout
> > > > > regressions because IIRC the nvmem registration happens no matter=
 the
> > > > > compatible (not mentioning the user-otp and factory-otp cases). Y=
ou can
> > > > > definitely try this out if you think you can come up with somethi=
ng
> > > > > though.
> > > > >
> > > > > But I would like to hear from the device-link gurus :) because ev=
en if
> > > > > we fix mtd with a "trick" like above, I guess we'll very likely f=
ind
> > > > > other corner cases like that and I am interested in understanding=
 the
> > > > > rationale of what could be a proper fix.
> > > > >
> >
> > Responding to the whole thread.
> >
> > I'm going by Miquel's first email in which he cc'ed me and haven't
> > actually looked at the mtd code. Couple of comments:
> >
> > Independent of mtd/nvmem-cell, I generally frown on having a
> > compatible string for a child node that you don't treat as a device.
> > Even more so if you actually create a struct device for it and then
> > don't do anything else with it. That's just a waste of memory. So, in
> > general try to avoid that in the future if you can.
>
> Agreed, it didn't triggered any warnings in my head in the first place,
> sorry about that.
>
> > Also, there are flags the parent device's driver can set that'll tell
> > fw_devlink not to treat a specific DT node as a real device. So, if we
> > really need that I'll dig up and suggest a fix.
>
> Interesting, that would indeed very likely fix it.
>
> > Lastly and more importantly, I've a series[1] that stops depending on
> > the compatible property for fw_devlink to work. So it should be
> > smarter than it is today. But that series has known bugs for which I
> > gave test fixes in that thread. I plan to make a v2 of that series
> > with that fix and I'm expecting it'll fix a bunch of fw_devlink
> > issues.
> >
> > Feel free to give v1 + squashing the fixes a shot if you are excited
> > to try it. Otherwise, I'll try my best to get around to it this week
> > (kinda swamped though + holidays coming up, so no promises).
>
> Can you please include us in your next submission?
> * Maxim Kiselev <bigunclemax@gmail.com>
> * Maxim Kochetkov <fido_max@inbox.ru>
> * Miquel Raynal <miquel.raynal@bootlin.com>
>
> > [1] - https://lore.kernel.org/lkml/20220810060040.321697-1-saravanak@go=
ogle.com/
>
> Maxim, any chance you give this a try?
>
> Thanks,
> Miqu=C3=A8l
