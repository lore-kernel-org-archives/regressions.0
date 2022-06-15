Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4ED7A
	for <regressions@lists.linux.dev>; Wed, 15 Jun 2022 10:08:00 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id r12so11405241vsg.8
        for <regressions@lists.linux.dev>; Wed, 15 Jun 2022 03:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gz01wLOmYbzPFewaBzlsp1NtYztmbI+KjPaWV1zpQ9A=;
        b=Pzn4MqVDehQVMbSv0Q1Xm85YWmnHrd0OAEg7norCMhU41t+kdttCyU5mJs5WTSyI4a
         Ev4Yp6oZBCCTG7sZcgT49J7OsZDJL1KZSbQsHB+gRYgvQPBK3hmWHmny+RNrSOHnVZsE
         TqJ9Y/Tq7TiPIcaeiG4968ifnKGlApK4RNUY9dgIdTBpVss/N9/RY7bHQFHf4uoxnKMs
         44+DG5kQ5J0ek0Uh4OsM6rEbz1WIs3R6cB9DdQsWUm7IVDlc2LgHNUO2Rt25ECPlYLf9
         Q+CyCbouRHkQmYwFay4zCq/b2eHRnH49GjA2bluDhvetL2LKTtaOirG3Wk10TruoE8Oo
         WR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gz01wLOmYbzPFewaBzlsp1NtYztmbI+KjPaWV1zpQ9A=;
        b=h36oGTH0cK3Fx2UzdwoXGFM0V0Vdm1f5mQcC5G6d/ZjGIGldz9Hde/WHxORQUKk2nf
         8xkKQo+7q0oqihspYZSk7YY3lOqOzbsBl98wWYUtngG7ZI+xYj45XbcY2G7Jf2INBEn7
         gDiSq6FVNWmI8rJozHhvz+eDQAeV5nen/Td6HME3vUQf3b1ywu4m5b1kzQb43JDPhx/9
         9kgn34pOGyT0ydxYCa8GmcSivHyxAdrddfPFhsEB8ZcLJS+64ArC1UpAWzozENVUVMIz
         0q2kPmi3QsQpiyBx9Eakv5OeKdo+RWmfyVxmZwIhtceM+Kp40TmCCh8+9nEnabSEu+Li
         kE0A==
X-Gm-Message-State: AJIora97sHQew2LKyImCdvJ+pFeSlvzxy1pA29CuEzFEo8peQ+JGFykz
	SzF3zcQiIgzvpPtpQD2rHTLlF/BSh4idgqGiGw8=
X-Google-Smtp-Source: AGRyM1uaMPZ5nuoTW+CbluiDhGGas1p5vSDfQirdJ16KSHY9gRMbLgEmoqvdcgfcfYfzOo+I6kfHtx44D09cbMENev0=
X-Received: by 2002:a67:cd16:0:b0:34b:95ab:715a with SMTP id
 u22-20020a67cd16000000b0034b95ab715amr4458171vsl.19.1655287679078; Wed, 15
 Jun 2022 03:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f038d6f9-b96b-0749-111c-33ac8939a1c0@i2se.com>
 <57664575-d02e-44fd-0314-d2e814775fdd@i2se.com> <CALeDE9PuZbWzSkA=fa+z+yhOox-ZEVuRO1_gyJp_d73ouSZtMw@mail.gmail.com>
 <05b3ae90-b66b-84c4-b525-dbab3aa677eb@i2se.com>
In-Reply-To: <05b3ae90-b66b-84c4-b525-dbab3aa677eb@i2se.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 15 Jun 2022 11:07:48 +0100
Message-ID: <CALeDE9PB+25eq7ouxuhPj7-mOLT00CyRh4sAeKYkqvoDtPUo=w@mail.gmail.com>
Subject: Re: [BUG] null pointer dereference when loading bpf_preload on
 Raspberry Pi
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: bpf@vger.kernel.org, jpalus@fastmail.com, regressions@lists.linux.dev, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Shubham Bansal <illusionist.neo@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

> >>> Jan Palus already reported this NULL pointer dereference on bugzilla
> >>> [1], but i want to make sure this is noticed by the right people.
> >>>
> >>> I've i boot my Raspberry Pi 3 B Plus with multi_v7_defconfig and the
> >>> following config settings:
> >>>
> >>> CONFIG_BPF_SYSCALL=y
> >>> CONFIG_BPF_JIT=y
> >>> CONFIG_BPF_JIT_ALWAYS_ON=y
> >>> CONFIG_BPF_JIT_DEFAULT_ON=y
> >>> CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
> >>> CONFIG_USERMODE_DRIVER=y
> >>> CONFIG_BPF_PRELOAD=y
> >>> CONFIG_BPF_PRELOAD_UMD=m
> >> are you able to see this issue in 5.18.x, too? I'm asking because the
> >> BPF settings comes from your configuration.
> > I've not seen it in a standard boot, is there a simple way to test
> > this, TBH I've never really played with bpf (it's on the todo list) so
> > if there's an easy test I can certainly check.
>
> it's just during boot. No need to do something special.
>
> I want to figure out, if this is caused by my cross compile environment.

No, not seeing that anywhere, I've got 5.18.3 running on omap/rpi/imx6
32 bit devices without anything like that

We had an issue around BPF on arm32 back in late 2018 and I tried to
turn some of the options on in defconfig so they'd have wider testing
but got push back. I don't remember the exact issue there though (and
it's long been fixed)

Peter
