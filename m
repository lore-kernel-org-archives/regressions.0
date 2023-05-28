Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83D7C
	for <regressions@lists.linux.dev>; Sun, 28 May 2023 07:02:52 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-565d354b59fso12977127b3.0
        for <regressions@lists.linux.dev>; Sun, 28 May 2023 00:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685257371; x=1687849371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRkqudkgMQ49oMc1gbKQdMb2w50Dkd1fBeJ/gvJ6yX8=;
        b=qmMTFrt8uoytygO19Oob0VRjf+V9CWhsO4qE9F78KrSta+nabHhX11re+hazJIZlPX
         TzJeNTBNwbB/qCGJaFc6B34OW2Khw8CWOyne6MGJy7DOi8STTwy4Lyel3LWUwAzb74sG
         mEwxjcmeyArXXCEa77HqYNLRXy+MU5Amtw8TuAHLJ3I4JXpnqJRFwSYO3T7NhYQZ0N40
         9AMiK7zVcPZZt8n1p8u/NL/fk5VKFoGWY/dtTIpExxZD/B6ygrOc2dipwboWZmXU/qmt
         fmbXQGA0vg8g+l7EDAdUXj4eQYJZn5mY3WS03aAvA2h0h0SqU28km1LxCmAwMTqtuK32
         Uglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685257371; x=1687849371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRkqudkgMQ49oMc1gbKQdMb2w50Dkd1fBeJ/gvJ6yX8=;
        b=AeCmM9MK++/OCOmlnOE4Bpce8UBoJ0rMtvUw2GG2F02pmvfQ2ejgZCxF+Vrl8b21K1
         nDOwzjG4Dx13NPoPldAUAdHF+ipABJnUmUoPVL/eoISvjeLw/+EuTklurcEuFHxjMx/5
         G5k6NNtd4JjkRkXg2qPfpIDVdNpK4jnSjyoInU71VdO1r+qB6WPIVI+1u1nR1tQhgVo7
         dsY8GcFNzwIbn0cAzzyJM+Cz9D0q84+972wpziwF6IMMyB6jUMoyVPuJr8eV6Mesa4jJ
         fkWe4n2HDy6d2iNrIp4SmnFM1Cjh0k06OrDGdyTwP4CkScxawngWa/HXj3R+JreBIu7e
         8pCg==
X-Gm-Message-State: AC+VfDwOoYA7JSG0nN0ArUmHu+Hgs0qhRV/2zqF5jZaU19eH34Qgkxrs
	O5dvwxUKo4Eoryr3oa8ITzD369K1zFFXt1iBaFU=
X-Google-Smtp-Source: ACHHUZ5QnHgzGna8A0ict5YGfhiUK1/FyXdi06p0MjmNBDyw5tltLHDzYhcCm1SX6aeGhqMyx+OQ3MmemowirLDgF2Y=
X-Received: by 2002:a0d:cc0c:0:b0:55a:5870:3d47 with SMTP id
 o12-20020a0dcc0c000000b0055a58703d47mr7603574ywd.26.1685257371475; Sun, 28
 May 2023 00:02:51 -0700 (PDT)
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
 <CAG8fp8ReYLaNYO9LYE1WeeSDg1pO1hz3f-8_WPZkLVWbzzyCvg@mail.gmail.com>
 <CAMj1kXEGTJufrrcrqjjKqeR-FN+nLsbzx8xGgO+gPfc2YPsy2w@mail.gmail.com>
 <CAHk-=whKJoDVuUNhf3U7gPXKu4EeZRv-iwwhL0prQ=U3n8PHiw@mail.gmail.com> <CAMj1kXHmRYkmJyfW5+B74dPyA1+yHvt9majpZ9Ut1p0i8zM+DA@mail.gmail.com>
