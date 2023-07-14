Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FEB36D
	for <regressions@lists.linux.dev>; Fri, 14 Jul 2023 01:11:18 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5658573b1faso956376eaf.1
        for <regressions@lists.linux.dev>; Thu, 13 Jul 2023 18:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689297078; x=1691889078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVZF0lyzCXqHpUsnSyYlva0CCdL7KSzBN7isdIit9dE=;
        b=JT+9h/Vphc82wfdrbnF8/7FTOGAFa9AGaOXCM8HDgCj/YDmbujF4w6IdTLj1EhVal3
         2J4fr57FZ/thIVxQRKAShbwC1vym5rcorHTIAKV18027IKUBEyIs/eU0EQ1drxMwRV/v
         YYpVcp1cqmStSvgbMs0CyNwEEjPRoLoq3+NAMPPoKoi88eNJ4uHQPUitwFHFUPr2zR9T
         Suto8IJrpL3lR57o7dXOGauWQsmyUvK93d7+2TFPvbnyBAZuc7OhZ5zHpZmOFlixlaLo
         DSXJqspIh5DCVv0GwYuN6ZsmMdAJelXC+3aRfp/LguqY+8T+Q5BM3dkrjWVgYGrcMLWO
         UTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689297078; x=1691889078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVZF0lyzCXqHpUsnSyYlva0CCdL7KSzBN7isdIit9dE=;
        b=ag8epXTE/3zJ6dC1Lhuged+2NQpKKesI/XQUn5Q/IB9blJqPzxA7E5gak9po6QcvC3
         Dl3YdfJYClcPf+3Rc9Xk+ARmrmzh/Tk+34y53jXqCbrhSBOhbZdyG13htRb8W+X7oWoa
         Uf1qnx0atszZRdoJ79l/gCxuLKtGKf0QY+Iz9elbnLEGxLxbw5JZWTG6kMHzV+seafT6
         tWVVR6aBb2HpCQjImnUCeTQaj+gqM0XGTG2OM/X43oXKFRP2rTzEbdheOwrwyn5OJexV
         pj5UoAfcf7Mcnm+GZQ/7wJKVZKtshTUGxXO8d4tsebFMLztdZmXTg2AUTzI0deDSmIdv
         jojw==
X-Gm-Message-State: ABy/qLZLQjzOi3xVduIbGJmWG5Uhn0upO6KQOMQBqnBVJRFqcUtCYVFd
	SgSWdqeKoTowi6B8ZJNY8da2JvfLAuTdfS5CMXY=
X-Google-Smtp-Source: APBJJlHCeMPvax2/IM2CPaptdMCJKdeNhQXTNEzeRrQkOyaLpYqEqfq/zelFt/qAGlHFghK/RIAxLFS2p1gAG9NdYig=
X-Received: by 2002:a4a:3450:0:b0:566:f5bb:7d40 with SMTP id
 n16-20020a4a3450000000b00566f5bb7d40mr2919868oof.6.1689297077806; Thu, 13 Jul
 2023 18:11:17 -0700 (PDT)
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
 <485f99149508488080d563144454040e@realtek.com> <CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
 <2831c55638a5431ca9e37d9caf365ed2@realtek.com> <CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
 <3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com> <CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
 <009474f04d0b45c69a0e42e8622b7a86@realtek.com> <87h6rhcef2.wl-tiwai@suse.de>
 <0990300d759846d890de9c92fcad9a9d@realtek.com> <CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
 <878rctcavz.wl-tiwai@suse.de> <874jnhc9u4.wl-tiwai@suse.de>
 <CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
 <875y7vbxpg.wl-tiwai@suse.de> <CABpewhHDnvn4v+uCpsaLHB+biw-f59tdTiCyFkicHnewXHYDNg@mail.gmail.com>
 <87wn0aa1s4.wl-tiwai@suse.de> <CABpewhFg=7+JR6v=zhi0_Hm9+S64DLOHKeG2pS-W7z-vNpu_5Q@mail.gmail.com>
 <87leg7x4h7.wl-tiwai@suse.de> <f4969213b5a14cc5a11befb4df861481@realtek.com>
 <87cz182hfk.wl-tiwai@suse.de> <4678992299664babac4403d9978e7ba7@realtek.com>
In-Reply-To: <4678992299664babac4403d9978e7ba7@realtek.com>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Thu, 13 Jul 2023 21:11:00 -0400
Message-ID: <CABpewhGkw2rg_NN7Rd8E_p+AN9MC0A1CjgnrhBvMnSKq0gz31w@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "perex@perex.cz" <perex@perex.cz>, 
	"tiwai@suse.com" <tiwai@suse.com>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 4:25=E2=80=AFAM Kailang <kailang@realtek.com> wrote=
:
>
> Hi Joseph,
>
> Could you test attach patch?
>
> BR,
> Kailang

I applied that patch on top of kernel 6.4.3 and tested it, and yes, it
does fix the problem.

Thanks,

Joseph C. Sible
