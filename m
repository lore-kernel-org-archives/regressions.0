Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4026A2114
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 06:02:24 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-558cf19575dso1357804eaf.3
        for <regressions@lists.linux.dev>; Mon, 05 Jun 2023 23:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686031343; x=1688623343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mY7o7sRc/5bU+UcOF0Y5YHgkqhcEBGECrMGl3p6mpQI=;
        b=a5l5R4dDWqWJQe47YFphsnmQsaMtmxywO87ZmJT2h5NVDTVYo7i/A6HG9LkPkpWGlY
         0zap7ky9F9OWWuaExjC0oXCt13rLR8K+y6G3R8NJjCIjkNNHwGMNzd6l8wMEDqB44heN
         itNDLEnSbBRHcoUPUolPef3tjCxsfX7cmH4tdJ4ZsEIsqVtnScQLmQisH6MfgQjLxWmp
         ybLgJWv46xo1DkXldgLGHtoi+8qxqxUtEO4QFc4tMO+r0tmfDM0PkO71Q0JDhLUJojvW
         uz1DKsXiLkKmZC51/XGNx/jUUCbA1dHgXqbpFmfzf4Ju08w2cptSrBpk/qq6+5zQmzbY
         zCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686031343; x=1688623343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY7o7sRc/5bU+UcOF0Y5YHgkqhcEBGECrMGl3p6mpQI=;
        b=UiGQXAwjDq0lOKzKH8OcEXKT+EROtHVP4eyYVfP1ywRgg6CceZP9j0JG3oETaY/zSI
         ZhedmRrEVuo6dLlq6fjH3/txq/VjLeIHrNPcoEe8+qSSQwBwzwm0f7uP6fWEiahHWyNc
         v6fYNM70X2zOGAPc8NWcBeT3VmOvjshcGNwsIEbuKN3fAXYFj/oFanQTbfyTTDbvK8TK
         AEB7gbqVO6KSdDVhPkxc43l4NC8Lr9R/5HPtdbcsfLIzrIgWml4eagLchOaRpWK9gtrh
         YKBDNgfJr6nSs/eGaZ02TsX0nfY0LCz39aQHDolqAQKsm8Ma/Z9WfGZuJUWmA6soYBO3
         xavQ==
X-Gm-Message-State: AC+VfDx/MEQ45Y7DMrtP/U/TOob1UK1x1YRTJNIer/p9bCSXxvlABxRp
	f3gKBko055egkWVTtuDvsAcNrpMOxsej++DMoOA=
X-Google-Smtp-Source: ACHHUZ7hjiFq0lxhztahl8Ybz+ZoLb3X9zoqOeZaFy1I2QkvYKCBu73Yl47ket3DowZwnDmfxhaZ8nJlGfzhirAOKDg=
X-Received: by 2002:a4a:ea8f:0:b0:558:a3f0:d16 with SMTP id
 r15-20020a4aea8f000000b00558a3f00d16mr869901ooh.9.1686031343118; Mon, 05 Jun
 2023 23:02:23 -0700 (PDT)
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
 <CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com> <873536js7q.wl-tiwai@suse.de>
In-Reply-To: <873536js7q.wl-tiwai@suse.de>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Tue, 6 Jun 2023 02:02:07 -0400
Message-ID: <CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Takashi Iwai <tiwai@suse.de>
Cc: Kailang <kailang@realtek.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "perex@perex.cz" <perex@perex.cz>, 
	"tiwai@suse.com" <tiwai@suse.com>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 5, 2023 at 3:14=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> Kailang or Joseph, any of you can submit a fix patch?
> Or shall I cook the one, as it's a trivial change?

I don't know enough about these driver internals to be able to come up
with a new patch. Unless Kailang submits one, I guess the trivial
revert one would be the way to go.

Thanks,

Joseph C. Sible
