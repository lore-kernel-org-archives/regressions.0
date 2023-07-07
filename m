Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DFF1847
	for <regressions@lists.linux.dev>; Fri,  7 Jul 2023 05:09:08 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-40373bc598dso12533201cf.1
        for <regressions@lists.linux.dev>; Thu, 06 Jul 2023 22:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688706548; x=1691298548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T5y/+CDvW4q4nPslYcY1qr6Pi0qBims4XmxOTDD9PnQ=;
        b=jmAZ/s2rnrg58iaLEWp/D0jLfi84pEOPfMtjwV+XM4n35ALR+55gpg6wPtblbqsnHV
         ZczdMxtpywYTugmBaFzxWyTIhBD8cd9vVQOo7lUxaJ2Tx3nvWa4XsWjvvt/1pXJKq7wZ
         FvksSiy5tKxMxWk86f7zeqI5BUWS89/pBvwzh9w7FNPKYyOZKVrH0d7m5xHGU6K7s9jv
         Ku73xa/+z2jKhNv+mMpsFppD+84S0Q+jd2n7ZDOEddAwzh0K35bagqCMxPItgotJ38c6
         NK3p8KZnIWSQgC4rE7rhmvhYvDBDiWdV5mho9/kjajiPvgYuClbbedxPlnG1YUvIPObR
         Mpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688706548; x=1691298548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5y/+CDvW4q4nPslYcY1qr6Pi0qBims4XmxOTDD9PnQ=;
        b=igvFgJiYhu833gxOAt1iVNI18Qsux0gz/llInAgZkCeMx2rPBxDWiYkQxv0MX9lARR
         hdtbPbJZH9dZcNxkS1CHvm2UknQGp7Io5/OakcqeLM6Fx6lFEbj3DDT+1CJF3p6sleQ+
         6dy0BkFrutgqyQK9J2p3FGlRWm6tV3IN1hioc6nek2xHNsp5luNPaFEeP3lMoyPfurPM
         IObyWIm3HbA0n0dsDUoN2bSQtgFcp8AjEn8LeIIzpHVWQR4XiMKZdrFeIGCGSYD7QHft
         gFVr4ou4wDKpWUEIJSMBR6QgYXY4Di+Oi2xtsX5AMtRRbwpV/TdhMETTEhc73zXRduaM
         plug==
X-Gm-Message-State: ABy/qLZmCNGVefm5SGjp3w1gMYgWj+iVF6ULwiGujG2vNH3tVXTEkC1B
	dB5JLbQP9vVxqfiZINeJm6ykHF8VGSShBVbY5VtPfG1c+M/P8PDI
X-Google-Smtp-Source: APBJJlF9DniBjLUxlR4EaKPZmHlVkNHy2BHSJ9i5UpfchxFNbdvHQG6nSwlT4BUa3GisoOc1ziTcbK3M7xtQx0kap34=
X-Received: by 2002:a05:622a:1115:b0:402:9cff:4573 with SMTP id
 e21-20020a05622a111500b004029cff4573mr5331660qty.39.1688706547765; Thu, 06
 Jul 2023 22:09:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info> <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
 <CAD=FV=Xt2KYGY15+f+nHxkzKnwhHzw1A7=o+5kgCDWvHDv0DNg@mail.gmail.com>
 <20230620155902.clspxncyvpodixft@ripper> <5240ce3f-37fa-2747-92ee-23d71619f3ef@leemhuis.info>
 <CAMi1Hd2zunc=WNUE7KT-423RXTiX6LrY2hcWQdV3Dp3o8RdJtg@mail.gmail.com>
In-Reply-To: <CAMi1Hd2zunc=WNUE7KT-423RXTiX6LrY2hcWQdV3Dp3o8RdJtg@mail.gmail.com>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 7 Jul 2023 10:38:31 +0530
Message-ID: <CAMi1Hd2L-j9GHQH+4O6j6m2+HGy5oEsdMv6Qyp4RaWZDNCj-Bw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bjorn Andersson <andersson@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dt <devicetree@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Jun 2023 at 17:18, Amit Pundir <amit.pundir@linaro.org> wrote:
>
> On Thu, 22 Jun 2023 at 13:17, Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > for once, to make this easily accessible to everyone.
> >
> > As Linus will likely release 6.4 on this or the following Sunday a quick
> > status inquiry so I can brief him appropriately: is there any hope the
> > regression this patch tried to fix will be resolved any time soon?
>
> We are most likely to miss v6.4. I'm trying to reproduce the crash
> with tracing enabled, to share some more debug information.

FWIW, I couldn't reproduce this bug on v6.5 merge window commit
d528014517f2 (Revert ".gitignore: ignore *.cover and *.mbx")
on 100+ boot tests last night.
For the time being I'm keeping an eye on it and will trigger the boot
tests occasionally in the v6.5 development cycle.

>
> Regards,
> Amit Pundir
>
