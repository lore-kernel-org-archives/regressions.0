Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69871537DD
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 16:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724258452; cv=none; b=WokXYsUDIaZohmOSo41c+q2ssCp+nCMfECsJEzmoMrRYYA6cGfZib6bQUFcW64R11Spq+32nLbDn0kyUXJ64oqTh7M8DTt5ZxMdDJMlwFJhvW7zqs8j0NhkwhGjtIdYMo1js1sw9CXWH8fTv2CcQPJfB+0zmR2DkbtqtXbCy1FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724258452; c=relaxed/simple;
	bh=sJf6jiQ13TDCgcjgRib4X5ouGA1y4YARS+xp4O8b7Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0RmBG2r6YuWMwUVRODlS5ZyhSyRJNkGsMrgHm3ium12KPk/nQ1Vne7L4Qstr5g1rNaoEXElwPPUPwHb9RkqUZC5Klc51boc4wI35Lw17zamU5k+0oyposeT1Js/d12DdAZeO9/tNOkyPgjr8UQcRXFBoPpAEGAM9TBv2Hp9iN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAoICay3; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAoICay3"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a83597ce5beso169014866b.1
        for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724258449; x=1724863249; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJf6jiQ13TDCgcjgRib4X5ouGA1y4YARS+xp4O8b7Kg=;
        b=bAoICay3Ezqmvsp83XzPEts15lRwrxg2gGotz60xtG0K1XA6hGCRiq5q4H1/cFyE5c
         2V7dixHlnC62W087W9wR1cp/tZ3/xWUoRDOUzTKYoiSL3CzKlCpMvDpBJaz0SktTj95E
         gC2l3EdIBWvI4zRtouCCKs/92SZAmoK3LWwG/se9BaksSwJ8MVg3xVRJ/jpzSqv0KI+i
         yqokIpyQvCEedgjh/bTJ2y1w5TAbcdBTk6Gmm9m3DTFRwTYfh7T1ezItupjFG+WtO54n
         CLuCqdqg3Pk8vudN8dDyjDxdwHTnTUPAxoh5DlNCgJYPtqCGEnd+6/18vOZVPDY4VSAS
         V3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724258449; x=1724863249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJf6jiQ13TDCgcjgRib4X5ouGA1y4YARS+xp4O8b7Kg=;
        b=SiUb+CcIoU3k2YJ5aEsVwK49IXJ1+8wrhfkC5z6FgR6aa37mP6TEfwIkc4Mb32AnHR
         Nz1XlvmCxsavdEq8f9KjzpKzP04i9/O/uxz79g3JiXWii8wKozsw9521hTS5VD8pD0nQ
         58Zmu+w90Fj4Rm+0YOMmxmlT6Si8jlYe5elah8bidlMUEIS9I39WkvECNIu1qQcgDvlV
         NnGVLf2WcniVewfXfPh8vHLXsO5Phca7ez4RrgmNapAST+8o33EnomPOiSrYcflFL1dV
         hiJClNaZTR2jvad2B9l5o6BpjGct7HQf8pwv3uBYlR+/TjuNqy+mHQUfhiOPcK/M5X4e
         JuGA==
X-Forwarded-Encrypted: i=1; AJvYcCWTl884WKRt5+XfjADnA7WXpQfRpuIFl8pfp/9pVVFnacgh6Sx1JD+NOYoRKlb9lcq4MftNPZsDwE+NJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZgtsqkTNTmUOvyqvmK4yXjUvrffiUNTrS0sM6I4ztjOHoNGOr
	B1k5muAJ1tguaFX4kCS+fS48msaJbXAurXjoy+lQkve79sugQexBRSHZ7bRTtb552vEWaAK+KKK
	TsLudfl1K61dxzklKpcPhk9lqoGI=
X-Google-Smtp-Source: AGHT+IHBzbuPaj1YZCt0hCbiC2P/pXGyXmrjLnBwGTyy/blqFT/D977io1I/VfCIZ8TRKK3R9hsKGb8cHgs2p8zmrMs=
X-Received: by 2002:a17:907:868c:b0:a7d:ab62:c317 with SMTP id
 a640c23a62f3a-a868a908c50mr16241266b.30.1724258448536; Wed, 21 Aug 2024
 09:40:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK55_s6do7C+DVwbwY_7nKfUz0YLDoiA1v6X3Y9+p0sWzipFSA@mail.gmail.com>
 <badd583d09868ffdd48a97c727680ca6f5699727.camel@gmail.com>
 <188a0d1310609fddc29524a64fa3c470fc7c4c94.camel@gmail.com> <2449825072217d392b5b631e8fd394e91b22a256.camel@gmail.com>
In-Reply-To: <2449825072217d392b5b631e8fd394e91b22a256.camel@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 21 Aug 2024 09:40:36 -0700
Message-ID: <CAADnVQ+9oy6L+oYWJsvy_yMri8vDL9jBQRhZ8nf0SEMm+mT4DA@mail.gmail.com>
Subject: Re: KASAN: null-ptr-deref in bpf_core_calc_relo_insn
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Liu RuiTong <cnitlrt@gmail.com>, stable <stable@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 9:34=E2=80=AFAM Eduard Zingerman <eddyz87@gmail.com=
> wrote:
>
> On Wed, 2024-08-21 at 04:46 -0700, Eduard Zingerman wrote:
>
> [...]
>
> > will post a fix to bpf mailing list shortly.
>
> Status update:
> apologies for the delay, the fix is trivial but I have some problems
> with test case not printing expected log on BPF CI, need some time to deb=
ug.
>
> Link to wip patch:
> https://github.com/eddyz87/bpf/tree/relo-core-bad-local-id

I would ship the fix (since it's trivial) and sort out selftest later.
