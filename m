Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD92182
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 01:08:45 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso3555a12.1
        for <regressions@lists.linux.dev>; Tue, 03 Oct 2023 18:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696381724; x=1696986524; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vxM4zNVFuUMx5H9x8OKQLI8DNjHa1TcGf47a6wRUPc=;
        b=PfF1pEdbitlDZ8dRGtRB2dROT9lZITmrrfuX8o1zxEDYejWhxOsJKplskvdEq6hqkE
         YIvFLPDu4uHoqxvB8bWeBU9vA2nZxYufnv5cCEkhlE7gCJ38yfBkdYerTfYegxDaLd5Y
         twcGqbpxudKLRjjse2XGX1IXuWzQgg5F6ECORue7tk1+W2qfQPJMtnCJVN1J1pggICh7
         2jNkKFxj36/vSWXHGpafQFP3YAHZ9usuPoqrB5UC/LGrj6V4DSHr1CLlK/Iop3R/TU3c
         xaY8trcruMFatDPwqPMs6Zzw5rJfRTrihO+PBheMFfesyHf+1Lt3NIeL4CLNzj5U2uNS
         u4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696381724; x=1696986524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vxM4zNVFuUMx5H9x8OKQLI8DNjHa1TcGf47a6wRUPc=;
        b=j0TKHbDyaoG48Nbzr9rChdUuyL+1YZk1R+bHjVtAhhISBhNCjTynzAhhcaeW7dDUCw
         oyKMTGpg3giNXzQlngmj0XjwYRkTxaP7Rsiwj1M2mSYTnakwgVSw44kdqSsSFirnKMAL
         hQ3AqMHQM/C8dkxS/t8XKzDGrxqu93aeOGIqKWnVocvMJXH83wwNVI8iwgF/D9TpDSWG
         /tgDHe/GlQWVHAzinxlChCfFE3IShcxhd7220QnK+tN/bzRNnvZ5fiLNucwK9xpbwR1y
         Dgds/nVev7K27iHAmGxBiVKXueAJFAiB427EOzskB9MVmaKFAJ+fYu0e2oyM7UDpIKOr
         3uRA==
X-Gm-Message-State: AOJu0YxYQi9PLXgc8y8caqYuDJ5vypOooR92WLNJKIy7xEcHUCd5EPF5
	ArNlXU2ogLb5iT6Lpw3SkUF38VrtFSKpKABqkwAhVg==
X-Google-Smtp-Source: AGHT+IHDHKR3s5a3A/HxReBTzQR4+rqVuNCkERmQJmVfXcOBVLD3NZxto2J5t2WUWe44svD4BC43pI66NQw+/k+o6qI=
X-Received: by 2002:a50:d083:0:b0:522:4741:d992 with SMTP id
 v3-20020a50d083000000b005224741d992mr64635edd.4.1696381724108; Tue, 03 Oct
 2023 18:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info>
 <CAAzPG9NkoaUz_JRtZt_JomsYj-8ZPn4QH0w0eeR-oxd55-18Qg@mail.gmail.com>
 <CAAzPG9NWp8yPU52o7d2-jLjxjLodFOiE_AjoxmCAZ=MXtV__Aw@mail.gmail.com>
 <cf87d6a5-7ff3-4add-8c48-fd3447b32697@leemhuis.info> <1b3f8dd2-6364-4f00-a33e-8b15b8911dbf@leemhuis.info>
 <CAAzPG9MD+UQb_RdiMkPkpQGYe-arD1nMKWngMj4P5s3_zJvphQ@mail.gmail.com> <906cfb11-ee93-4251-a6ff-1c4d9656b577@leemhuis.info>
In-Reply-To: <906cfb11-ee93-4251-a6ff-1c4d9656b577@leemhuis.info>
From: Jeffery Miller <jefferymiller@google.com>
Date: Tue, 3 Oct 2023 20:08:32 -0500
Message-ID: <CAAzPG9PrOzOawLBRNenO0Xx1bArg020Qf0iPh1bNJbwUK1c-6A@mail.gmail.com>
Subject: Re: [regression] Resume broken on T14s Gen1 (AMD) due to "Input:
 psmouse - add delay when deactivating for SMBus mode"
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Andrew Duggan <aduggan@synaptics.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 3, 2023 at 2:30=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
>
> This didn't print anything on resume, so `psmouse->private` apparently
> is set.
>

Thank you for reporting this and providing the information!

need_deactivate is never being set on the smbdev struct since it's elantouc=
h.
On this machine SMBus is not used so it falls back to PS/2 mode.
When this occurs the psmouse->private pointer is being replaced but
psmouse_smbus_reconnect is still being called on resume expecting smbdev.
That explains why when it is setup needs_deactivate is false, but on resume=
 it
has somehow changed to true.

I've submitted a fix for this at
https://lore.kernel.org/all/20231004005729.3943515-1-jefferymiller@google.c=
om/
and it should resolve this issue for you.

Thanks,
Jeff
