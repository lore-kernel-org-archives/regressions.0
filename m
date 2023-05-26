Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F2848B
	for <regressions@lists.linux.dev>; Fri, 26 May 2023 14:59:15 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-55554c33bf3so569802eaf.2
        for <regressions@lists.linux.dev>; Fri, 26 May 2023 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685113155; x=1687705155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHXQsRBB4P+jMA86kR8YTWRhF2qenOQye1YWW0o++mM=;
        b=dbKW0dWsBI6hTbayeVlK1pBhSWE/+CpLxm6jRPmZ2lcfyZlXVGR/VQl8cChhHsTMXg
         /maVUeIS8DO4pw5R2mgmRPbrZ1ieflOB3n5yoXek81ZnoRaFdBJVgrTmtQ0TfKsBZUzV
         Fo+tYcCrteK5XAFNeiKAD4ZUW8iy/2Ylywn0h/Z9nfnIrPsEtag9PFsLNCJKm6xa6rxq
         FcXSEFQTSDpRrY+N7Ywr5+OqIt3etH6oFYIJ8f1Xw1mlUnTv3gULBUFoepNktm3Yjfu+
         8/e7Pd3sMDR/eb7JVMxmKBBzvjJbwoBPjVvkNfDBW9KRS1+vI+SNGbHwy9vikp+ZaQH7
         HrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685113155; x=1687705155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHXQsRBB4P+jMA86kR8YTWRhF2qenOQye1YWW0o++mM=;
        b=FMiatliS+9fDo145g3NWDNE9zEJo4tSdcKwVPJhOT7GRi6LyQzOFnoi7HKLUmOSWrl
         jbLY7lrrSKQa0GvglA2WTO2E8qHjHRPdtA3FNsxVFIEC39Iyv3vyTudrLEMci4JZkC7q
         hzaRhJvBV0mePnxGkTFPBYqvftiNwOLTN11cxyrmfevGluoREKicjb6U0lIfmwxSo6ZC
         QbBJHGO3MvwJa2NNJCp55GnpNyIy6pWvHWYgEzj6LT7/+y9pAW7GjSSdBocXX6e1X7DR
         apNfxGLniTnPSEpcrs9cDdfIbp6ii0QeilZYRu4d3TMeqAW3EgIPGtwPqdnI4XtnTkeH
         SV8A==
X-Gm-Message-State: AC+VfDwwDiK6JRp2klSJSYBHyBdCBt0H5FrMSoCd/vy0GOiCcWTSJVbg
	dzALggLubNTpVfRn75xQsNaO0htD/EQFm1OIgQ0=
X-Google-Smtp-Source: ACHHUZ5hFkRx+eYlzH26Y1mYbn6oJmGbtPXs318ZiuHvNg5sS1pgRLxzLBtfQHuHu0K2dUxPIvOpcZnOHWPbsVqr7GU=
X-Received: by 2002:a05:6808:1151:b0:398:7db6:7ee3 with SMTP id
 u17-20020a056808115100b003987db67ee3mr1523416oiu.19.1685113154864; Fri, 26
 May 2023 07:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/> <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me> <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de> <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <874jodlnmi.wl-tiwai@suse.de> <415d4bc84aa74c74af913048f28b42a9@realtek.com>
 <87fs7mdofi.wl-tiwai@suse.de> <7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
 <87353kd8b9.wl-tiwai@suse.de> <1170325957764b4cbd7cd3639575f285@realtek.com>
In-Reply-To: <1170325957764b4cbd7cd3639575f285@realtek.com>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Fri, 26 May 2023 10:58:58 -0400
Message-ID: <CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "perex@perex.cz" <perex@perex.cz>, 
	"tiwai@suse.com" <tiwai@suse.com>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 4:09=E2=80=AFAM Kailang <kailang@realtek.com> wrote=
:
> Hi Joseph,
>
> Could you test it with below model name?
> =3D=3D> alc-chrome-book

Yes, manually overriding the model name to "alc-chrome-book" makes it
work properly even on an unmodified 6.3.4 kernel.

Thanks,

Joseph C. Sible
