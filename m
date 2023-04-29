Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21E753A1
	for <regressions@lists.linux.dev>; Sat, 29 Apr 2023 18:18:00 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-44307db5d24so299320e0c.0
        for <regressions@lists.linux.dev>; Sat, 29 Apr 2023 11:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682792280; x=1685384280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1iDAowj027iaBmQvYLZLlsdgLbrABEug20GI/GfAo4=;
        b=qFbq5Sj7+zxZlOrpitzMN8wuN/wkDrUeRn3nzPHxlf6QYDD9BDV9wa2Z5bpOvBCqOt
         R3UtJb7Pa/DUIRT6gTEKPJgTsf2BurAFEj8Qo2Mh9AS5gowIPPbkEhuiRcNVmW8+pQG7
         RInOsoIsMZQpz2rFLgXUzlZXgiW/ZfqP+ZRzNiv7PuuHLubvw6i3WD/68aiqqnadFchi
         Btv0PmA25qZ9ZihhRg+1Hgf8YcR7yCeteBIhppqaXyP/CRF69CrJWzNW4dqid56hpfL2
         1luN881Qa2CmFsUAkhd8OAV1aahJAbC6mVGVZmvXSQ2eaPOA1nz4UJQiIRbkZyu1Ud83
         7DWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682792280; x=1685384280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1iDAowj027iaBmQvYLZLlsdgLbrABEug20GI/GfAo4=;
        b=Z8gKQmusxcQiidvdFX8/+DdMEk5BG0d1f4wicjhdUP3KMxr1JTZVXpztfKavfuoSYV
         +KFrZPAi7A5t00kdIsAhS7haopPNMnyHxd/0DSkc3nhVZ6MirTSxbIZT1eR3JW108/KM
         NqMcIaJZJevWAAgVo5G+8uQgRA9sjc9T/igYecvDnOtA14IhA64eQSpRvy3s/E1pL8II
         gNgNZ+zTBjQrHkJn+/4+jQ1tjsnIbnUpXU53kWMg6XQPyQ3fIPr15TrnPTMfJcG5rA2i
         +d3SegIFrQMf2gEyKiaYCre9bd7XoklF3IOZscXMxOam0XJEC0o7rSf+XVWxH/ORpJGm
         S3Uw==
X-Gm-Message-State: AC+VfDyhz9TP3LRnt097EA50f/dD2aF8iOPQg8Dr47Q6gHUqBFYDUbt3
	HW7vOImovO5eAYbevQ+JjrIrORhbutPRytRF/Qo=
X-Google-Smtp-Source: ACHHUZ4gAyBPwxEd6oY9ni3Df1iyIVtAfUw2w1QS6RzCTPmfziF/rQAQXVApUObLwF1k+G4lvXaJeFWCuo7dyiF05b4=
X-Received: by 2002:a1f:e282:0:b0:440:8a24:e71f with SMTP id
 z124-20020a1fe282000000b004408a24e71fmr3264011vkg.7.1682792279508; Sat, 29
 Apr 2023 11:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230429020951.082353595@lindbergh.monkeyblade.net>
 <CAAJw_ZueYAHQtM++4259TXcxQ_btcRQKiX93u85WEs2b2p19wA@mail.gmail.com> <ZE0kndhsXNBIb1g7@debian.me>
In-Reply-To: <ZE0kndhsXNBIb1g7@debian.me>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Sun, 30 Apr 2023 02:17:48 +0800
Message-ID: <CAAJw_Zvxtf-Ny2iymoZdBGF577aeNomWP7u7-5rWyn6A7rzKRg@mail.gmail.com>
Subject: Re: iwlwifi broken in post-linux-6.3.0 after April 26
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Gregory Greenman <gregory.greenman@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linux Wireless <linux-wireless@vger.kernel.org>, Linux Networking <netdev@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 29, 2023 at 10:07=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> On Sat, Apr 29, 2023 at 01:22:03PM +0800, Jeff Chua wrote:
> > Can't start wifi on latest linux git pull ... started happening 3 days =
ago ...
>
> Are you testing mainline?

I'm pulling from https://github.com/torvalds/linux.git, currently at ...

commit 1ae78a14516b9372e4c90a89ac21b259339a3a3a (HEAD -> master,
origin/master, origin/HEAD)
Merge: 4e1c80ae5cf4 74d7970febf7
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Apr 29 11:10:39 2023 -0700

> Certainly you should do bisection.

ok, will do.
