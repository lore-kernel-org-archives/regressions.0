Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4746523ABB9
	for <regressions@lists.linux.dev>; Mon,  4 Aug 2025 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754305065; cv=none; b=Yx0NNGq0CZSX4VDe6hATeon+w1RltLEHfBlHzBR2wMV96tiYtB9I4+rS0/5F8w5GqzDygAuT9S6BQPqhWpwiyM2vte/wlzE4FJaosIALhJRlFTdi1KmRUu8U5Lt/t/J01AHDr1GyCXrfrx7DkyzhbpQFMsYxMniUAqQSMoqHOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754305065; c=relaxed/simple;
	bh=EKcmbw33i158VkcjIOBGndTohyXppuVVNq4r8SoAwu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jtrkazhb7rlsJ4DP/zUGtICw7PokEcgKXRD7cqcbaG+oXpYT88lnxXgk7bMW12rN6kDrS/UiIdXjBCD9Ph9tGNRyZXftI+n4mdIihdxaQOtxg5MkGa0l8hjwMDDlhSrNz/ksy+DwqzZH7f8rsTcJV+b9CwbZXr0gSvpKix7u1aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaJwCgMI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaJwCgMI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af8fd1b80e5so704404066b.2
        for <regressions@lists.linux.dev>; Mon, 04 Aug 2025 03:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754305061; x=1754909861; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKcmbw33i158VkcjIOBGndTohyXppuVVNq4r8SoAwu4=;
        b=EaJwCgMInOb0u4RD2+scr51V4CgdypFNG9LvDTI0Km7SY0XKkdd/WC6IerBOcpY4ec
         tgR3gofUqepmBeXp/xgePTB5+EakRETtymJ2LjaEE4Fon0Eqa/GYdAfyCVUMpMT9H8RI
         HrKotnnnMWekfXJhL6fHaCcEOiv97ChzcDZczg/pdqEdFn0WKquXr32qz+2c5O9TcnxA
         o9yGWv59PWKvQC+j6YbL0UT9iifO20wrcFkc3mfb8FUYXzWCnqq3rsjAaq+4ODKLIINK
         M1W5W99NrmDVCQa4Gp7gj9thArwozcFLPm5xeUIT4+jQ9kFZc3dIBj1bDC941FxXJxA+
         mSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754305061; x=1754909861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKcmbw33i158VkcjIOBGndTohyXppuVVNq4r8SoAwu4=;
        b=lqWQ8dlQ7xQW9Iu4sKFlWcvwcB+M6MitW512s6w/Z+E+IATxoaYUkoAYlAnqTsiOrk
         za+fdOvQZujbAB9Z5CeLNiLJ+nf8R0RMfLchONvcdPpTkyikINwJGjE3nLgk7EF1zYQg
         9g22OBFm3x+c4Bo2NIkYw29ECRhq/N/9ToNNMvPabyKzMU4qn4B4969HlSGEoVrGTzkB
         6OvI+JIE4MHPOzp6d9fv4r1K4jpMJGHIr5/OTJfnpiaSHKTvarWX3othyj30Wg2RyPiy
         DbudYAAoFAhn004Lr9XBS8bKxuIOPncbNSUd/8iBYBiN5+MWW/+NrkhWE5L4zJi/4j3X
         YoGw==
X-Gm-Message-State: AOJu0YyQCMkb2NqrqV8ecAN6Qp4iF7tvejbK7CvPjQgh/POuadLioZAX
	eB6QikS2zR7HDBdm+Kbve5CpGWDb+eSlqdwJF5Uy8LmT+WGwnA/h8penrVxoWrgK6rvYlS1R3lR
	YENrTfIbcR4h+t2a0haXSct/GPBRjFkcYmb9V7oOqNQ==
X-Gm-Gg: ASbGnctMbSFu6Rz8/nzZ4Rp7XvGIQbWxZi4LTn7725qbUmU7uv4wWH8+4qiRP37WnJm
	G4AvYaBQSrZxkdOlCPiMJI7NOaU/QMqGjQS3zbvLSg0Iy19wEoZYiXkZm6RH/KBhupKhzUvCc1U
	qsHIsj5A1jz/JCibor1XIDrxDKO4xD2zLwedRFwS2ZEmUEWU8HbGzDt5qf9KIkoGISUIMQjsH6C
	c2xWtFtfNsxkWxE3s0=
X-Google-Smtp-Source: AGHT+IEKgWeCpweInZoRf8h+ySc8h8Zd/5K3fLo9Iz1IaB8JQ0OeLLaC5QAwreLPpuNZD9vPayfW02ltcKhkV1SLfyI=
X-Received: by 2002:a17:907:2da5:b0:af2:5a26:b32a with SMTP id
 a640c23a62f3a-af9401a7898mr948553966b.30.1754305060799; Mon, 04 Aug 2025
 03:57:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com> <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
In-Reply-To: <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Mon, 4 Aug 2025 13:57:29 +0300
X-Gm-Features: Ac12FXzOJ88j54Uw6RBDAtH4-5VhCyZG1ALSoSGb8O5tAtMwgrRtuY8do-ly4uo
Message-ID: <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: regressions@lists.linux.dev, pbonzini@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-acpi@vger.kernel.org, rafael@kernel.org, ville.syrjala@linux.intel.com, 
	tglx@linutronix.de, Christian Brauner <brauner@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Double-checked bisect, looks like I've have found broken commit:

git bisect start
# status: waiting for both good and bad commits
# good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
# status: waiting for bad commit, 1 good commit known
# bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
# skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
# good: [ba5afb9a84df2e6b26a1b6389b98849cd16ea757] fs: rework
listmount() implementation
git bisect good ba5afb9a84df2e6b26a1b6389b98849cd16ea757
# good: [61da593f4458f25c59f65cfd9ba1bda570db5db7] Merge tag
'media/v6.8-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect good 61da593f4458f25c59f65cfd9ba1bda570db5db7
# bad: [e38f734add21d75d76dbcf7b214f4823131c1bae] Merge tag
'staging-6.8-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
git bisect bad e38f734add21d75d76dbcf7b214f4823131c1bae
# bad: [5d197e97fb106c09d3d013be341e5961fd70ec8a] Merge tag
'hsi-for-6.8' of
git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi
git bisect bad 5d197e97fb106c09d3d013be341e5961fd70ec8a
# good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
'docs-6.8-2' of git://git.lwn.net/linux
git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
# bad: [8c9244af4dc8680a453e759331f0c93d5bde1898] Merge tag
'kvm-x86-svm-6.8' of https://github.com/kvm-x86/linux into HEAD
git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
# bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
missing "depends on KVM"
git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
# bad: [1c3c87d720cbd1ff86dc1bfc6df8ee9adce5879b] Merge tag
'kvm-x86-selftests-6.7-rcN' of https://github.com/kvm-x86/linux into
HEAD
git bisect bad 1c3c87d720cbd1ff86dc1bfc6df8ee9adce5879b
# good: [8d99e347c097ab3f9fb93d0f88dddf20051d7c88] KVM: selftests:
Convert lib's mem regions to KVM_SET_USER_MEMORY_REGION2
git bisect good 8d99e347c097ab3f9fb93d0f88dddf20051d7c88
# bad: [6c370dc65374db5afbc5c6c64c662f922a2555ad] Merge branch
'kvm-guestmemfd' into HEAD
git bisect bad 6c370dc65374db5afbc5c6c64c662f922a2555ad
# good: [43f623f350ce1c46c53b6b77f4dbe741af8c44f3] KVM: selftests: Add
x86-only selftest for private memory conversions
git bisect good 43f623f350ce1c46c53b6b77f4dbe741af8c44f3
# good: [8a89efd43423cb3005c5e641e846184e292c1465] KVM: selftests: Add
basic selftest for guest_memfd()
git bisect good 8a89efd43423cb3005c5e641e846184e292c1465
# good: [5d74316466f4aabdd2ee1e33b45e4933c9bc3ea1] KVM: selftests: Add
a memory region subtest to validate invalid flags
git bisect good 5d74316466f4aabdd2ee1e33b45e4933c9bc3ea1
# first bad commit: [6c370dc65374db5afbc5c6c64c662f922a2555ad] Merge
branch 'kvm-guestmemfd' into HEAD

=D0=BF=D0=BD, 4 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 11:15=
 Jani Nikula <jani.nikula@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 03 Aug 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> > Here what I have from bisecting, please let me know if it makes things
> > clearer or not.
>
> Doesn't point at graphics, anyway.
>
> Cc: Christian.
>
>
> BR,
> Jani.
>
>
> >
> > git bisect log
> > git bisect start
> > # status: waiting for both good and bad commits
> > # good: [6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1] Linux 6.7.11
> > git bisect good 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > # status: waiting for bad commit, 1 good commit known
> > # bad: [6613476e225e090cc9aad49be7fa504e290dd33d] Linux 6.8-rc1
> > git bisect bad 6613476e225e090cc9aad49be7fa504e290dd33d
> > # skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
> > git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> > # good: [ba5afb9a84df2e6b26a1b6389b98849cd16ea757] fs: rework
> > listmount() implementation
> > git bisect good ba5afb9a84df2e6b26a1b6389b98849cd16ea757
> > # good: [61da593f4458f25c59f65cfd9ba1bda570db5db7] Merge tag
> > 'media/v6.8-2' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
> > git bisect good 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > # bad: [e38f734add21d75d76dbcf7b214f4823131c1bae] Merge tag
> > 'staging-6.8-rc1' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
> > git bisect bad e38f734add21d75d76dbcf7b214f4823131c1bae
> > # bad: [5d197e97fb106c09d3d013be341e5961fd70ec8a] Merge tag
> > 'hsi-for-6.8' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-hsi
> > git bisect bad 5d197e97fb106c09d3d013be341e5961fd70ec8a
> > # good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
> > 'docs-6.8-2' of git://git.lwn.net/linux
> > git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > # good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
> > 'docs-6.8-2' of git://git.lwn.net/linux
> > git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > # bad: [8c9244af4dc8680a453e759331f0c93d5bde1898] Merge tag
> > 'kvm-x86-svm-6.8' of https://github.com/kvm-x86/linux into HEAD
> > git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
> > # bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
> > missing "depends on KVM"
> > git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
> > # bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
> > missing "depends on KVM"
> > git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
> > # bad: [861deac3b092f37b2c5e6871732f3e11486f7082] Linux 6.7-rc7
> > git bisect bad 861deac3b092f37b2c5e6871732f3e11486f7082
> >
> > # being on a 861deac3b092
> > git bisect bad
> > The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> > This means the bug has been fixed between
> > ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> > [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > ba5afb9a84df2e6b26a1b6389b98849cd16ea757].
> >
> > Thanks.
> >
> > =D0=B2=D1=82, 29 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13:20 =
Jani Nikula <jani.nikula@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On Tue, 29 Jul 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> >> > Please let me know if any further information or testing is required=
.
> >>
> >> Likely the quickest way to find the root cause is to bisect the issue.
> >>
> >>
> >> BR,
> >> Jani.
> >>
> >> --
> >> Jani Nikula, Intel
>
> --
> Jani Nikula, Intel
