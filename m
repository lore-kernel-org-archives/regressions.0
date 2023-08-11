Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B911734
	for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 17:12:04 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9c0391749so35504211fa.0
        for <regressions@lists.linux.dev>; Fri, 11 Aug 2023 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691773923; x=1692378723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlyaKuwj2DFFxidP787empBBUtzACLvaTTNnrqR+Se0=;
        b=Wrq/oURPgVnyR8qktov2J5GfBHaQ/Kc/E0xg0ntNhhQyk0UaR+n8FOSBfn7ACaloLg
         LigwbXITuMCvLyyidiJRNQWTq34rDqR0MQSK4iyeoxSI4hdjRqUq/pi9/COzO0OVikJR
         W11rOCOuPmzmr/50cuI7HL51CvuhWJ3ic/SaLzMwc+bUTBvQS9/+t2PynjrC5fAWawMi
         51amxgoJlunl/ssJiZAgE6k1BXp5hOQBPh58hnP+ROYFtCcsXLTRf+P88Rr4SpBXl984
         7M4RikX1KZHlOnH3oJOQQt2lOWjbl8V0lVCNjaOoOYyoj2+wXh55jwZJ9rutc8Jz/url
         eXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691773923; x=1692378723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlyaKuwj2DFFxidP787empBBUtzACLvaTTNnrqR+Se0=;
        b=Pv5JzkT7zE3UbGmnbQTEZ+wmSZK5TrFEEpg8Sgit4rdf0N8Fiq3/HEX8ucq3cIS/Wz
         h7Np3OiqhxpJ7MxKEPfx7V+TAzKZsh64jfe/6am2Nmbm0ZFSccmIev/GtzLRyyVO1ZZg
         J58yeHTqQkHgtFlucNCdL8hopZLpQNZxcgp5Kz/nFxef1TAlJR+qnK0+Rp0BYEmDdoWi
         gPRAvHIVDMpHRGbCO0jnzzDkw9NUo7m0w8JOQdvA2P3X4lfb7+k7U/6KnO4F/qAlZSVg
         mnFrkdeIJLJZFXSKANPr0w8uJ404vTJLtKyJqn4DAGwC4WcTwysZ4LWuVxx1ImmXDO/7
         tOkw==
X-Gm-Message-State: AOJu0YxJxz5uCg/psHHApcqd4dnejjYrOJT+x/7RziQwFz42Wgw4EqBF
	b4wdV7YK67QKi8lbhbW7alK/Y6Ltrkuckz9JvbE=
X-Google-Smtp-Source: AGHT+IHcdcO2UJfxUcpxWpL8WCWyLnjAGZQJonFoYsxnrR8wAfX/cWIF0NTB2hX+3vOEKVdDhL5jRJ33xn1VoJkOoWo=
X-Received: by 2002:a2e:3604:0:b0:2b6:e196:68c4 with SMTP id
 d4-20020a2e3604000000b002b6e19668c4mr2076868lja.39.1691773922513; Fri, 11 Aug
 2023 10:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2300626.ElGaqSPkdT@bruno-beit> <47e6ab77-e1dd-4ede-b75d-f484b2593395@molgen.mpg.de>
 <5706628.DvuYhMxLoT@bruno-beit>
In-Reply-To: <5706628.DvuYhMxLoT@bruno-beit>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 11 Aug 2023 10:11:50 -0700
Message-ID: <CABBYNZ+Nt3Rho2=VtVrspRLond2agnKhT1LmeLCGdY4fdxmusg@mail.gmail.com>
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

On Fri, Aug 11, 2023 at 4:25=E2=80=AFAM Bruno Pitrus <brunopitrus@hotmail.c=
om> wrote:
>
> Dnia sobota, 5 sierpnia 2023 09:31:08 CEST Paul Menzel pisze:
> > [Cc: +regressions@]
> >
> > #regzbot introduced v6.3.9..v6.4.2
> >
> > Dear Bruno,
> >
> >
> > Thank you for your report.
> >
> > Am 04.08.23 um 20:55 schrieb Bruno Pitrus:
> > > I am using openSUSE Tumbleweed on a Dell Precision 3551 which has a
> > > bluetooth adapter of ID 8087:0026 (Intel AX201). I am using a
> > > Logitech M575 trackball mouse which only supports Bluetooth LE.
> > >
> > > With kernel 6.4.2 or newer, scanning for devices =E2=80=94 using eith=
er the
> > > KDE gui or bluetoothctl =E2=80=94 most of the time returns only =E2=
=80=9Cclassic
> > > bluetooth=E2=80=9D devices like computers and phones, and not the mou=
se. If
> > > the mouse was paired before, it works correctly however.
> > >
> > > With previous kernel versions (6.3.9 and before), pairing the mouse
> > > worked correctly.
> >
> > Are you able to bisect the regression? Please also attach the Linux
> > messages. (You can also create a ticket in the Linux kernel Bugzilla [1=
]
> > and attach everything there.)
> >
> >
> > Kind regards,
> >
> > Paul
> >
> >
> > [1]: https://bugzilla.kernel.org/
> >
>
> The offending commit is https://github.com/SUSE/kernel/commit/288c90224ee=
c55d13e786844b7954ef060752089 :
>
> > Bluetooth: Enable all supported LE PHY by default
> > This enables 2M and Coded PHY by default if they are marked as supporte=
d
> > in the LE features bits.
> >
> > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Do you have the btmon/HCI traces showing this, we also need the
firmware version as well since I suspect this is due to the controller
setting the PHYs as supported but being unable to to use them
properly.

--=20
Luiz Augusto von Dentz
