Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D90412D760;
	Thu,  9 May 2024 22:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715294482; cv=none; b=qP79+aDdWkAHCi3r+4z1XEntm13CQYAiVbdswkeZ2+97JOAgAS58X2NwDQRn1+9izi3N7bL1tTKzD4ZE6e268JArx6M6vjkxhCdDHGfvhc37SylmKHz6OyGgVx7z5zjhkHEJqDXoPLsikmN0VcBtY/hleWV5cc72LL6Vfyw3Ha4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715294482; c=relaxed/simple;
	bh=phY7JU+m7eOPD897trwriE3HHZeD+uGeCxFqDu6502Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZVey2B3/ihVCIauVi88OrEyncu6szdyYTk2skX+06YREgTwiDFOEMvN99NDDIzNUVXeLkxF1ZzfoVxU/InnHHfbNNxsuZaNDLSqXGPJMkSN8A5KAc2CX17ZV1aAYAR6AQaZjKIh8SULMJ4zQ7c7hQN7Pa5tVa3u5XY9nWGGf9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sglu0Eq/; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sglu0Eq/"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e3b1b6e9d1so16916901fa.2;
        Thu, 09 May 2024 15:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715294479; x=1715899279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQLlHYuQnILU4WLY/vGdazxRwnNHcpsL0gTjVISsLTg=;
        b=Sglu0Eq/w/bl++UxnDPAy1qYSBL9BUcmWk9t/2H0wcdMBr87P0dVKfk4ZdAE5L9oZG
         grBdq67MvMuHeDetcAXgXQtIFJvDuRpT7S3zUhRHdxwsT2L1i30045Scc/SloLYbSc3E
         cdkKXQNwE11SCGx8Nn8Lpf/jJYmlauzeLasoS7sgo/U7wMvNS39oZxXS1RT0cyraeRc2
         zGg2icIGOMtaC37PIfbnnJwOx2KNHYAZJbjX+OUh31XPqYE4hlxw7QbC07aLcZMJTfUT
         ZX+HJ0dpiVQ4gFGAg50Jw5oNnh+EtynuQVDIA0Rw7YdiNVLCP5bjlQR+rjSZGYUW0t/p
         HF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715294479; x=1715899279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQLlHYuQnILU4WLY/vGdazxRwnNHcpsL0gTjVISsLTg=;
        b=UG13x6D5rdVph3MXvU4x7MO1BK60i11FPJ+q35zR4NW710pHPcruUAJ8y0/cry4sXP
         aAEkay1EdRU27xV1IloKAWdpkf+qP06KiENLzOHbiPSEunrxQatJVN32xiBpbVbyTkFO
         NM1Oli9wTH+FOdIV/tqMr/l2KbgD5x5ehN1S6841rWMc0lgwQLrGjAxMbK8J1BZ2jZwU
         MkZpo4gEbHG7qAAoSET9TGSIRfVjZz+jMYD4mihQ4MFA2CJNLragYmraiYh7RZK+dVqJ
         Z7Dqmvq7s63J0q/mj+tHe7ygeOv4p6+3Np3R7Qxr9PKfHRfM24vSxI1u3WzkwAQLBzns
         95+A==
X-Forwarded-Encrypted: i=1; AJvYcCWLrOCzaPVMzbdyRtGgrY+afSTwg5K9/hRiH8TQr8H7mYGDJQJz//w7yklpFwuuabj1JXjMXfGHFBImGhZezcDHCogR+FxotL4vhwHR3oEARLitny9vncsJRGDr0CmbBoLycg==
X-Gm-Message-State: AOJu0Yzo2UZBHbEjgEufelvRpJscJi2ADtEx+TAQqQ5V/itQQ9yRdRHm
	XUOZ3gq054yJoyN2CIaGmqIoxdVCGgm+AOAruwmURqY2/q8iTLTlVGgc9981NIwVxoQsFtoP6N6
	OxQGXWg5ql66noqvjOvvnk457h/JCrpD0
X-Google-Smtp-Source: AGHT+IGM/nlwV8XnbTALPK7uurkT+aTFtdkViykWR3yqa5FH4rGIBmOfDlo+pU3zRToQHqCGGJA1IR21yNQ8HQXFbqU=
X-Received: by 2002:a2e:b618:0:b0:2da:50f8:dfab with SMTP id
 38308e7fff4ca-2e51fd4a80bmr4400851fa.7.1715294478956; Thu, 09 May 2024
 15:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240405204037.3451091-1-luiz.dentz@gmail.com>
 <Zjz0atzRhFykROM9@robin> <CABBYNZLMODHp+jBu2oVDC5Pg6fyAKJugQF0N-XgarjWQJJPObg@mail.gmail.com>
 <Zj0tcmseJCjR4hK2@robin> <CABBYNZLnYz-vPrMbtsJTsLPsyo62j+cxctSkLjRom3bWEU9N3A@mail.gmail.com>
