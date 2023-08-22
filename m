Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5AB1DA54
	for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 18:05:33 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2bbad32bc79so80637841fa.0
        for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692727531; x=1693332331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IhQdT3dkh2KEK8Jz6QktLd8PGIgU9IndPi0WIC/z3E=;
        b=Vu4NQ/nSpJKQhO06vbCtAsAqkqmW2tHp9+Yco4mYo8nAQaJiBZ7Peqm33pL6lWa/fo
         tpfxNm1D0ZzcdYK0uEDocIUD/wsWa0FibprVC3Mvm+8ucEJnC3vltMlysbGlyLIqLszG
         qaO462N7x8vIdkR5uaE8ota+M2jepOLYUO5peP/+G26wXgrOqBnhlwsR7ZMk3K81Uj/d
         /0friA8/B09TlHaNmZkwXjpaGQpUax5rucU2TH83Asn6Vt+/cOMvi3Tb64qvscAZwIZe
         Tkr2fF+nmFY2S5ULaJ5WENoX/EpVUhmwobBabF5yITOMnP5DhWJSvDtR5ZrIrrRJysYF
         KIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692727531; x=1693332331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IhQdT3dkh2KEK8Jz6QktLd8PGIgU9IndPi0WIC/z3E=;
        b=KfNiEyL/am5kL21M/K3tGHc1vd1Uv9RaG7W1n4mOCrbM4JOWt4QcqfkXK1kEgb+Slj
         fQGbOK+XY3z4mUqnyByZraE2peFYSAgftLlnYdPtX+tH+gWQ/+txqpRy/e4U7MM2Bi78
         ZNrT8oDlE4fFK+5S+Omz4jytx4lbzEm4HAwwNQtcqir86E923T+u/HgfS5bJ7euz2ygu
         OGiigo4vg0Gx+0DKbH87FQyvXY4/IHXOq6nAvJnJvhhgMFFc1ViiLlFABEmLpEWOkozi
         uqvxN1+AZS04RlFco4KWkABDpwJMZhieNff+SeRMykgcGVvR06z3C9H+P6CZLKCCIakP
         e9hA==
X-Gm-Message-State: AOJu0YzYwzg20aCaFxsSLREf8FuyvCmUGTCdGcxpz6XmzHoEX6FfwMMq
	9pl6th6/ZQ2HatS8k1PTmSo4MLmzmrpeVixJsL0=
X-Google-Smtp-Source: AGHT+IFLTk4JK6m4Cn7iKeUSa624fsEOCfdsx7S1j0HSwiT7o772267o28gh379GHHXIC1W1Y/31vUUQTLTBdsusCkE=
X-Received: by 2002:a2e:2c18:0:b0:2bb:a6b0:cf66 with SMTP id
 s24-20020a2e2c18000000b002bba6b0cf66mr7864610ljs.2.1692727530980; Tue, 22 Aug
 2023 11:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2300626.ElGaqSPkdT@bruno-beit> <CABBYNZLo0WT+VovmB3AKPKNNLXPNPBdECNzf6MNu+aL6d91naQ@mail.gmail.com>
 <CABBYNZ+z_=ZfJQQJ=A-HC7Ox+1jueeb_oWwcerC0YKS8z0QMug@mail.gmail.com> <11520919.Tf534PAFkr@bruno-beit>
In-Reply-To: <11520919.Tf534PAFkr@bruno-beit>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 22 Aug 2023 11:05:18 -0700
Message-ID: <CABBYNZKco-v7wkjHHexxQbgwwSz-S=GZ=dZKbRE1qxT1h4fFbQ@mail.gmail.com>
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

On Tue, Aug 22, 2023 at 7:29=E2=80=AFAM Bruno Pitrus <brunopitrus@hotmail.c=
om> wrote:
>
> Dnia poniedzia=C5=82ek, 21 sierpnia 2023 22:08:45 CEST Luiz Augusto von D=
entz pisze:
> > Hi Bruno,
> >
> > On Mon, Aug 14, 2023 at 4:38=E2=80=AFPM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi Bruno,
> > >
> > > On Mon, Aug 14, 2023 at 1:21=E2=80=AFPM Luiz Augusto von Dentz
> > > <luiz.dentz@gmail.com> wrote:
> > > >
> > > > Hi Bruno,
> > > >
> > > > On Mon, Aug 14, 2023 at 3:00=E2=80=AFAM Bruno Pitrus <brunopitrus@h=
otmail.com> wrote:
> > > > >
> > > > > Dnia pi=C4=85tek, 11 sierpnia 2023 19:11:50 CEST Luiz Augusto von=
 Dentz pisze:
> > > > > > Hi Bruno,
> > > > > >
> > > > > > On Fri, Aug 11, 2023 at 4:25=E2=80=AFAM Bruno Pitrus <brunopitr=
us@hotmail.com> wrote:
> > > > > > >
> > > > > > > Dnia sobota, 5 sierpnia 2023 09:31:08 CEST Paul Menzel pisze:
> > > > > > > > [Cc: +regressions@]
> > > > > > > >
> > > > > > > > #regzbot introduced v6.3.9..v6.4.2
> > > > > > > >
> > > > > > > > Dear Bruno,
> > > > > > > >
> > > > > > > >
> > > > > > > > Thank you for your report.
> > > > > > > >
> > > > > > > > Am 04.08.23 um 20:55 schrieb Bruno Pitrus:
> > > > > > > > > I am using openSUSE Tumbleweed on a Dell Precision 3551 w=
hich has a
> > > > > > > > > bluetooth adapter of ID 8087:0026 (Intel AX201). I am usi=
ng a
> > > > > > > > > Logitech M575 trackball mouse which only supports Bluetoo=
th LE.
> > > > > > > > >
> > > > > > > > > With kernel 6.4.2 or newer, scanning for devices =E2=80=
=94 using either the
> > > > > > > > > KDE gui or bluetoothctl =E2=80=94 most of the time return=
s only =E2=80=9Cclassic
> > > > > > > > > bluetooth=E2=80=9D devices like computers and phones, and=
 not the mouse. If