In-Reply-To: <CAMj1kXHmRYkmJyfW5+B74dPyA1+yHvt9majpZ9Ut1p0i8zM+DA@mail.gmail.com>
From: Akihiro Suda <suda.kyoto@gmail.com>
Date: Sun, 28 May 2023 16:02:40 +0900
Message-ID: <CAG8fp8Teu4G9JuenQrqGndFt2Gy+V4YgJ=hN1xX7AD940YKf3A@mail.gmail.com>
Subject: Re: mix of ACPICA regression and EFISTUB regression (Was: kernel >=
 v6.2 no longer boots on Apple's Virtualization.framework (x86_64); likely to
 be related to ACPICA)
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
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

> Fair enough. Or we could try bumping it from v1.1 to v2.0 (or v3.0 if
> we make it a bit mask).
>
> Akihiro, would you mind checking if changing the major/minor to any of
> these values results in the same problem?

Surprisingly, v2.0 and v3.0 boot, although v1.1, v2.1, v2.2, v3.1,
etc. do not boot.

Looks like Apple's vmlinuz loader only requires
LINUX_EFISTUB_MINOR_VERSION to be 0x0
and does not care about LINUX_EFISTUB_MAJOR_VERSION.

2023=E5=B9=B45=E6=9C=8828=E6=97=A5(=E6=97=A5) 6:48 Ard Biesheuvel <ardb@ker=
nel.org>:
>
> On Sat, 27 May 2023 at 21:40, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Sat, May 27, 2023 at 11:42=E2=80=AFAM Ard Biesheuvel <ardb@kernel.or=
g> wrote:
> > >
> > > Yes, that makes the most sense. If the existing virtual machine BIOS
> > > has a hardcoded check that the EFI stub version is 1.0 even if it doe=
s
> > > not boot via EFI to begin with, I don't see how we can reasonably
> > > treat this as a regression that needs fixing on the Linux side.
> >
> > Well, we consider firmware issues to be the same as any hardware
> > issue. If firmware has a bug that requires us to do things certain
> > ways, that's really no different from hardware that requires some
> > insane init sequence.
> >
> > So why not just say that LINUX_EFISTUB_MINOR_VERSION should be 0, and
> > just add the comment that versioning doesn't work?
> >
>
> Fair enough. Or we could try bumping it from v1.1 to v2.0 (or v3.0 if
> we make it a bit mask).
>
> Akihiro, would you mind checking if changing the major/minor to any of
> these values results in the same problem?
>
> Unfortunately, the only data point we have is that a non-EFI
> bootloader (which is unlikely to carry a PE/COFF loader) needs the
> byte at that specific offset to be 0x0, and we really have no idea
> why, or whether we could hit this in other ways (i.e., by changing the
> PE/COFF header to comply with new MS requirements for secure boot,
> which is another thing that is in progress)
>
> > I'm not sure why this was tied into always enabling the initrd command
> > line loader.
> >
>
> For x86, it doesn't actually make a difference, but on other
> architectures, the command line initrd=3D loader could be disabled, but
> that possibility was removed. The idea was that by bumping the version
> to v1.1 at the same time, generic EFI loaders would be able to
> identify this capability without arch specific conditionals in the
> logic.
>
> Currently, GRUB and systemd-stub check this version field, but only
> for v1.0 or higher. Upstream GRUB  switched to this generic version of
> the EFI loader just this week, but does not actually use initrd=3D at
> all for EFI boot (on any architecture).
>
> > Numbered version checks are a fundamentally broken and stupid concept
> > anyway. Don't do them. Just leave it at zero, and maybe some day there
> > is a sane model that actually has a bitfield of capabilities and
> > requirements.
> >
>
> Yeah, maybe you're right. Currently, only a single feature is tied to
> LINUX_EFISTUB_MAJOR_VERSION=3D=3D1 (LoadFile2 support for initrd loading)=
,
> and this PE/COFF version field has no meaning to UEFI firmware itself,
> so we could simply treat these fields as bit masks if we wanted to
> (and setting the initrd command line loader bit for x86 would be
> redundant anyway)
>
> But not being able to freely set such a bit because some rarely used
> non-EFI BIOS implementation imposes requirements on the contents of
> the EFI specific image header is rather disappointing.
