Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD31B111AB
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 15:55:13 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so23208a12.0
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 08:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695830112; x=1696434912; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSrmv8CdZOJwg8Rjk/t0kAfEdW3//3EbfZ/Siaum1BY=;
        b=afIfWQOrFxOnBEDsb4MYS8oezP3KkisO5JXoSYwvar9QtzFUOFMGbo0kZ2to8/7BF5
         UGFDyj0Txha8N3zhNK821nhvKqSiE3FqwRMVxszgFEs2OJmJP/e6R4Zknl7lWjunXvHb
         dUrfYeLYczjka+h8hCW7sYCm1olZT4zDOSctG0iWx0en8E3JefWm+dQF+ZV1/3WZ0y5U
         LarnVT/SJu07t14tJrZ5EryYBrxhhktViIAvqNLUv06xIE/GOSxiCriocnL+bWLkiw2z
         fppCmbt79v4NzboIlaY8DEA2O5Qvuqb9gNiCmCmenCPQrC4MXL/J0CrEOT9ez26s2ciu
         MFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695830112; x=1696434912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSrmv8CdZOJwg8Rjk/t0kAfEdW3//3EbfZ/Siaum1BY=;
        b=QwcBRk7b7nEa+PYBocRgX+fXdjwpgld46//clcz1BnlsELjffFAbPEeEvCrdut7BaV
         hn4AkfMROrRp/Gma7Agr88v3S7yyTCg0DnYp4DSO9/1VIDFbR891IIkysmiA/bNULY/q
         +tsyX9nfeyCgnV/QbBO3pAnZSSfEM7NzXPsLApNKRoZZGclVPieANd9o/C67g3boxvCV
         YrwIXOPMqVKmMjKU7NW5lJPHsyOWoPtvTaX+pH8xMSA03LCxbeqZUqtWq3tC+A5ulZVE
         nG6xUMUAYjlx1HyH9KJmTCe1paYLdpC5sSg5fjHbV6rTfjnUyHbEe9hjuHzPgO+xUy48
         hDkQ==
X-Gm-Message-State: AOJu0YzqyUMb3QHWVuZIwJD7LLyoMLqga1jbe6xqAktWfTHIWHlguB7D
	gdg2s+UKt5KgVDlFgZ7MVYNyxhH9bQzxJq+JAByA6g==
X-Google-Smtp-Source: AGHT+IH0RKGEqZ50b13IkHIPc4aRaJwDAkjl9e3uG8Mv6eJajLiyCcSvo5RAHFMmzFLDsmR8oJbDoGjAv+5jxCncXkI=
X-Received: by 2002:a50:9fef:0:b0:525:573c:6444 with SMTP id
 c102-20020a509fef000000b00525573c6444mr266714edf.1.1695830111711; Wed, 27 Sep
 2023 08:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info> <CAAzPG9NkoaUz_JRtZt_JomsYj-8ZPn4QH0w0eeR-oxd55-18Qg@mail.gmail.com>
In-Reply-To: <CAAzPG9NkoaUz_JRtZt_JomsYj-8ZPn4QH0w0eeR-oxd55-18Qg@mail.gmail.com>
From: Jeffery Miller <jefferymiller@google.com>
Date: Wed, 27 Sep 2023 10:55:00 -0500
Message-ID: <CAAzPG9NWp8yPU52o7d2-jLjxjLodFOiE_AjoxmCAZ=MXtV__Aw@mail.gmail.com>
Subject: Re: [regression] Resume broken on T14s Gen1 (AMD) due to "Input:
 psmouse - add delay when deactivating for SMBus mode"
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Andrew Duggan <aduggan@synaptics.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Wed, Sep 27, 2023 at 10:43=E2=80=AFAM Jeffery Miller
<jefferymiller@google.com> wrote:
>
>
> On Wed, Sep 27, 2023 at 3:54=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis=
.info> wrote:
>>
>> My dmesg from a kernel with the revert:
>> https://www.leemhuis.info/files/misc/dmesg
>>
> In this dmesg output it shows that this is an elantech smbus device:
> ```
> [    4.260415] psmouse serio1: elantech: assuming hardware version 4 (wit=
h firmware version 0x7f3001)
> [    4.279297] psmouse serio1: elantech: Synaptics capabilities query res=
ult 0x90, 0x18, 0x0f.
> [    4.292788] psmouse serio1: elantech: Elan sample query result 00, 80,=
 c9
> [    4.319184] psmouse serio1: elantech: Elan ic body: 0x10, current fw v=
ersion: 0x3
> ...
> [    4.346951] psmouse serio1: elantech: Trying to set up SMBus access
> [    4.346986] psmouse serio1: elantech: SMbus companion is not ready yet
> [    4.369993] input: ETPS/2 Elantech TrackPoint as /devices/platform/i80=
42/serio1/input/input7
> [    4.376200] systemd[1]: bpf-lsm: LSM BPF program attached
> [    4.385192] input: ETPS/2 Elantech Touchpad as /devices/platform/i8042=
/serio1/input/input5
> ```
> The change in 92e24e0e57f72e shouldn't affect the elantouch device as  el=
antech_setup_smbus
> initializes `psmouse_smbus_init` with need_deactivate =3D false.
>
> Did you store dmesg logs from boot without the applied patch?

I intended to ask if you have logs from a boot without 92e24e0e57f72e rever=
ted.

> If the delay was being applied the timestamps should show the 30ms delay =
between
> `psmouse serio1: elantech: Trying to set up SMBus access`
> and
> `psmouse serio1: elantech: SMbus companion is not ready yet`
>

Thank You,
Jeff
