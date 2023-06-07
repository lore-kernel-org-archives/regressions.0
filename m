Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F62154B2
	for <regressions@lists.linux.dev>; Wed,  7 Jun 2023 18:37:05 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-546ee6030e5so3628291eaf.3
        for <regressions@lists.linux.dev>; Wed, 07 Jun 2023 11:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686163024; x=1688755024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjlYPxtK8nY5Y/ZlNYXABoYcMhb7X/VqwKUIU2I9L9k=;
        b=LMszLYysHgE9ur3Xj6tS8FBzY7iDgVA19wbU1X5TkG/XI8twI24J3Et1qiPp4WeQE/
         frqottJORLpVSMjiUVNp0msZNe8LPGKiM65MDAiZ+KKg86cz2eAjy7/ypoVUW92zg/Qz
         YM4mKFZCxmwRl1w/VYOXd6ChH+aZ4gVsahFqHZrwiAgKngqA5dV45H0f71Jow1r2YgvQ
         xcwpSGOcu0ipVJf31aowf4YBvKepRnPUnsc8vnFs4hxdSzrGrrRG4+dPiPbLqsgmE0Ll
         F+JuDLdW5fbsk0S/aVc7cW08A/BqJ0EdC2rNxYEs5om3wicVh8o7EPxoS+yg5YzFbuiU
         mzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686163024; x=1688755024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjlYPxtK8nY5Y/ZlNYXABoYcMhb7X/VqwKUIU2I9L9k=;
        b=TgEtcEDIlYMvzsW1zB/AbkE1jfAJKltnrKcz+uoTPMh2plbo5cHsx2toi9bM73LMhd
         24P+zNX/mpvKQCFDlZyMbRwSChltG1cdkhgqeyJEXO9HoSEOQiAW0DETt4o+Uq3w2y/f
         cjnnsVSG4VszrFOLy6csHnvlOeoUWx6gP5pZjPC8RDMip/8/TzLOQsYUizg+UQOVMk4g
         y8EnMSalEosO8mpWsK7f/yyrFtKDFxulX7dcCIV7rLwOK1V2NfAvu/g8K9+W022IAF0A
         DWqGLe1TKDacM0k1vL5bdumcujSGRpKlinPnVp5d/mSttv+bCLU0Nu8ZLS1Gdw2fqPPm
         feDA==
X-Gm-Message-State: AC+VfDwjI6LwW0zYB6nNzVkxbuYUlDbsUzDiCaqA+lSuimnbIsuND454
	ZMUHS7xHicPF2YGcClbY+soZ8+stw2upMfnucsR9wsY0pr8=
X-Google-Smtp-Source: ACHHUZ5VCXqI2QSijHGbjgoV3BzHSENo26E+Xex5CIQq89WWILlCnN9UOc3DA5HaQGh4kUUT59zQxRzHt2WlgFY5dNU=
X-Received: by 2002:a4a:d105:0:b0:558:aeb3:8c1f with SMTP id
 k5-20020a4ad105000000b00558aeb38c1fmr2730716oor.9.1686163024654; Wed, 07 Jun
 2023 11:37:04 -0700 (PDT)
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
 <CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
 <873536js7q.wl-tiwai@suse.de> <CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
 <2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com> <CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
 <485f99149508488080d563144454040e@realtek.com>
In-Reply-To: <485f99149508488080d563144454040e@realtek.com>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Wed, 7 Jun 2023 14:36:47 -0400
Message-ID: <CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "perex@perex.cz" <perex@perex.cz>, 
	"tiwai@suse.com" <tiwai@suse.com>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 7, 2023 at 3:06=E2=80=AFAM Kailang <kailang@realtek.com> wrote:
>
> Hi Joseph,
>
> Please try attach patch.
> Please patch follow number sequence.
>

Unfortunately, the problem still occurs when I use a kernel with both
of those patches.

Regards,

Joseph C. Sible
