Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E56C378
	for <regressions@lists.linux.dev>; Tue,  5 Sep 2023 16:44:53 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2bd0d19a304so44909121fa.1
        for <regressions@lists.linux.dev>; Tue, 05 Sep 2023 09:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693932291; x=1694537091; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TI5XKlmo+CJsjgSI4p71LCm2s0UeJLQRpJFQV+gA8+A=;
        b=IdbBiAANkugJdiczqp8eEqbnAuBPh4rw9SPo6ZIWlGiRb2Sf2m+9oqCF8RFp0PcUoe
         aOF5ruNEBviDPqpKynq7Y9Fau47iacVi7ZZ1OpbTf8Ic9p2OA14wWuD/0z7kRDfRW5PB
         ZR6REJT1zeT4up3fs5NCYTp0QCB3dIheZTw4eGFhswrgqFzD83K+0GRZ9dLIREYdl9Il
         Z+jwGrlhaoXUz1ifXMuFU3QAYrMFy5/m2AnLsr59EXStXVDQUM46n5lPzWIYS0aUPtaD
         8GoiwEJPKtE3uGFeGQm2Zh2w3Jk3EplVM4mwJYLzFOmc0aUn6YrpsYysZoxAN0ba2UI5
         4fdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693932291; x=1694537091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TI5XKlmo+CJsjgSI4p71LCm2s0UeJLQRpJFQV+gA8+A=;
        b=Nv5J/WlZQwUMMrbX7fXz5S1CLJBVQvXZaJMg4f0kE87FvRMLFB7C56nDjRBY5MX/0X
         4hdnYpu/KzJkEu5dWN3zPNcVXvkTSofCCmZNAQvlNid62THtYyQDu0BIODhcALG5Reg0
         eCpRPHe9+KZxf0ZefKQxkeNrvM6vEdX+baxKUcAyTX3g7X5mKPMK2v3FulzQEMclILMG
         Mwa/vjLPCnCm/FMJbMQtt42RLcnCdCsyV/GzXa/XeHcbXuXkKsJdVAyDv2y5kneyojzf
         j6mgAIAx3rJIszZ7m9jIvNUHrZGRS68c5WxrWqwOVaD0QIM8RMS2eveGH+3+kyA6kFsM
         W/Tg==
X-Gm-Message-State: AOJu0Yz1oJvjRGBM1X5YvR95ZtZtHYwfeYoq+I7ySHfqYJkcIPnaQCkv
	hWgLRsE4yMUGo4A6BTgiWk5vQcvot+/6YDrMy0A=
X-Google-Smtp-Source: AGHT+IG1w4iLh436pA73EaV+2xRNxHjpHWMG2DVf1y31ClKfzTSnb6cWKD3jqo09RmxUQh6Pj8ePlAmpOKwmfK004yU=
X-Received: by 2002:a2e:910d:0:b0:2bc:b0c3:9e8d with SMTP id
 m13-20020a2e910d000000b002bcb0c39e8dmr216569ljg.41.1693932290913; Tue, 05 Sep
 2023 09:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8af186ba-5f64-2102-8f9c-3969b0906893@gmail.com>
 <faa245bf-e925-45b0-9827-b0c9c117e06c@leemhuis.info> <ZPc8v9-lHF4jAcxL@kbusch-mbp>
 <2a379b3a-6ff3-444b-bbad-0fba0bc3a28b@leemhuis.info> <ZPdF3uqbJNSZADzv@kbusch-mbp>
 <CA+4wXKCi+idhPQHx3ywdEDHqRmOyBbhz4Gj4gGr_dDvWBWohQQ@mail.gmail.com> <ZPdYgK0ebgHtDTXd@kbusch-mbp>
In-Reply-To: <ZPdYgK0ebgHtDTXd@kbusch-mbp>
From: =?UTF-8?Q?Cl=C3=A1udio_Sampaio?= <patola@gmail.com>
Date: Tue, 5 Sep 2023 18:44:38 +0200
Message-ID: <CA+4wXKAe3==K1CoSvmRpbmPcR9QK+EuzDB-cNteNB34Cgur_0w@mail.gmail.com>
Subject: Re: Fwd: Lexar NM790 SSDs are not recognized anymore after 6.1.50 LTS
To: Keith Busch <kbusch@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux NVMe <linux-nvme@lists.infradead.org>, 
	Linux Stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten and Keith,

Thanks for the details. I'm still unsure if responding by email is
better or adding to the ticket, but here it goes: I have tried for
days both with complete power off of the machine and cycle-booting all
kernels in succession and without exception, 6.1.x LTS and the patched
6.5.1 kernel always recognize and operate the NVME, whilst the other
kernels also fail with the same error message. As this is my
"production" desktop, though, during the week it's more difficult to
me to perform tests with it, but I will try to do it in a more
methodic way and also with 6.5.1 vanilla.

As for the reason the Lexar doesn't catch the quirk default, I can't
say I catch the complex logic of the driver activation, but I found
out how to "fix" for my case because there are three other Lexar
models in the pci.c file: NM610, NM620 and NM760 (this one with an
additional quirk marked on it on the code,
NVME_QUIRK_IGNORE_DEV_SUBNQN) -- so I guess whatever justifies the
exception for them also justifies for my model, NM790. Might even be
the case that I would need NVME_QUIRK_IGNORE_DEV_SUBNQN (not sure what
it does) like in the NM760 case, but it activates correctly without
it.

--=20
Cl=C3=A1udio "Patola" Sampaio
MakerLinux Labs - Campinas, SP
Resume Gmail - YOUTUBE!
Facebook - Facebook da MakerLinux - Lattes
