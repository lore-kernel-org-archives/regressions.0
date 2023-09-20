Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5191A5B6
	for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 21:47:04 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c469ab6935so23475ad.1
        for <regressions@lists.linux.dev>; Wed, 20 Sep 2023 14:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695246424; x=1695851224; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gANn8NVB2NEK8/dkBC5MGqGDIrIr0tBy9ASv9Dt/xcQ=;
        b=cdAA6Fsru3f8H8smxMPuEnwjJ4hVKrhsTtPRA9X83ZQbRExL4VEZyVqYHOhYxqsQjV
         ffzSV1GQ43yALLR6WZk7520d1Y9SHPlMlYuRV7AG7HAsW4flDbZ8rREMkGqso2qrSKDB
         Z3hdtiP+M6Yk/Yr9FPGUXkb13cg1bw1osQvHLzQIKY6rSLcXI3oG+CY7+5saGf72AYS1
         FHr0f7Vwn4xOFsbDCURqF9e58iBmtIGsgRKXXAQx/HKvEzSOTarUxzHG3y06+zcS7xfy
         MDX4rkDhiHMBPOeroj8m35QcgK7VSEDewfYT/BRpTfAcje3T/FPQexEJD8subKjNAI/K
         e8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695246424; x=1695851224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gANn8NVB2NEK8/dkBC5MGqGDIrIr0tBy9ASv9Dt/xcQ=;
        b=bgOpKDvoHgCrnLus8x30eMzcl3CnhknRretGiBsXRod0BZfn2qqCWY2wXbdF0+KmKU
         Y85tNy6ZrZRCEsYocQZa+FILaaxauIZDDT7RXxcK+Q/gMNJChnD8qc5DS1K113qgScZU
         7SEd3AUi0xvsXy4EtZXc7lJi2vDGF4ZjInIWoS33r8E8U02biXcAv//QwFLq2LLldVT3
         ku6V0brt6FcyOyX6GfWc7tN6nWbw3WScTON6kxizLn44JUP4WyzXGK4LwFHr/aX4xGdc
         qEZaxvw/b0mvZWZrx/DSe3naK0K7ihmgZ4dFFDhG/H0hb662Ir4ZYq5g5v2IeA8BQLAr
         0jaQ==
X-Gm-Message-State: AOJu0Yzb2uTXS62Ok0vmqZZcsjyTpRpD3uocyMm96SvXopFoYe1qYYrj
	lF9QAzzg5dNindkg8fO9cGdakZiKWgJs+Ri9Hu6GJA==
X-Google-Smtp-Source: AGHT+IFXbWfy6csSqRz3YbIOJf32CePT0J0T1e3RUq2k1c/wNw2XTsxo4NBrKI6WzhP+fZJL+GEvVH2o8pllJgrDPj4=
X-Received: by 2002:a17:902:c949:b0:1c4:1392:e4b5 with SMTP id
 i9-20020a170902c94900b001c41392e4b5mr20503pla.21.1695246424078; Wed, 20 Sep
 2023 14:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230917191042.204185566@linuxfoundation.org> <20230920081101.GA12096@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <ZQqwzK/fDm+GLiKM@dhcp22.suse.cz> <101987a1-b1ab-429d-af03-b6bdf6216474@linux.microsoft.com>
 <ZQrSXh+riB7NnZuE@dhcp22.suse.cz> <4eb47d6a-b127-4aad-af30-896c3b9505b4@linux.microsoft.com>
 <ZQr3+YfcBM2Er6F7@dhcp22.suse.cz> <CALvZod7E_Jm9y+40OKtLs5EFA0ptKGjoe2BU58SY29pUiPc93g@mail.gmail.com>
 <ZQskGGAwlsr1YxAp@dhcp22.suse.cz> <CALvZod6b3=+=xXEUeWOQW3t_URJpeeVX46WjBHv5BS+436KoFA@mail.gmail.com>
 <ZQtRKzUOfdaVKRCF@dhcp22.suse.cz>
In-Reply-To: <ZQtRKzUOfdaVKRCF@dhcp22.suse.cz>
From: Shakeel Butt <shakeelb@google.com>
Date: Wed, 20 Sep 2023 14:46:52 -0700
Message-ID: <CALvZod5DSMoEGY0CwGz=P-2=Opbr4SmMfwHhZRROBx7yCaBdDA@mail.gmail.com>
Subject: Re: [REGRESSION] Re: [PATCH 6.1 033/219] memcg: drop kmem.limit_in_bytes
To: Michal Hocko <mhocko@suse.com>
Cc: Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, Tejun Heo <tj@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, mathieu.tortuyaux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 1:08=E2=80=AFPM Michal Hocko <mhocko@suse.com> wrot=
e:
>
[...]
> > have a strong opinion against it. Also just to be clear we are not
> > talking about full revert of 58056f77502f but just the returning of
> > EOPNOTSUPP, right?
>
> If we allow the limit to be set without returning a failure then we
> still have options 2 and 3 on how to deal with that. One of them is to
> enforce the limit.
>

Option 3 is a partial revert of 58056f77502f where we keep the no
limit enforcement and remove the EOPNOTSUPP return on write. Let's go
with option 3. In addition, let's add pr_warn_once on the read of
kmem.limit_in_bytes as well.