In-Reply-To: <CABBYNZLnYz-vPrMbtsJTsLPsyo62j+cxctSkLjRom3bWEU9N3A@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 9 May 2024 18:41:06 -0400
Message-ID: <CABBYNZJ-6oyLnBov9H_jym9m-9qiUt1ELxYGuBOdZT29aj9MCA@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: hci_sync: Use advertised PHYs on hci_le_ext_create_conn_sync
To: Janne Grunau <j@jannau.net>
Cc: linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Janne,

On Thu, May 9, 2024 at 6:23=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Janne,
>
> On Thu, May 9, 2024 at 4:09=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
> >
> > On Thu, May 09, 2024 at 12:30:21PM -0400, Luiz Augusto von Dentz wrote:
> > > Hi Janne,
> > >
> > > On Thu, May 9, 2024 at 12:06=E2=80=AFPM Janne Grunau <j@jannau.net> w=
rote:
> > > >
> > > > Hej,
> > > >
> > > > On Fri, Apr 05, 2024 at 04:40:33PM -0400, Luiz Augusto von Dentz wr=
ote:
> > > > > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > > > >
> > > > > The extended advertising reports do report the PHYs so this store=
 then
> > > > > in hci_conn so it can be later used in hci_le_ext_create_conn_syn=
c to
> > > > > narrow the PHYs to be scanned since the controller will also perf=
orm a
> > > > > scan having a smaller set of PHYs shall reduce the time it takes =
to
> > > > > find and connect peers.
> > > > >
> > > > > Fixes: 288c90224eec ("Bluetooth: Enable all supported LE PHY by d=
efault")
> > > >
> > > > This commit in v6.8.9 apparently has regressed connecting to LE dev=
ices
> > > > like Logitech mices with Apple/Broadcom BCM4388 devices. Those devi=
ces
> > > > carry HCI_QUIRK_BROKEN_LE_CODED which became necessary after 288c90=
224eec
> > > > ("Bluetooth: Enable all supported LE PHY by default").
> > > > Tested so far only by reverting aaf06285498861d6caaff5b26d30af70dd2=
b819f
> > > > on top of v6.8.9. Looking at the change I don't see anything obviou=
s
> > > > which would explain the breakage.
> > > > I would assume v6.9-rc6 is affected as well but I haven't tested th=
is
> > > > yet.
> > >
> > > Would be great if you provide the HCI trace to confirm the problem.
> >
> > looks like there is an issue with initiating "LE Extended Create
> > Connection":
> >
> > | > HCI Event: LE Meta Event (0x3e) plen 26
> > |       LE Extended Advertising Report (0x0d)
> > |         Num reports: 1
> > |         Entry 0
> > |           Event type: 0x2515
> > |             Props: 0x0015
> > |               Connectable
> > |               Directed
> > |               Use legacy advertising PDUs
> > |             Data status: Complete
> > |             Reserved (0x2500)
> > |          Legacy PDU Type: Reserved (0x2515)
> > |           Address type: Random (0x01)
> > |           Address: DF:F4:9E:F3:A9:72 (Static)
> > |           Primary PHY: Reserved
>
> Looks like broadcom is using Reserved value as primary PHY, no wonder
> it doesn't work, real piece of art that broadcom and apple manage to
> produce and it is not only the PHY that has out of the spec result
> other fields are affected as well.

If I print the actual value then we got:

Primary PHY: Reserved (0x81)

I guess one needs to disregard the reserved range, well until they are
no longer reserved then it will no longer work. Perhaps we should talk
to broadcom to know what is up with using reserved values and if that
is an apple thing then perhaps we could ask them to provide firmware
that acts according to the spec.

> > |           Secondary PHY: No packets
> > |           SID: no ADI field (0xff)
> > |           TX power: 127 dBm
> > |           RSSI: -60 dBm (0xc4)
> > |           Periodic advertising interval: 0.00 msec (0x0000)
> > |           Direct address type: Public (0x00)
> > |           Direct address: 5C:1B:F4:7F:BF:6B (Apple, Inc.)
> > |           Data length: 0x00
> > | < HCI Command: LE Set Extended Scan Enable (0x08|0x0042) plen 6
> > |         Extended scan: Disabled (0x00)
> > |         Filter duplicates: Disabled (0x00)
> > |         Duration: 0 msec (0x0000)
> > |         Period: 0.00 sec (0x0000)
> > | > HCI Event: Command Complete (0x0e) plen 4
> > |       LE Set Extended Scan Enable (0x08|0x0042) ncmd 1
> > |         Status: Success (0x00)
> > | < HCI Command: LE Extended Create Connection (0x08|0x0043) plen 10
> > |         Filter policy: Accept list is not used (0x00)
> > |         Own address type: Public (0x00)
> > |         Peer address type: Random (0x01)
> > |         Peer address: DF:F4:9E:F3:A9:72 (Static)
> > |         Initiating PHYs: 0x00
> > | > HCI Event: Command Status (0x0f) plen 4
> > |       LE Extended Create Connection (0x08|0x0043) ncmd 1
> > |        Status: Unsupported Feature or Parameter Value (0x11)
> >
> > Full trace attached
> >
> > Janne
>
>
>
> --
> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz
