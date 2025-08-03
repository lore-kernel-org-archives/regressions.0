Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55F1C68F
	for <regressions@lists.linux.dev>; Sun,  3 Aug 2025 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754225122; cv=none; b=sKwzV/NW9PiKndo+8vJWfD/4Y6BZAIXpffxFnQsXFs4fgmjuoy2aO5WqrwaLVS9kZUKlsK+ZQ+kcTLfko8wBLdcsg7g4uOH/P+B5ZlNytBNRFtFKQN1AGrYzrSMVxHTKvomUuKO4+zO+xxSy346Nyb4Z1YnPjJ/sZuoNqC27VBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754225122; c=relaxed/simple;
	bh=pxXOv0H77qu3boXS8S20sjf3H+BGpeAjIG2LP7StaE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sf5d3kdrqaXTuNWk1DEAzlIZr1qar9ycMrA4Fkyu5o/+bajxx97TjAQMvFcTH6jWdchfw5IWn/FUYGaabVYu7lRgPk/mPlIpUyEJiW218o2xq1029aowCPlIxJy5RR0EyLd+ZCrszt6yd8F3O7sHQRFDNQY+ri1HHQTCqk2c4Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zzizz73T; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zzizz73T"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af949891d3aso146579366b.1
        for <regressions@lists.linux.dev>; Sun, 03 Aug 2025 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754225118; x=1754829918; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxXOv0H77qu3boXS8S20sjf3H+BGpeAjIG2LP7StaE4=;
        b=Zzizz73TjHoFFZlSjvnER9r6nbXrvcyi2FvkwvqZWLJcDV1bOGtP5hF9ZwZKuW364F
         xZ4vx621Sa/Qi0cQVvk1F1rEtuyEDib3eGXlfd3191SVJwJIlMMkb9h2o8XnPmW3YdA8
         f1/W9Ex9Vd226OYZ8+uaT1VdhlKNM628tVzhVQo+lmO1lPvRx0EABQTxD6a3bYJnSi3M
         mI8gNb19lUQkX7ZjiJuZh7/AIYtkycd4kr3cObN3kmx4PLx/1I2U0aLKGGfs4mJW/cn/
         Xch0pRz5jj0pQdxpc2r3r5hoIb0s+TO4Vw1lon7o/Z8NsPq8HvwFEeoKLzhArDRXzQKk
         Bkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754225118; x=1754829918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxXOv0H77qu3boXS8S20sjf3H+BGpeAjIG2LP7StaE4=;
        b=TMGZ+BxLe7t9wmkDfPHt13DP0emOlXM+Uzqcn9JRc68+Rhdbrq6KRknV71OdVoxDw2
         nx7kJ75gusjDtjA/zhd5NcBsKm7DrQTjVhhT2Xa3KdEN/h94Tu459+oj27XnQDOtrEBG
         20tn9T969kWZ4bA9ISahXtUFBXHyXMqIaWoxIDV+9gKb6XYbiuubcbtPqliiKMmtFh++
         u9wKbXBGwi6Re+OS2CuZd3TrFsQguYMN3pmw5Ux/WdnMEE63QwQ1uOQZycdkyBeWJoIu
         xk7ELsTI8pyX1z+u3LIfbyRxcNFSyCJvZ6GSVkAYMg7totX1ksWg1XKLATbz/b32xPp3
         P3iw==
X-Forwarded-Encrypted: i=1; AJvYcCW6qg8NgR61rLzqh6PIflpgI4zNjr+YPlBontSONYnyXarVoDmVWxgBdyWtLzTK0ks/E9x7j/Ts23/gOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwkBnY5aSk5AbzRVcMSEhfULTvqgjqyRS9a2WgTDkHqpva/hjk
	tYeumzIr+Pt8L8VWXBUlz8zrHBN7j9suWAEFqvAhTxIIjKuefWGUMJ1dd4ktKKhjwjgpD6r4Aws
	4szPcZqvWVlA9ie6gGqpN9kEF6AAxe5o=
X-Gm-Gg: ASbGncsb6SsjxkWpuqIrMXs0YHl1c5uHK1R+5MGTc2OtPxWrrkPJgPSoBg1NBRwkoMp
	rxtPIwdskyfqN7zTdPFPwBW2U7siJQ6aPgKf1FySSVZ3lfKEgP3++dwiNslUb66+JPijStC2/tZ
	qz6QnXfFiUiGI47CHH8GjOufycrGpfIFxbk6PTP0dXW/9mCtMdAMmcUyIWlMM0yxuYBHAQ/w5I5
	0BTQEY=
X-Google-Smtp-Source: AGHT+IHFQr61biS993WpaTiLN314ukC/GGuYrmWFHzReiBI+xBUUZ2E1nmjUhmzhYsuLobiRAM+1bP/mpJx6eUe4McA=
X-Received: by 2002:a17:907:724a:b0:ae0:aa0d:7bfa with SMTP id
 a640c23a62f3a-af9402301f3mr558310866b.50.1754225117967; Sun, 03 Aug 2025
 05:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
In-Reply-To: <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Sun, 3 Aug 2025 15:45:06 +0300
X-Gm-Features: Ac12FXwQ1gQW4qwRV_K-3Velp0hCrjgNlIh5_C2All-wPbXiQ1zvu-N5hZpFRGU
Message-ID: <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
	rafael@kernel.org, ville.syrjala@linux.intel.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here what I have from bisecting, please let me know if it makes things
clearer or not.

git bisect log
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
# good: [1b1934dbbdcf9aa2d507932ff488cec47999cf3f] Merge tag
'docs-6.8-2' of git://git.lwn.net/linux
git bisect good 1b1934dbbdcf9aa2d507932ff488cec47999cf3f
# bad: [8c9244af4dc8680a453e759331f0c93d5bde1898] Merge tag
'kvm-x86-svm-6.8' of https://github.com/kvm-x86/linux into HEAD
git bisect bad 8c9244af4dc8680a453e759331f0c93d5bde1898
# bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
missing "depends on KVM"
git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
# bad: [783288010035e4c250a0b6491a4642cdb8d30548] KVM: x86: add
missing "depends on KVM"
git bisect bad 783288010035e4c250a0b6491a4642cdb8d30548
# bad: [861deac3b092f37b2c5e6871732f3e11486f7082] Linux 6.7-rc7
git bisect bad 861deac3b092f37b2c5e6871732f3e11486f7082

# being on a 861deac3b092
git bisect bad
The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
This means the bug has been fixed between
ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
[1b1934dbbdcf9aa2d507932ff488cec47999cf3f
61da593f4458f25c59f65cfd9ba1bda570db5db7
6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
ba5afb9a84df2e6b26a1b6389b98849cd16ea757].

Thanks.

=D0=B2=D1=82, 29 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13:20 Jani=
 Nikula <jani.nikula@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 29 Jul 2025, Andy Mindful <andy.mindful@gmail.com> wrote:
> > Please let me know if any further information or testing is required.
>
> Likely the quickest way to find the root cause is to bisect the issue.
>
>
> BR,
> Jani.
>
> --
> Jani Nikula, Intel
