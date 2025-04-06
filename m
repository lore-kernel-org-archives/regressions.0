Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E81D52B
	for <regressions@lists.linux.dev>; Sun,  6 Apr 2025 06:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743922103; cv=none; b=jUZt0I8gZDrO7simN2/vYT7QRrivrzWKW+ufcxv6yxUQBpKD96xokqfHruHVj5PIA3wixrMKPxtfNG5Sq4XdIXd6za9SUNGp67rN2NL4GoYVynGV+W/z0b3QCnEi8FRJgQtyIgRCJorLOuFPT2OCVhoc/SR7PhAI2trBX9bo25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743922103; c=relaxed/simple;
	bh=iMICzxd1P+u/Qa3sQqcyBvzc2aEVnrNNe86fC9LmAfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fqNNTBlg6aYwScUfoOvCLF/FVOza91/VisZGSIcAjRK0ZVOBgzXKxsHCihpzSP9+YVAjvwefD8dsueErFAgranXfpgKqTxQl32rKwoncnlGNV9Zun7YIjsfXiQgVaNVRQBDi71XCBRmVbMNsjeznL4/IYDZoasJnvpysung6UZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3ZXvsXy; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3ZXvsXy"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bef9b04adso32018671fa.1
        for <regressions@lists.linux.dev>; Sat, 05 Apr 2025 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743922100; x=1744526900; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXpap6S8Raqb0GYzHr0IbbUTR7Z6Tf2dWaU3zAsj7bU=;
        b=B3ZXvsXyIzmDhHE0+sX2Se8pH3UpJy6NTROtHJvX8GD8D2pUnyKTstKyu6eMi/aqqL
         D0umC8ZA3z3ljXk8LwJ+eD4E1NzTN5vTZpgvs7oJU+1f6Qz6OINFArHsxQgeYuP7O59S
         Mi8tpAFg9Zy/cY96s4LUOmMQxjQwoTGvzqA+gLNiET8lmvrgkJCz8FT+W7h6IsLEaUG1
         dTi7rweogVLePQrYqFNwTMDJa71qJ50IIV4rZHGVKvnx1ER6FaXddBPZCKkN1ZbhRmVb
         yApIgQKudyFoYSy1YTBC5t1TVweahxrH6/dAK2+Kc5fsLknOl3JKOH1JT025UZLfjMDl
         UXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743922100; x=1744526900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXpap6S8Raqb0GYzHr0IbbUTR7Z6Tf2dWaU3zAsj7bU=;
        b=qGR840jjs7D7NpmTC2Jea76CShu4Zu7K7fegf+gNu7kTelXJ0XXS+HewegmT3qgArB
         v4I/eTAWk+N9ZYUeS6cYqYR1O499/Lzo83zl+y+EsK4buKqIvr3zPWI5r5zJBPxBdian
         d3OiAE8r/tUpomWamGq+lefHsRpa/CN2rgk/UGdASOdaYil5KEpbR3D2Woyc9ZNmOTsV
         MnqrGnqz18UWSftw2wsJ2/AiDaP8Z5no1b0RT+JnPuATWB9LJHfOd2bbLjgib+GLFtbg
         czDROEHo6g/bB+sZOYmfa6rweoLSTx1wqTSSV5TPNdLlCPeL8QKy8P+3+JQLOv02h6xo
         fUmg==
X-Forwarded-Encrypted: i=1; AJvYcCUpDXpDgI4fKKIDHMQMc1nj1nA33seNb1AiW/ioeed69Yr79Fngk+HjLLvWrF+WpvOjqfdnuzDlZIYQKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzouDLYX70I2/6ed0seB7R/mdG8zFHNFVkP17AOrTCipS6bHw+3
	Az/FfkcYmbygJ2waYNW/EPvUCb4onrz4YDvlZMYM0Z68S2HfIwFlhMFoVgP10F+RHa1vVdWp2Hz
	BAI1LEYqZhgLI1ho61WGMB490WBU=
