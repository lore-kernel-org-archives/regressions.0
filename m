Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817262CB3
	for <regressions@lists.linux.dev>; Wed, 15 Dec 2021 16:00:57 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id bj13so32273401oib.4
        for <regressions@lists.linux.dev>; Wed, 15 Dec 2021 08:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PwApw9PjH2yz2rvdbTIYDC862JRH1fKxIcZRKXcAvbA=;
        b=k0JXkgDLil6SMMqhrxmmxR4P08TnBBmErqdO9lwn/FfmCNSpl1dYAdCedwNyMaZI/Z
         7UEQobQAyy6wFjO3vO1w/KAip12KfNvB/ENNWAFPI/X7yI81xMlz6CrMs3gVY1G2rgmq
         vg53SYjVJSND6xl1U0GdJDExrnYu9ohgz8HeyEAD2rFDMD1QUOjFkkhIpWwVwoe2tRzu
         I7s6sqGquD7eVjm/RlEozfQ7JkLWhShuRiz0LwHhdDW14hTb22NPvB2fLTzRFEfP20i7
         GQNfTwrX08OhGqLzN7gGKnv50MzRI9SM1Zksxic2J9+JvN+l4RXE0HuqBERDVHmppufN
         LTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PwApw9PjH2yz2rvdbTIYDC862JRH1fKxIcZRKXcAvbA=;
        b=XstlN//laUKZ3CoVdlbM9oM+rX13afxun3kaDuA2vi32FRyPet/nm9G+GjtbUYWFjN
         iH61m12XUUmp/AJtdlG8SvWLcG3izxfZ6T/+164AY50j7dfwW6MW00kPPfPn01N7m7JY
         yZw8jPO/kAeAFwNeyHGcjHG0wCEKZUAIDoeqB/t0YMWrCuVGP4IjF2B6cNHnY+PSIcAm
         RfqetceATOtY1YOKVAPj3MRifMg5V8Wc3+RDLq9M7skdVTgv6LQswSgGyuGVdj4EnwPn
         Xw0Gg4VMPvNmPE2/qHnurqEfcTqzHZx5tuzXrLU89WpfZEgaNO44tB5pmMvIggEa5BAd
         946g==
X-Gm-Message-State: AOAM532e+eDfKfvwO45koePNaOTBXZTMm5gPXr2FxekC42WmkCH78tmX
	lKXWHceu4FNJxAlMSywUXPKvgzfGZptohWUDFUo=
X-Google-Smtp-Source: ABdhPJz8Liw6b3WAmXhze6uMCia5MWHl7fCmy5pyYMkJRfUimrCweXsryGEU6yss8aRFczJycN3GngpKU1vJWoX7k5w=
X-Received: by 2002:a54:4104:: with SMTP id l4mr358172oic.17.1639583715951;
 Wed, 15 Dec 2021 07:55:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
 <d406fd08-39d9-42db-f01c-2eccf5b0be00@norrbonn.se> <CACjc_5pHbLStniQnOVLDW5iLbKn8ovePuQsFFqeEnQPSSYxJoQ@mail.gmail.com>
 <42f2afc6-f1a0-dc33-830e-0fcc5382ed1d@microchip.com>
In-Reply-To: <42f2afc6-f1a0-dc33-830e-0fcc5382ed1d@microchip.com>
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date: Wed, 15 Dec 2021 12:54:49 -0300
Message-ID: <CACjc_5qZjXbE1CwQCpc4+vzbsobfn5YKpU=UCVJpMGG1ROEfTg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget (atmel_usba_udc)
To: Cristian Birsan <Cristian.Birsan@microchip.com>
Cc: Jonas Bonn <jonas@norrbonn.se>, regressions@lists.linux.dev, 
	Nicolas Ferre <Nicolas.Ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ludovic Desroches <Ludovic.Desroches@microchip.com>, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Felipe Balbi <balbi@kernel.org>, Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian,

On Wed, Dec 15, 2021 at 10:04 AM <Cristian.Birsan@microchip.com> wrote:
>
> Hi Marcelo, Jonas,
>
> On 12/13/21 4:31 PM, Marcelo Roberto Jimenez wrote:
> >
> > Some people who received this message don't often get email from marcel=
o.jimenez@gmail.com. Learn why this is important <http://aka.ms/LearnAboutS=
enderIdentification>

Hum, shame on me.

> > Hi Jonas,
> >
> > Thank you for the quick response, I really appreciate it.
> >
> > On Mon, Dec 13, 2021 at 7:02 AM Jonas Bonn <jonas@norrbonn.se <mailto:j=
onas@norrbonn.se>> wrote:
> >
> >
> >     Given that the patch that you want to revert is almost 3 years old,=
 it's
> >     a bit of a stretch to call this a regression.  I suspect that a cle=
aner
> >     way forward is to introduce some kind of quirk for your board.
> >
> >
> > Well, the board is basically the MPU, so if there is a hardware problem=
 it would mean that it is a problem with the on chip peripheral.
