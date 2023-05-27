Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39127E
	for <regressions@lists.linux.dev>; Sat, 27 May 2023 19:40:49 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51494659d49so568828a12.3
        for <regressions@lists.linux.dev>; Sat, 27 May 2023 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1685216447; x=1687808447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JcPeHx5b/Toh4k4OiN1qju08d1gnox4XXe9rs4ZJHI=;
        b=HS85D+fa8En0kAfgbIdtZbnJWVN+pLW/RsaR6iiYL9zYMAISN/x7diI/1QKaMpt5b4
         AiwiYg9Ra9YLQH46Y0SB2a585HHUjboNwyuKVqrR3JJcuptVR5UcOwuLteekmYRgeBF0
         iZiKr9tbTVoblVg3Jaaqb82n83cFmiu0oxvz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685216447; x=1687808447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JcPeHx5b/Toh4k4OiN1qju08d1gnox4XXe9rs4ZJHI=;
        b=E21TDx9lj44Ei4H8Vh59EKHa0aQlRSpWQKl4+qy0OZU6WcB9JG4mtLwprkh3NbIht8
         woiOKyANJ1uPEogmtIy/qrP00Naj/PD76B606iEPsyNMegpuU4Q4ZLOcm5zAqRojakGS
         OBhl5tu3mk42Cgd/XfU0/8y0FJFchiERpHBqZdkP+xSifv4B68tnePTedpOJBm6WFHRz
         iWmB7bzRoa6sOWjtA6UpG+Fl0qqx7McrewkTiyOTtkLgDKlSjv8qQpiT3/AcjZZxObxE
         hys4Gwxpe8iuJjcpvW7iusw+1fli6N7lReHmibDLbKNqu4jSNykL00+FqfD3ptTjGxzD
         PKVg==
X-Gm-Message-State: AC+VfDzSfOX7vUsIeYnHi4vYiqxPq8dqByRikIwFCf/UTW9JaPiQ3MPm
	wG66NrQuNLnEy97OVubJYrHARb8O0tYjVLDkjt7H3OS3
X-Google-Smtp-Source: ACHHUZ528LNw9zDAPOXUBegPZ2Ra1xbAli1Exkdw9uXQcYKFN+GPa++oWG0XmXzprv83XuwveRyk3A==
X-Received: by 2002:a05:6402:b31:b0:510:dae0:2c3f with SMTP id bo17-20020a0564020b3100b00510dae02c3fmr4101328edb.37.1685216447323;
        Sat, 27 May 2023 12:40:47 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id q22-20020aa7d456000000b0050bde945c00sm1265055edr.78.2023.05.27.12.40.45
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 12:40:46 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5147e8972a1so2709784a12.0
        for <regressions@lists.linux.dev>; Sat, 27 May 2023 12:40:45 -0700 (PDT)
X-Received: by 2002:a17:907:36cd:b0:953:37eb:7727 with SMTP id
 bj13-20020a17090736cd00b0095337eb7727mr6716027ejc.43.1685216445655; Sat, 27
 May 2023 12:40:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <efd6f2d4-547c-1378-1faa-53c044dbd297@gmail.com>
 <CAG8fp8SaHi0X-tZHnji_93wBADp1_=brjauWCVXuLaG7iP0p=A@mail.gmail.com>
 <CAG8fp8QXoEkndCzyaYZmg6+ZrszKOfh_YSi0o2_weV7y1_xYkQ@mail.gmail.com>
 <CAMj1kXGjkKK-oHm64Y9P-AbYQWd9jnEdsNucRbY_-7mgJ_4yAA@mail.gmail.com>
 <CAG8fp8ReYLaNYO9LYE1WeeSDg1pO1hz3f-8_WPZkLVWbzzyCvg@mail.gmail.com> <CAMj1kXEGTJufrrcrqjjKqeR-FN+nLsbzx8xGgO+gPfc2YPsy2w@mail.gmail.com>
In-Reply-To: <CAMj1kXEGTJufrrcrqjjKqeR-FN+nLsbzx8xGgO+gPfc2YPsy2w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 27 May 2023 12:40:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whKJoDVuUNhf3U7gPXKu4EeZRv-iwwhL0prQ=U3n8PHiw@mail.gmail.com>
Message-ID: <CAHk-=whKJoDVuUNhf3U7gPXKu4EeZRv-iwwhL0prQ=U3n8PHiw@mail.gmail.com>
Subject: Re: mix of ACPICA regression and EFISTUB regression (Was: kernel >=
 v6.2 no longer boots on Apple's Virtualization.framework (x86_64); likely to
 be related to ACPICA)
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Akihiro Suda <suda.kyoto@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	linux-efi@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux x86 <x86@kernel.org>, 
	Linux ACPI <linux-acpi@vger.kernel.org>, 
	Linux ACPICA <acpica-devel@lists.linuxfoundation.org>, 
	Linux Stable <stable@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Jianmin Lv <lvjianmin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Robert Moore <robert.moore@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2023 at 11:42=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> Yes, that makes the most sense. If the existing virtual machine BIOS
> has a hardcoded check that the EFI stub version is 1.0 even if it does
> not boot via EFI to begin with, I don't see how we can reasonably
> treat this as a regression that needs fixing on the Linux side.

Well, we consider firmware issues to be the same as any hardware
issue. If firmware has a bug that requires us to do things certain
ways, that's really no different from hardware that requires some
insane init sequence.

So why not just say that LINUX_EFISTUB_MINOR_VERSION should be 0, and
just add the comment that versioning doesn't work?

I'm not sure why this was tied into always enabling the initrd command
line loader.

Numbered version checks are a fundamentally broken and stupid concept
anyway. Don't do them. Just leave it at zero, and maybe some day there
is a sane model that actually has a bitfield of capabilities and
requirements.

              Linus