X-Gm-Gg: ASbGnct0YfyOCoQDDyen3VUus3FbzJh0p3FQYuQkB6LdlY2DwGm2FpvQXuWYgSpPDL1
	7QvKURAT2rzoadxALvPB50nMlkmBAukLuSa11bQgMxZy+TUPB0lBsZEw0U4kD+UfHMCwHFWY0SI
	dBvS91pGlhaTmO+ma8WOYEIbMbyg==
X-Google-Smtp-Source: AGHT+IG2H5kDiohEMrhbIMXg1UKx4Gf8cH4chSFOscSIaxQHoT9S63sBdbP9rveCyv2oWERHb26dkss79rxZUXR3YIU=
X-Received: by 2002:a05:651c:512:b0:30b:b987:b676 with SMTP id
 38308e7fff4ca-30f164f4930mr11935971fa.2.1743922099666; Sat, 05 Apr 2025
 23:48:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <eb3c109f-550f-44ce-b0a1-3837aef1d02a@molgen.mpg.de>
In-Reply-To: <eb3c109f-550f-44ce-b0a1-3837aef1d02a@molgen.mpg.de>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Apr 2025 08:48:13 +0200
X-Gm-Features: ATxdqUEgRjJ6D9lPcJ6mWXr-FVdh3CJsvWb7c_Jwui8lE-MuxINFdg6hqlUWaXs
Message-ID: <CAFULd4ZkkMjPh++2N-TVOabVcs_HhKb-4Qrgs16vnW2LrhpQzw@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFdBUk5JTkc6IG1vZHBvc3Q6IEVYUE9SVCBzeW1ib2wgIuKApiIgW3ZtbGludXhdIA==?=
	=?UTF-8?B?dmVyc2lvbiBnZW5lcmF0aW9uIGZhaWxlZCwgc3ltYm9sIHdpbGwgbm90IGJlIHZlcnNpb25lZC4vIg==?=
	=?UTF-8?B?4oCmIiBb4oCmXSBoYXMgbm8gQ1JDIQ==?=
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, regressions@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 11:00=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> #regzbot introduced: 6a367577153acd9b432a5340fb10891eeb7e10f1
>
>
> Dear Linux folks,
>
>
> If I didn=E2=80=99t screw up `git bisect`, then commit 6a367577153a (perc=
pu/x86:
> enable strict percpu checks via named AS qualifiers) [1] causes the
> build warnings below:
>
>      $ make olddefconfig && make -j128
>      [=E2=80=A6]
>      WARNING: modpost: EXPORT symbol "xen_vcpu_id" [vmlinux] version
> generation failed, symbol will not be versioned.
>      Is "xen_vcpu_id" prototyped in <asm/asm-prototypes.h>?
>      WARNING: modpost: EXPORT symbol "irq_stat" [vmlinux] version
> generation failed, symbol will not be versioned.
>      Is "irq_stat" prototyped in <asm/asm-prototypes.h>?
>      [=E2=80=A6]
>      WARNING: modpost: EXPORT symbol "__irq_regs" [vmlinux] version
> generation failed, symbol will not be versioned.
>      Is "__irq_regs" prototyped in <asm/asm-prototypes.h>?
>      WARNING: modpost: EXPORT symbol "radix_tree_preloads" [vmlinux]
> version generation failed, symbol will not be versioned.
>      Is "radix_tree_preloads" prototyped in <asm/asm-prototypes.h>?
>      WARNING: modpost: "pcpu_hot"
> [arch/x86/events/intel/intel-uncore.ko] has no CRC!
>      WARNING: modpost: "numa_node"
> [arch/x86/events/intel/intel-uncore.ko] has no CRC!
>      [=E2=80=A6]

The patch at  [1] also fixes this issue. Actually, this warning is the
root cause of your previous report [2] and is due to genksyms not
being prepared for new keywords.

So, either genksyms should be enhanced or a workaround [1] should be used..

[1] https://lore.kernel.org/lkml/20250404102535.705090-1-ubizjak@gmail.com/
[2] https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c035@molge=
n.mpg.de/

Uros.
