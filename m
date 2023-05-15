Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85739EA0
	for <regressions@lists.linux.dev>; Mon, 15 May 2023 03:04:10 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-199bcf78252so871900fac.3
        for <regressions@lists.linux.dev>; Sun, 14 May 2023 20:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684119849; x=1686711849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rESEKzY0pGYDvdhzhnHvQvNWcEBIPeEwfTIqe8gY9Kw=;
        b=SFBznUFrkJnYqwS8H/ynSIyUiyvNCdt2Sm9MefoIXDU+h2XMN1Szy6uvGk8xJWk80t
         MUIrbAZxcXu7P7f46BzGfx26X3qC6Ab1xOcYUz+WDukVE/qhWvZxpT8jTXEqIl2GwJPd
         xYvA+SlAODqcI/ngWdylGIHlM6ZJXf/D+rjlsOUrUm+BOZ2CDuCI6F1f/lX4jM3ozx8I
         db4/FBJN0X2VlVJZ43vpjlWUPD3HM98IFa13DUKJXQXX40jr9MCV8nD08Wp/73hZgDG8
         yr8pa7x2ibfBjoKmE8iDA2UMRK7CIu/YOWA7mgOUghAk6vvYbe7cZnltOMzJ9dEIDQvc
         HKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684119849; x=1686711849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rESEKzY0pGYDvdhzhnHvQvNWcEBIPeEwfTIqe8gY9Kw=;
        b=aA4qNEwJCvi6373bjJ7yl7rnQLcPnV5A857DYpHvJY5ml2Amh8SKeICN+vDRS9Hb3F
         sPGsBN/xPKtSCJQGkRjqquWwPQcCKu321EST5URqfGDq2OkMy8e7T4dSksNLZ1uzdy4T
         WmvxPVcEs8nNZKArfnCUjAwkWFmQPWvxu8jetWsHVcPeNdcRvhyPh7oRXljhwzzNsREk
         EFwXUe3ma5NtPHn7GkyP4WSpPMTWv4Qv3SjiQpj/lmvt6wlIXXDYn7dwbiqd2lhxHZFD
         wd2isBmhAc9UevB+67vRhGViZJ9DFQtQMkeOrK5VqyEdfAn0IffkgXYggb7qG5AUlp6K
         GBiA==
X-Gm-Message-State: AC+VfDx1fpPUUuwYzTCu+PSxYHKAZBpdsRQ7O1gfxBZPYNVEv4MdNe6b
	CxeqKJYiHDB9LvuGB0UGviNEUCzItnPm/iju+fc=
X-Google-Smtp-Source: ACHHUZ5Z3klxal5JMA02mBykhOFFwNsQrQy2JFvtdeZznSUsD9Od0nqHm/iWjT34/UX1FX0fipTytXJQ4AaxFOylDT4=
X-Received: by 2002:a05:6871:582:b0:192:7cb3:5822 with SMTP id
 u2-20020a056871058200b001927cb35822mr14494777oan.38.1684119849460; Sun, 14
 May 2023 20:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bug-217440-225600@https.bugzilla.kernel.org/> <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me> <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de> <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <626d677d-ead7-7ec8-b91a-162c914fe1d5@gmail.com>
In-Reply-To: <626d677d-ead7-7ec8-b91a-162c914fe1d5@gmail.com>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Sun, 14 May 2023 23:03:53 -0400
Message-ID: <CABpewhGziT7JOvRXdFDJkVwrszga8kNTG8=1G-4v0o27iONFag@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, regressions@lists.linux.dev, kailang@realtek.com, 
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 14, 2023 at 10:23=E2=80=AFPM Bagas Sanjaya wrote:
> Thanks for the fixup. Can you send it as proper patch for review?

I only included that diff to make sure what I tried was unambiguous. I
don't think it'd be a good idea to merge exactly that, since it will
probably re-break the problem that the original commit was fixing in
the first place.

Regards,

Joseph C. Sible