> >
> >
> >     I have a self-powered board where the USB suspend sequence works an=
d
> >     device add/remove works fine.  So fundamentally, I suspect that the
> >     driver is ok.
> >
> >
> > Maybe you have VBUS sensing enabled in your board. As I reported before=
, the VBUS sensing is not an option in this board. Nonetheless, the code in=
 the kernel suggests that VBUS sensing is optional, since the presence of a=
 VBUS sensing pin is explicitly tested in it.
>
> Is it possible to add a wire that connects VBUS to the right pin on the M=
PU ? Just to see if this has an impact or not ?

Yes. Maybe I was not clear about that issue, so let me try to clarify.
The board _seems_ to have a provision for VBUS sensing, but it is not
working. I was not involved in this board's project and I found no
other documentation on the ACME Systems site, all I am saying here is
from reading the circuit diagram, so it is all my personal
interpretation. For hardware reasons, the aforementioned VBUS sensing
pin does not reach zero volts when the USB connector is removed, which
makes VBUS sensing ineffective. But I have tested it anyway and to
make it work, the first step is to prepare the board as specified here
https://www.acmesystems.it/arietta_power_supply in the section "Supply
power at 3.3 volt". The key here is to remove the R36 resistor, so
that the board can be fed by an external 3.3V voltage and become self
powered. Then, you add a line "atmel,vbus-gpio =3D <&pioB 16 0>;" below
the "usb2:" line in the Arietta DTD. After recompiling the kernel and
installing, it still does not work by just unplugging the USB cable.
You need to manually and carefully (!) short circuit the +5 USB line
to the ground when the cable is not connected. Only then VBUS sensing
will work and the device will accept enumeration again.

In short, the VBUS sensing code in the kernel is ok. But that is not
my point. My point is that the kernel code implies that it is possible
to do without a VBUS sensing pin. The file
Documentation/devicetree/bindings/usb/atmel-usb.txt states that
"atmel,vbus-gpio" is an optional property. So, it seems to me like the
code should work without it, and indeed it worked. That is why I have
called this a regression.

> >
> > I have not read the full USB spec, but if this is a fundamentally not r=
esolvable problem, maybe we could have a configuration option, runtime or c=
ompile time, to enable or disable SUSPEND state, assuming that there is no =
problem with the original patch.
> >
> > In my particular application, it is more important to detect the discon=
nection, so that we can reconnect, than to enter SUSPEND. Whenever USB is n=
ot necessary, it will not be connected, so the energy saved will be very li=
ttle in my case.
> >
> > My intention with this patch is also to provide a quick fix for anyone =
facing this problem, reverting is not necessarily the best long term soluti=
on, especially if the code is found to be correct. But assuming the chip US=
B controller has no design flaws, and assuming it should be possible to do =
without VBUS sensing, then the present code should be missing some detail.
> >
>
> I would prefer to have a clear understanding of what is causing the issue=
 before making any changes to the patch sent by Jonas in the upstream kerne=
l.

Indeed. We must understand properly how the code is changing the state
of the USB state machine. I do not have the knowledge of this
protocol/state machine inner workings and what are the code
assumptions in this regard.

> Marcelo, can you point where the driver hangs ? One can enable debug mess=
ages in the driver by using #define DEBUG_LEVEL DBG_ALL in atmel_usba_udc.h=
.

As far as I know, the driver does not hang. I do not have an USB
analyzer to check the protocol, but from the logs on the host side,
the gadget code seems to be rejecting enumeration the second time it
is plugged, and my assumption is that this is due to not having
detected the disconnection.

> >
> >     With all that said, I'm not immediately in a position to run tests =
on my
> >     SAMA5D2 board right now and the kernel on that board is 5.2.  I'm n=
ot
> >     sure when we we would notice that USB suspend stopped working becau=
se
> >     there is no kernel maintenance planned for that board, as far as I =
know;
> >     someday, however, that work might happen and the lack of working US=
B
> >     suspend will be a regression in and of itself.
>
> >
> >
> > I can test it with the AT91SAM9G25 processor and I can also get a SAMA5=
D27 board to test with.
>
> I was able to run the tests on the kernel version pointed by Marcelo (5.1=
0) on SAMA5D2 Xplained and on SAM9x60-EK (the USB IP version on this one sh=
ould be closer to AT91SAM9G25).
> It works on both boards with no issues. Both our boards use VBUS sensing.=
  Unfortunately, currently I do not have access to a board with AT91SAM9G25=
 or to ACME Arietta to check / debug on it.

From what I read in atmel_usba_udc.c, it should be possible to emulate
the absence of VBUS sensing by eliminating the "atmel,vbus" or
"atmel,vbus-gpio" line from the DTD file. So in principle you can test
it with your boards.

> >     Thanks,
> >     Jonas
> >
> >
> > Best regards,
> > Marcelo.
> >
>
> Regards,
> Cristian

Best regards,
Marcelo.
