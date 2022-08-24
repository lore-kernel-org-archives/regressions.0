Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF65F7E
	for <regressions@lists.linux.dev>; Wed, 24 Aug 2022 14:45:53 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-11ba6e79dd1so20962860fac.12
        for <regressions@lists.linux.dev>; Wed, 24 Aug 2022 07:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=xJW2jI96Zwcrvy+eTtY4zwb6R7KH49EInbBsysTbn04=;
        b=VhZ1r9dZw+q80O6nYjGPVr3Ni0ZZ1y1ZdEbIemDT/Di6L0qxY/Ro2D2l+08GZvkmkm
         ukKNV0tJ6aDz+zMJ1XKSVlUh6dnx//7R+ufQT0kH5YQ7laUchITugBQMDWGJ1NAIZ3Vd
         ghRuDpnMAINyfbwg/aLX+/9jH2RlbDkUk7UuiG9MqBHkx6/VkB5uaIylZs4Jp7n55sau
         wo3eS/AbWetL4ts1TRUXKjAeGnK6i3iV0OHPFplupPkUxwYXpbB+sUYVSyIQH9g2rlrC
         7grIxYeK4TwjZ7x6R7ABxXZheJ+50ruDEKqTf3iHjm2ho15RdQBmamCGbZAv8RzJJM5V
         slqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=xJW2jI96Zwcrvy+eTtY4zwb6R7KH49EInbBsysTbn04=;
        b=fGDJ5dw0MCUV67dhnk9oPgHi+gCLVPFEnmH9p3yHas+z0Qzkvi8NQoi4rSH/nmMYJ2
         FJWwdJZGJOdPe62ayE8YH7KWcpxoW35XsJwuJGjp68L7Ub8bgroWkrvQNySuGwdzdYVb
         YhDQgWlvPRc9oEHye2BLA09OP5N+zUglLmFIik5fqkLwz4SMCbFmrkeHmfE/RPox1S5D
         vTPFWItHpFRDQThlONcmsy5wMst6KkRRsKCdMeIRDswkSr1DxUHZlSE/jEh0ZVwnt7Uy
         DPiA5ydhZxJTuL8GpcAJZcyXCgSwkzN/dhFSz4EZFMesNDcxi71p90/mh7xs3dj4Z2Xn
         +hPA==
X-Gm-Message-State: ACgBeo2s9l4QHTF6WCpWJqkS5fIIZ4p3nl2lXDdiqwl2zsaHfAlyfUFA
	DL8ojIipxgZAuQwstBSVp/4QzRn/hpQWVD8NKp4=
X-Google-Smtp-Source: AA6agR66fkmkvlbzDo7a46+yk6fXL1KDXUmUWrF+QVrtdW+IrekthVSmJuG9nEr3Bc6wthKrZ+24RcujERHX4470XWs=
X-Received: by 2002:a05:6870:5a4:b0:11d:37b3:ff54 with SMTP id
 m36-20020a05687005a400b0011d37b3ff54mr3703850oap.172.1661352352883; Wed, 24
 Aug 2022 07:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220819190725.GA2499154@bhelgaas> <6aad506b-5324-649e-9700-7ceaaf7ef94b@amd.com>
 <CAARYdbhVwD1m1rAzbR=K60O=_A3wFsb1ya=zRV_bmF8s3Kb02A@mail.gmail.com> <30671d88-85a1-0cdf-03db-3a77d6ef96e9@amd.com>
In-Reply-To: <30671d88-85a1-0cdf-03db-3a77d6ef96e9@amd.com>
From: Tom Seewald <tseewald@gmail.com>
Date: Wed, 24 Aug 2022 09:45:41 -0500
Message-ID: <CAARYdbhdR0v=V82WnQOGBNrcth8z6F_61SxG9OTzgNpgg3xx7A@mail.gmail.com>
Subject: Re: [Bug 216373] New: Uncorrected errors reported for AMD GPU
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, regressions@lists.linux.dev, 
	David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org, 
	Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
	Kai-Heng Feng <kai.heng.feng@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Alex Deucher <alexander.deucher@amd.com>, Stefan Roese <sr@denx.de>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 12:11 AM Lazar, Lijo <lijo.lazar@amd.com> wrote:
> Unfortunately, I don't have any NV platforms to test. Attached is an
> 'untested-patch' based on your trace logs.
>
> Thanks,
> Lijo

Thank you for the patch. It applied cleanly to v6.0-rc2 and after
booting that kernel I no longer see any messages about PCI errors. I
have uploaded a dmesg log to the bug report:
https://bugzilla.kernel.org/attachment.cgi?id=301642
