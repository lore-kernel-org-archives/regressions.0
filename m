Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A94120E3
	for <regressions@lists.linux.dev>; Fri, 16 Dec 2022 13:13:47 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id c17so3513627edj.13
        for <regressions@lists.linux.dev>; Fri, 16 Dec 2022 05:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZLgqC4yZup3RZtbVPEocpnZO0zjOkUzVs815VvXCvc=;
        b=S8cIhJBWpSqxe86Y0FFrS4hmi506K7I3AWk/lucV0O+iMYi1GRs0sH9y4JPQxl3ffK
         JealiPGy2zqNS+F+dXKDOEV5B2gjxK+d3p3PpS7spxA7w3Ge4OhNqkp9KllykGE230gZ
         n6Nwg7nu/0bx/K9ZPJhOoJefKIcyN5m70QQWerqTmsR868WzN7iDJZv0MApf7K6kKKwQ
         wx6sCim7nWnfUM6Tq4GSPdVkls9bajeFwn5+YDnOWqeVpPKv3luh5uVab6s2cKElMW+B
         2WjW1O48WhmM5eU1sd67V9FSJMRwbKM9OUHGzfs4Ju9poVn9ppCIEaSSV0KaL21/Depq
         ys8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZLgqC4yZup3RZtbVPEocpnZO0zjOkUzVs815VvXCvc=;
        b=yvK805FwE6h7ODiyYbNsDbViDwihHTBO1oczyHbDHs4AQRKT253hyXnBU3C5kCop8U
         0uvO/aZznEOkrkdrx4DG7ST7x8DQcvLyZJDwFyCimIvoTX7njvc79xRPjxasspl9zTi9
         ENkzh5NV1Z6g2BhAe2QKWVio5I1NzqNnPWQZqcPRXPfka2lVtUqtgJiS0Fy5mpMbJCrn
         4n5vVFBTL5V6BR4+aD4JdJSdBppLGd/hK5GaHvcOEbOKDSa38wi+uKQU+jvrhjzSS/jR
         EHg3FHIqIwwUZptPzdiBvNN9F6tet8cEPId5IDdAUXFIlbB4H3+8JflvMpjICZ+f6Afw
         hkOQ==
X-Gm-Message-State: ANoB5pkH7u0rOxcEQa04KAEQt7B0efw2pwHL9KzoUfOSlZC88Q1mjCj9
	ikqndlkz/oK9hl57Fq3UnE8njwcPzfL02YBEUgo=
X-Google-Smtp-Source: AA0mqf7cB7fdic1t7C5Lyr/JFJxXvG6VS6Wy++BKoV+i1NOd3smOQ2UJjpPIo2ylxxb/9/jsHT+z9GP2dcurKN3142M=
X-Received: by 2002:a05:6402:f8f:b0:470:37fc:e68 with SMTP id
 eh15-20020a0564020f8f00b0047037fc0e68mr1405874edb.369.1671196425374; Fri, 16
 Dec 2022 05:13:45 -0800 (PST)
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
 <20221216120456.52072f9f@xps-13> <CALHCpMhEdq=Zxsj10cUNoi7Z56bqPORf1dztRKXgOL3O9C7bBQ@mail.gmail.com>
In-Reply-To: <CALHCpMhEdq=Zxsj10cUNoi7Z56bqPORf1dztRKXgOL3O9C7bBQ@mail.gmail.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Fri, 16 Dec 2022 16:13:33 +0300
Message-ID: <CALHCpMidP8L98mM3WOkqk82V0BC5g0Awu0EB62eHKZEpzEL7Vg@mail.gmail.com>
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
> [1] - https://lore.kernel.org/lkml/20220810060040.321697-1-saravanak@goog=
le.com/

OK, I tried it and it didn't seem to help me.
I'm still getting an unresolved dependence for 'f1070000.ethernet'
from 'mac@6' nvmem-cell.
Here is a related part of kernel log:

[    0.035553] ethernet@70000 Linked as a fwnode consumer to
main-interrupt-ctrl@20200
[    0.035601] ethernet@70000 Linked as a fwnode consumer to
clock-gating-control@1821c
[    0.035713] ethernet@70000 Linked as a fwnode consumer to mac@6

[    0.046423] device: 'f1070000.ethernet': device_add
[    0.046689] platform f1070000.ethernet: Not linking
/ocp@f1000000/clock-gating-control@1821c - dev might never probe
[    0.046747] ethernet@70000 Dropping the fwnode link to
clock-gating-control@1821c
[    0.046788] platform f1070000.ethernet: Not linking
/ocp@f1000000/main-interrupt-ctrl@20200 - might never become dev
[    0.046835] ethernet@70000 Dropping the fwnode link to
main-interrupt-ctrl@20200

