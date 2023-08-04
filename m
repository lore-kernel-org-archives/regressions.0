Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9F3BA58
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 14:35:06 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1bb571ea965so1546697fac.0
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691159706; x=1691764506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr9Z/PzI9HVfpGi0e0FdNup5FU2IUBX9onswlfSPsGE=;
        b=LcPVQZ5wE7siq5FW59qb8nWpO4V01CM+9kF86z0Fy+12gp1eQiDGBDAV8kWpbYWpw9
         GoQO4B3wxgCFGfjlX7orV/syY1p+ELJHKbNc9tv8dv+e/sUaHZ5j24U4s42L71mLx+u9
         K0E7pLtUlI2jSu6CDqA9IHQ4NzLhxgh+Rm5N2pdFO8zpWOBH1s8X/VIGq8yGMn/OmKuE
         62+aop1XSDOpDAkArDCDuvT7zs1BUM/ff48djWJRyViwfsjGSA5HwoyEn23YYi7isc11
         kTRjG1G+u9ON6hwaX61oRdvs1WSI4IVwfq3ulQQYLI0mY2wH8SyoBaFR6YjJwXtLUI8z
         sE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691159706; x=1691764506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr9Z/PzI9HVfpGi0e0FdNup5FU2IUBX9onswlfSPsGE=;
        b=hWEFOmEcVcOnUHhn3zuwyj+8WrfZETripdsu0Z58h6DRlH/H9JnUi7aBjkYytgaQtH
         zz9xTiW1yC1uS7GCMwWYxsaabgzZwmnGHdG41foe4dN6lmWF/ljEIqGo3xc1RIhJDNZl
         4f8sM5fN00fRc88rDlDPkx3FniBYcrebID0xLRaBcRcoitWpsp8BGj81iY8uAsus7lZy
         gN5tBsA7V6kQ2SYmQ+zZAIBrtEIjmyTrQHYRAP6E8vuvYmFMWAMLgTRIiYXrCDWUrZic
         6vV2VnBfDESbCBd3M27jA1w+wfsX3CgdM0fQNCxs51qC9WfmkaJYJigs6DcCOgwRPGaL
         7DjA==
X-Gm-Message-State: AOJu0YyB3k8P9uIvdCHXoRkN+AK2tWMZ5bZbpx6cQLLRYk917JqitMyB
	pM7s9rdDCRxnMWvgzYod5mXLyT/ULMb9y4dIgLg=
X-Google-Smtp-Source: AGHT+IGV/8VJRNkNUBR9cFO9XXj7z8mINitdGs2OMD7YER7W6k+Fk1Q6l7uil2aiz+tXMY4mhSjqisJkCHKVv1y1DgE=
X-Received: by 2002:a05:6870:5607:b0:1bb:b13c:7f9c with SMTP id
 m7-20020a056870560700b001bbb13c7f9cmr2034071oao.57.1691159705998; Fri, 04 Aug
 2023 07:35:05 -0700 (PDT)
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
 <CABpewhGkw2rg_NN7Rd8E_p+AN9MC0A1CjgnrhBvMnSKq0gz31w@mail.gmail.com>
 <1f83caa215ad4374aec8859c70044b00@realtek.com> <878rbjdofa.wl-tiwai@suse.de> <87o7jshxch.wl-tiwai@suse.de>
In-Reply-To: <87o7jshxch.wl-tiwai@suse.de>
From: "Joseph C. Sible" <josephcsible@gmail.com>
Date: Fri, 4 Aug 2023 10:34:49 -0400
Message-ID: <CABpewhEG9ViuoCwZHmTN0Up-3jwZ1M-jfC+dAqo0zhqLOZtQ6g@mail.gmail.com>
Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
To: Takashi Iwai <tiwai@suse.de>
Cc: Kailang <kailang@realtek.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "perex@perex.cz" <perex@perex.cz>, 
	"tiwai@suse.com" <tiwai@suse.com>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 12:14=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> ... and now we receive a regression report due to this change :-<
>   https://bugzilla.kernel.org/show_bug.cgi?id=3D217732
>
> I believe the problem is that the patch disabled the 3kpull-low
> behavior too much while some codecs still need it.
>
> The patch changes like:
>
> @@ -3638,8 +3640,7 @@ static void alc256_shutup(struct hda_codec *codec)
>         /* If disable 3k pulldown control for alc257, the Mic detection w=
ill not work correctly
>          * when booting with headset plugged. So skip setting it for the =
codec alc257
>          */
> -       if (codec->core.vendor_id !=3D 0x10ec0236 &&
> -           codec->core.vendor_id !=3D 0x10ec0257)
> +       if (spec->en_3kpull_low)
>                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
>
>         if (!spec->no_shutup_pins)
>
> ... while the only place setting spec->en_3kpull_low is:
>
> @@ -10682,6 +10683,8 @@ static int patch_alc269(struct hda_codec *codec)
>                 spec->shutup =3D alc256_shutup;
>                 spec->init_hook =3D alc256_init;
>                 spec->gen.mixer_nid =3D 0; /* ALC256 does not have any lo=
opback mixer path */
> +               if (codec->bus->pci->vendor =3D=3D PCI_VENDOR_ID_AMD)
> +                       spec->en_3kpull_low =3D true;
>                 break;
>         case 0x10ec0257:
>                 spec->codec_variant =3D ALC269_TYPE_ALC257;
>
> Since spec->3n_3kpull_low is false as default, it means that, except
> for ALC230/236/256 and PCI vendor AMD, the flag is never set, hence
> it's no longer called.
>
> Shouldn't spec->en_3kpull_low be enabled rather as default?  Or which
> models can set it?

In both my original bug and this new bug, the problem was that we're
not calling it when we should be. Given that, wouldn't a simple fix be
to call it if either the old condition or the new condition is true?
E.g., something like this:

if ((codec->core.vendor_id !=3D 0x10ec0236 && codec->core.vendor_id !=3D
0x10ec0257) || spec->en_3kpull_low)

Joseph C. Sible