> > > > > > > > > the mouse was paired before, it works correctly however.
> > > > > > > > >
> > > > > > > > > With previous kernel versions (6.3.9 and before), pairing=
 the mouse
> > > > > > > > > worked correctly.
> > > > > > > >
> > > > > > > > Are you able to bisect the regression? Please also attach t=
he Linux
> > > > > > > > messages. (You can also create a ticket in the Linux kernel=
 Bugzilla [1]
> > > > > > > > and attach everything there.)
> > > > > > > >
> > > > > > > >
> > > > > > > > Kind regards,
> > > > > > > >
> > > > > > > > Paul
> > > > > > > >
> > > > > > > >
> > > > > > > > [1]: https://bugzilla.kernel.org/
> > > > > > > >
> > > > > > >
> > > > > > > The offending commit is https://github.com/SUSE/kernel/commit=
/288c90224eec55d13e786844b7954ef060752089 :
> > > > > > >
> > > > > > > > Bluetooth: Enable all supported LE PHY by default
> > > > > > > > This enables 2M and Coded PHY by default if they are marked=
 as supported
> > > > > > > > in the LE features bits.
> > > > > > > >
> > > > > > > > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel=
.com>
> > > > > >
> > > > > > Do you have the btmon/HCI traces showing this, we also need the
> > > > > > firmware version as well since I suspect this is due to the con=
troller
> > > > > > setting the PHYs as supported but being unable to to use them
> > > > > > properly.
> > > > > >
> > > > > >
> > > > > hciconfig says the below: (I assume =E2=80=9CRevision=E2=80=9D is=
 the firmware version)
> > > >
> > > > You can find the firmware information on dmesg, e.g:
> > > >
> > > > [    7.982585] Bluetooth: hci1: Found Intel DDC parameters: intel/i=
bt-20-1-3.ddc
> > > > [    7.984113] Bluetooth: hci1: Applying Intel DDC parameters compl=
eted
> > > > [    7.985111] Bluetooth: hci1: Firmware revision 0.3 build 144 wee=
k 11 2023
> > > >
> > > > > hci0:   Type: Primary  Bus: USB
> > > > >         BD Address: F0:9E:4A:E6:62:15  ACL MTU: 1021:4  SCO MTU: =
96:6
> > > > >         UP RUNNING
> > > > >         RX bytes:150050 acl:8114 sco:0 events:270 errors:0
> > > > >         TX bytes:5970 acl:69 sco:0 commands:173 errors:0
> > > > >         Features: 0xbf 0xfe 0x0f 0xfe 0xdb 0xff 0x7b 0x87
> > > > >         Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3
> > > > >         Link policy: RSWITCH SNIFF
> > > > >         Link mode: PERIPHERAL ACCEPT
> > > > >         Name: '[REDACTED]'
> > > > >         Class: 0x6c010c
> > > > >         Service Classes: Rendering, Capturing, Audio, Telephony
> > > > >         Device Class: Computer, Laptop
> > > > >         HCI Version: 5.2 (0xb)  Revision: 0x20ce
> > > > >         LMP Version: 5.2 (0xb)  Subversion: 0x20ce
> > > > >         Manufacturer: Intel Corp. (2)
> > > > >
> > > > > I'm unsure how to attach the btmon output as it is a binary file =
that contains potentially private information (names of nearby devices)
> > > >
> > > > Well you can collect it manually and redacted the addresses, etc, u=
p
> > > > to you, I'm usually not that paranoid of sharing this kind of
> > > > information if you scan for a short time, in the other hand I usual=
ly
> > > > use gist.github.com to do that so I can delete it later if needed.
> > >
> > > Seems to be working fine here (with AX201 and AX210):
> > >
> > > https://gist.github.com/Vudentz/d80ab63f4f62f9f216796edb4838c855
> >
> > Can you try with the following patch:
> >
> > https://patchwork.kernel.org/project/bluetooth/patch/20230821181848.355=
3863-1-luiz.dentz@gmail.com/
> >
> > Looks like we were not storing the whole advertisement sometimes.
> >
> >
>
> I applied your patch, along with https://www.spinics.net/lists/linux-blue=
tooth/msg105443.html since that defines the needed max_adv_len macro, on to=
p of the regression-introducting commit. Unfortunately, it did not help =E2=
=80=94 LE devices are still not detected (either at all or after one-two su=
ccessful pairings).

Seems I managed to reproduce:

https://gist.github.com/Vudentz/0988a78da9e5658a06edec159847db27

Looks like ax201 is not generating SCAN_RSP for some reason, will need
to follow up with Intel firmware folks to see what is going on.

--=20
Luiz Augusto von Dentz