[    0.113759] device: 'spi0': device_add
[    0.114523] device: 'spi0.0': device_add
[    0.115349] spi-nor spi0.0: mx66l51235f (65536 Kbytes)
[    0.116833] 7 fixed-partitions partitions found on MTD device spi0.0
[    0.117026] device: 'f1010600.spi:m25p80@0:partitions:partition@1':
device_add
[    0.117416] Creating 7 MTD partitions on "spi0.0":

[    3.537102] devices_kset: Moving f1070000.ethernet to end of list
[    3.537391] platform f1070000.ethernet: error -EPROBE_DEFER: wait
for supplier mac@6

=D0=BF=D1=82, 16 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 14:33, Maxim Kisel=
ev <bigunclemax@gmail.com>:
>
> > Maxim, any chance you give this a try?
> Ok, I'll try it as soon as possible.
>
> =D0=BF=D1=82, 16 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 14:04, Miquel Ra=
ynal <miquel.raynal@bootlin.com>:
> >
> > Hi Saravana, Maxim, Maxim,
> >
> > saravanak@google.com wrote on Wed, 14 Dec 2022 13:53:54 -0800:
> >
> > > On Tue, Dec 13, 2022 at 8:54 AM Miquel Raynal <miquel.raynal@bootlin.=
com> wrote:
> > > >
> > > > Hi Maxim,
> > > >
> > > > bigunclemax@gmail.com wrote on Tue, 13 Dec 2022 14:02:34 +0300:
> > > >
> > > > > I looked closer at commit 658c4448bbbf and bcdf0315a61a, 5db1c2db=
c04c16 commits.
> > > > > Looks like we have two different features binded to one property =
- "compatible".
> > > > >
> > > > > From one side it is the ability to forward the subnode of the mtd
> > > > > partition to the nvmem subsystem (658c4448bbbf and ac42c46f983e).
> > > > > And from another side is the ability to use custom initialization=
 of
> > > > > the mtd partition (bcdf0315a61a and 5db1c2dbc04c16).
> > > > >
> > > > > What I mean:
> > > > > According to ac42c46f983e I can create DT like this:
> > > > >  - |
> > > > >     partitions {
> > > > >         compatible =3D "fixed-partitions";
> > > > >         #address-cells =3D <1>;
> > > > >         #size-cells =3D <1>;
> > > > >
> > > > >         partition@0 {
> > > > >             compatible =3D "nvmem-cells";
> > > > >             reg =3D <0x40000 0x10000>;
> > > > >             #address-cells =3D <1>;
> > > > >             #size-cells =3D <1>;
> > > > >             macaddr_gmac1: macaddr_gmac1@0 {
> > > > >                 reg =3D <0x0 0x6>;
> > > > >             };
> > > > >         };
> > > > >     };
> > > > >
> > > > >
> > > > > And according to 5db1c2dbc04c16 I can create DT like this:
> > > > >  - |
> > > > >     partitions {
> > > > >         compatible =3D "fixed-partitions";
> > > > >         #address-cells =3D <1>;
> > > > >         #size-cells =3D <1>;
> > > > >
> > > > >         partition@0 {
> > > > >             compatible =3D "u-boot,env";
> > > > >             reg =3D <0x40000 0x10000>;
> > > > >         };
> > > > >     };
> > > > >
> > > > > But I can not use them both, because only one "compatible" proper=
ty allowed.
> > > > > This will be incorrect:
> > > > >  - |
> > > > >     partitions {
> > > > >         compatible =3D "fixed-partitions";
> > > > >         #address-cells =3D <1>;
> > > > >         #size-cells =3D <1>;
> > > > >
> > > > >         partition@0 {
> > > > >             compatible =3D "u-boot,env";  # from ac42c46f983e
> > > > >             compatible =3D "nvmem-cells"; # from 5db1c2dbc04c
> > > >
> > > > What about:
> > > >
> > > >               compatible =3D "u-boot,env", "nvmem-cells";
> > > >
> > > > instead? that should actually work.
> > > >
> > > > >             reg =3D <0x40000 0x10000>;
> > > > >             #address-cells =3D <1>;
> > > > >             #size-cells =3D <1>;
> > > > >             macaddr_gmac1: macaddr_gmac1@0 {
> > > > >                 reg =3D <0x0 0x6>;
> > > > >             };
> > > > >         };
> > > > >     };
> > > > >
> > > > > > compatible: Duplicate property name
> > > > >
> > > > > =D0=B2=D1=82, 13 =D0=B4=D0=B5=D0=BA. 2022 =D0=B3. =D0=B2 12:46, M=
iquel Raynal <miquel.raynal@bootlin.com>:
> > > > > >
> > > > > > Hi Maxim,
> > > > > >
> > > > > > fido_max@inbox.ru wrote on Mon, 12 Dec 2022 20:57:49 +0300:
> > > > > >
> > > > > > > Hi, Miquel!
> > > > > > >
> > > > > > > On 12.12.2022 19:37, Miquel Raynal wrote:
> > > > > > >
> > > > > > > > Let me try to recap the situation for all the people I just=
 involved:
> > > > > > > >
> > > > > > > > * An Ethernet driver gets its mac address from an nvmem cel=
l. The
> > > > > > > >    Ethernet controller DT node then has an "nvmem-cells" pr=
operty
> > > > > > > >    pointing towards an nvmem cell.
> > > > > > > > * The nvmem cell comes from an mtd partition.
> > > > > > > > * The mtd partition is flagged with a particular compatible
> > > > > > > >    (which is also named "nvmem-cells") to tell the kernel t=
hat the node
> > > > > > > >    produces nvmem cells.
> > > > > > > > * The mtd partition itself has no driver, but is the child =
node of a
> > > > > > > >    "partitions" container which has one (in this case,
> > > > > > > >    "fixed-partitions", see the snippet below).
> > > > > > > >
> > > > > > > > Because the "nvmem-cells" property of the Ethernet node poi=
nts at the
> > > > > > > > nvmem-cell node, the core create a device link between the =
Ethernet
> > > > > > > > controller (consumer) and the mtd partition (producer).
> > > > > > > >
> > > > > > > > The device link in this case will never be satisfied becaus=
e no driver
> > > > > > > > matches the "nvmem-cells" compatible of the partition node.
> > > > > > > >
> > > > > > > > Reverting commit bcdf0315a61a ("mtd: call of_platform_popul=
ate() for MTD
> > > > > > > > partitions") would IMHO not make much sense, the problem co=
mes from the
> > > > > > > > device link side and even there, there is nothing really "w=
rong",
> > > > > > > > because I really expect the mtd device to be ready before t=
he
> > > > > > > > Ethernet controller probe, the device link is legitimate.
> > > > > > > >
> > > > > > > > So I would like to explore other alternatives. Here are a b=
unch of
> > > > > > > > ideas, but I'm open:
> > > > > > >
> > > > > > > How about to create simple driver with compatible=3D"nvmem-ce=
ll" and to move all the suff from main mtd driver which serves nvmem-cell t=
o the probe function?
> > > > > >
> > > > > > This is probably worth the try but I doubt you can make it work=
 without
> > > > > > regressions because IIRC the nvmem registration happens no matt=
er the
> > > > > > compatible (not mentioning the user-otp and factory-otp cases).=
 You can
> > > > > > definitely try this out if you think you can come up with somet=
hing
> > > > > > though.
> > > > > >
> > > > > > But I would like to hear from the device-link gurus :) because =
even if
> > > > > > we fix mtd with a "trick" like above, I guess we'll very likely=
 find
> > > > > > other corner cases like that and I am interested in understandi=
ng the
> > > > > > rationale of what could be a proper fix.
> > > > > >
> > >
> > > Responding to the whole thread.
> > >
> > > I'm going by Miquel's first email in which he cc'ed me and haven't
> > > actually looked at the mtd code. Couple of comments:
> > >
> > > Independent of mtd/nvmem-cell, I generally frown on having a
> > > compatible string for a child node that you don't treat as a device.
> > > Even more so if you actually create a struct device for it and then
> > > don't do anything else with it. That's just a waste of memory. So, in
> > > general try to avoid that in the future if you can.
> >
> > Agreed, it didn't triggered any warnings in my head in the first place,
> > sorry about that.
> >
> > > Also, there are flags the parent device's driver can set that'll tell
> > > fw_devlink not to treat a specific DT node as a real device. So, if w=
e
> > > really need that I'll dig up and suggest a fix.
> >
> > Interesting, that would indeed very likely fix it.
> >
> > > Lastly and more importantly, I've a series[1] that stops depending on
> > > the compatible property for fw_devlink to work. So it should be
> > > smarter than it is today. But that series has known bugs for which I
> > > gave test fixes in that thread. I plan to make a v2 of that series
> > > with that fix and I'm expecting it'll fix a bunch of fw_devlink
> > > issues.
> > >
> > > Feel free to give v1 + squashing the fixes a shot if you are excited
> > > to try it. Otherwise, I'll try my best to get around to it this week
> > > (kinda swamped though + holidays coming up, so no promises).
> >
> > Can you please include us in your next submission?
> > * Maxim Kiselev <bigunclemax@gmail.com>
> > * Maxim Kochetkov <fido_max@inbox.ru>
> > * Miquel Raynal <miquel.raynal@bootlin.com>
> >
> > > [1] - https://lore.kernel.org/lkml/20220810060040.321697-1-saravanak@=
google.com/
> >
> > Maxim, any chance you give this a try?
> >
> > Thanks,
> > Miqu=C3=A8l
