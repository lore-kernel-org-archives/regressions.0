Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A74D219E8
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 20:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MckHfkY/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-548f0b7ab11so290716a12.1
        for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 12:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700685374; x=1701290174; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MTFW+4h4lZJz6rbXAaizRdJw1t8O20ELX/WfD27HXjM=;
        b=MckHfkY/Q3IYtoxUOb0z/CVmQXOXFal9q9IF9d2vT9vxLmzo+s6/k9guklAXqZkDsk
         C0vafkK/r1k26SROmuhXX3xWrM2ke2vlUdKB/hyBbjw8/lU+ZGtaVC8sSt1swDnVdcE3
         AqqxqIHR2fs7DzrdqK+m6+uWQUKz4JzGn2leQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700685374; x=1701290174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTFW+4h4lZJz6rbXAaizRdJw1t8O20ELX/WfD27HXjM=;
        b=sFgHZCs5haH4EKDJOzfHxR9j0bil4S5y9/2SvYQjFZpJ69Ec3FLkJsAUCCeA604Uvg
         2o/64xvqjTvU71sxHsHRtFB0L83u99BXP+qmzpElQvksCyjaNIQPLgAy7VRZ+UHQ0ucq
         YnI65bjaOiGnU6N3tLwTFuau/h2kx+YRMTmCeMpheMW0D5Uv56rP+6gpuhrO9rh90peG
         R8NANKTgAacxGGd5i+VtsE0UskvHScH91VIPdfzHX2ciV9pN5ow3fe6nAU9qESozwRyk
         90J69dn0pviVTu8lsXmouHu/LgMvI937c4g7is8AOl39sQTaxXBI1aAY410+Bgzmw5On
         K1xg==
X-Gm-Message-State: AOJu0YziXskXE2gPRUHaqOrf2lpFFKRx4Bunswavu5VpoxQzdIuN5Yfb
	QTiGQ2w6UxWiKjXLGtPJ6iSv4bRfGKqA6woaEBAxZtMF
X-Google-Smtp-Source: AGHT+IGZtRA9k8gm+YCDU/UbAKrdORwG3d8qGBeYdbKNWoMbJGcoiZeb43S/tqM3gMaAAN89gSK9rg==
X-Received: by 2002:a17:906:5352:b0:a04:9f07:cba with SMTP id j18-20020a170906535200b00a049f070cbamr1189655ejo.16.1700685374140;
        Wed, 22 Nov 2023 12:36:14 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id hz12-20020a1709072cec00b009a9fbeb15f2sm190099ejc.62.2023.11.22.12.36.12
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 12:36:13 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5409bc907edso311460a12.0
        for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 12:36:12 -0800 (PST)
X-Received: by 2002:a05:6402:34c5:b0:548:615c:33aa with SMTP id
 w5-20020a05640234c500b00548615c33aamr2977402edc.20.1700685372660; Wed, 22 Nov
 2023 12:36:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230825141226.13566-1-lukas.bulwahn@gmail.com>
 <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info> <20231112181036.GBZVEVHIIj/Oos1cx4@fat_crate.local>
 <0e9cbe6f-ac6c-47f2-b663-a22568799eca@leemhuis.info> <20231122115826.GAZV3s4krKXI002KQ0@fat_crate.local>
 <e1ca042c-de1d-4fe3-ad69-51d147b1fe0b@leemhuis.info> <20231122155758.GEZV4lBgtZyzsP5Z4V@fat_crate.local>
In-Reply-To: <20231122155758.GEZV4lBgtZyzsP5Z4V@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Nov 2023 12:35:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiV+NM+jLKbSj_Ej9RaXpu4akWV03G_wXyTSHZhArq1tg@mail.gmail.com>
Message-ID: <CAHk-=wiV+NM+jLKbSj_Ej9RaXpu4akWV03G_wXyTSHZhArq1tg@mail.gmail.com>
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to CONFIG_MICROCODE_AMD)
To: Borislav Petkov <bp@alien8.de>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, lukas.bulwahn@gmail.com, 
	dave.hansen@linux.intel.com, hpa@zytor.com, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, tglx@linutronix.de, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 07:58, Borislav Petkov <bp@alien8.de> wrote:
>
> IMO, yes, we should not break userspace but dracut is special. And it
> parses willy nilly kernel internals which are not ABI to begin with.

I don't think the "dracut is special" is the thing that matters.

The real issue is that hey, if dracut in its incompetence doesn't
include the microcode on the initrd, that doesn't really matter much.
It's fairly easily fixable, and at worst it will mean that we end up
having CPU mitigations that aren't optimal. Since most of those are BS
anyway, it really doesn't seem critical.

Sure, it's a "regression" in that you don't get the microcode update
included, but from a user perspective things should still continue to
work.

End result: this seems to be pretty solidly a distro issue.

IOW, the whole "users are the only thing that matters" pretty much
means that it's a non-issue. Things continued to work, to the point
that I'm actually surprised anybody even noticed.

That said, I don't think some ELF note is the fix either. I think we
might as well leave it at CONFIG_MICROCODE. Maybe add a note in the
kernel Kconfig that this thing matters for dracut.

Dracut also checks for CONFIG_ACPI_INITRD_TABLE_OVERRIDE. It's a
similar "normal users don't care".

              Linus
