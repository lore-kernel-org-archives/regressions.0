Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1915F8BEB
	for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 23:38:24 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9bf52cd08so72095131fa.2
        for <regressions@lists.linux.dev>; Mon, 14 Aug 2023 16:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692056303; x=1692661103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auCKH77GUmHtR8IapPBb8g4UiN/2zl1VUIFKJbzQ/kI=;
        b=MKa6VDrja44w1LXj9J8jTSnXHE4lZXxJmJ832PLK492VGubJFyyH2medBsAcmF7Z+r
         wMzRbjFr30iwnHvFoM10/q8CfuIu7iI4PC5DRWJt1QwXNrXa92/H90zt5J0LheUMYMnP
         iwAAypdFF8rGILc2Gt5crqCuQyokzAqQziUDoex20leBimA62FIbjfLq2Kp6TC47mUgW
         PTXhF8UpP9NyMsYkvsXoHDahESTicpPBviiMD79huk3dn2ryjxPsSKAMLMGubk5VzNvM
         fjwmw2XTgTNXqXoZM+eLDPZg7yNDQwFbTTzIndTOpDLzC4wZktAkpveoaN5It2Ien3kZ
         5Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692056303; x=1692661103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auCKH77GUmHtR8IapPBb8g4UiN/2zl1VUIFKJbzQ/kI=;
        b=bnAP8WKdnONe9tzFLYQIcT54McsGRmDnzt+riLi4/1z2uAsAPH5KyFKCugPaqlDbgE
         d+TrwHKlWo6tx+qty2ijO36RCt7Jx29dQ6DNvxTKXz+RUWnlSl6yS87vS3/rPDDPa/NE
         gBfjCB3ltuZ+3ogmpMfFu3pz9gQcJkj0NKbqG4+gelA9+6pt/RR/+tzXkSTgWOyKdc48
         Xxkidxf9V6srBZurgMdsoIl92aO2JlvWM6LavovjngL3sXSCt5SEIHEHd5eFiixcQ640
         fQUue2RXSe5N43FeqWwfXgHVH1QwFer2FlkWt6kZvyFXbhS7fdeDO6G41Np7ppYCStOK
         mxDA==
X-Gm-Message-State: AOJu0YwnmlHrN5RPSXcph1SEByHQ5nlLpDxlprucdom870vVNO9r5cJr
	x8+BcCc4JAfftgWyY4hltI+Z/bEtL/Rn7I7z1Ck=
X-Google-Smtp-Source: AGHT+IH2pYZt5ZO0uVppPWJ58wGlkDfjVd0pGa3fb/b0ihVaZq3jrTGj/cg5gIFAXuXeTSF/UvhygzIGyIoEmEngvno=
X-Received: by 2002:a2e:925a:0:b0:2b9:f13b:6139 with SMTP id
 v26-20020a2e925a000000b002b9f13b6139mr8189721ljg.20.1692056302570; Mon, 14
 Aug 2023 16:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2300626.ElGaqSPkdT@bruno-beit> <5706628.DvuYhMxLoT@bruno-beit>
 <CABBYNZ+Nt3Rho2=VtVrspRLond2agnKhT1LmeLCGdY4fdxmusg@mail.gmail.com>
 <13020832.2lBWEU9m2C@bruno-beit> <CABBYNZLpHxGHKsB_JPh1Drg=V_gXMGTp=nqXB=W1MM2_6BNHQw@mail.gmail.com>
In-Reply-To: <CABBYNZLpHxGHKsB_JPh1Drg=V_gXMGTp=nqXB=W1MM2_6BNHQw@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 14 Aug 2023 16:38:10 -0700
Message-ID: <CABBYNZLo0WT+VovmB3AKPKNNLXPNPBdECNzf6MNu+aL6d91naQ@mail.gmail.com>
Subject: Re: regression: kernel 6.4.x breaks scanning/pairing (but not use) of
 LE devices
To: Bruno Pitrus <brunopitrus@hotmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Takashi Iwai <tiwai@suse.de>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruno,

On Mon, Aug 14, 2023 at 1:21=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Bruno,
>
> On Mon, Aug 14, 2023 at 3:00=E2=80=AFAM Bruno Pitrus <brunopitrus@hotmail=
.com> wrote:
> >
> > Dnia pi=C4=85tek, 11 sierpnia 2023 19:11:50 CEST Luiz Augusto von Dentz=
 pisze:
> > > Hi Bruno,
> > >
> > > On Fri, Aug 11, 2023 at 4:25=E2=80=AFAM Bruno Pitrus <brunopitrus@hot=
mail.com> wrote:
> > > >
> > > > Dnia sobota, 5 sierpnia 2023 09:31:08 CEST Paul Menzel pisze:
> > > > > [Cc: +regressions@]
> > > > >
> > > > > #regzbot introduced v6.3.9..v6.4.2
> > > > >
> > > > > Dear Bruno,
> > > > >
> > > > >
> > > > > Thank you for your report.
> > > > >
> > > > > Am 04.08.23 um 20:55 schrieb Bruno Pitrus:
> > > > > > I am using openSUSE Tumbleweed on a Dell Precision 3551 which h=
as a
> > > > > > bluetooth adapter of ID 8087:0026 (Intel AX201). I am using a
> > > > > > Logitech M575 trackball mouse which only supports Bluetooth LE.
> > > > > >
> > > > > > With kernel 6.4.2 or newer, scanning for devices =E2=80=94 usin=
g either the
> > > > > > KDE gui or bluetoothctl =E2=80=94 most of the time returns only=
 =E2=80=9Cclassic
> > > > > > bluetooth=E2=80=9D devices like computers and phones, and not t=
he mouse. If
> > > > > > the mouse was paired before, it works correctly however.
> > > > > >
> > > > > > With previous kernel versions (6.3.9 and before), pairing the m=
ouse
> > > > > > worked correctly.
> > > > >
> > > > > Are you able to bisect the regression? Please also attach the Lin=
ux
> > > > > messages. (You can also create a ticket in the Linux kernel Bugzi=
lla [1]
> > > > > and attach everything there.)
> > > > >
> > > > >
> > > > > Kind regards,
> > > > >
> > > > > Paul
> > > > >
> > > > >
> > > > > [1]: https://bugzilla.kernel.org/
> > > > >
> > > >
> > > > The offending commit is https://github.com/SUSE/kernel/commit/288c9=
0224eec55d13e786844b7954ef060752089 :
> > > >
> > > > > Bluetooth: Enable all supported LE PHY by default
> > > > > This enables 2M and Coded PHY by default if they are marked as su=
pported
> > > > > in the LE features bits.
> > > > >
> > > > > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > >
> > > Do you have the btmon/HCI traces showing this, we also need the
> > > firmware version as well since I suspect this is due to the controlle=
r
> > > setting the PHYs as supported but being unable to to use them
> > > properly.
> > >
> > >
> > hciconfig says the below: (I assume =E2=80=9CRevision=E2=80=9D is the f=
irmware version)
>
> You can find the firmware information on dmesg, e.g:
>
> [    7.982585] Bluetooth: hci1: Found Intel DDC parameters: intel/ibt-20-=
1-3.ddc
> [    7.984113] Bluetooth: hci1: Applying Intel DDC parameters completed
> [    7.985111] Bluetooth: hci1: Firmware revision 0.3 build 144 week 11 2=
023
>
> > hci0:   Type: Primary  Bus: USB
> >         BD Address: F0:9E:4A:E6:62:15  ACL MTU: 1021:4  SCO MTU: 96:6
> >         UP RUNNING
> >         RX bytes:150050 acl:8114 sco:0 events:270 errors:0
> >         TX bytes:5970 acl:69 sco:0 commands:173 errors:0
> >         Features: 0xbf 0xfe 0x0f 0xfe 0xdb 0xff 0x7b 0x87
> >         Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3
> >         Link policy: RSWITCH SNIFF
> >         Link mode: PERIPHERAL ACCEPT
> >         Name: '[REDACTED]'
> >         Class: 0x6c010c
> >         Service Classes: Rendering, Capturing, Audio, Telephony
> >         Device Class: Computer, Laptop
> >         HCI Version: 5.2 (0xb)  Revision: 0x20ce
> >         LMP Version: 5.2 (0xb)  Subversion: 0x20ce
> >         Manufacturer: Intel Corp. (2)
> >
> > I'm unsure how to attach the btmon output as it is a binary file that c=
ontains potentially private information (names of nearby devices)
>
> Well you can collect it manually and redacted the addresses, etc, up
> to you, I'm usually not that paranoid of sharing this kind of
> information if you scan for a short time, in the other hand I usually
> use gist.github.com to do that so I can delete it later if needed.

Seems to be working fine here (with AX201 and AX210):

https://gist.github.com/Vudentz/d80ab63f4f62f9f216796edb4838c855

> >
>
>
> --
> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz
