Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C25F15FA6E
	for <regressions@lists.linux.dev>; Wed,  5 Jun 2024 23:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717629363; cv=none; b=AfgZf7ccs337qa7y+yZ/xjPmvL/2k7hV9Y8CXvV82TlmFpoPULTIyh6Ck9Xgko+DndMf+l138uOHXaMes8Gmx3PzI5YkLxDk+Hmmrej+ilujC608RhA5jeaRtUmQjA4MHztJsdm+09TAXFSHewNtFpmDYRUacbN5cXOXPagSUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717629363; c=relaxed/simple;
	bh=Kw/ZGwacPfN6ZUbaVn20kczvR8Ku+fcQmm7JERInAVM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S8JDCBM2N/eUk/OmJzxS+3iVoAAvt48pQyW11M3GOf04Ht0WWqGX+sAJUSS5cmdju6l8HGTEf7ckFFmrzRH2ihB6y+mOiCRG7ZTbXWMkC/V/6jplbXMy9erGbjhL+88Q9JDkvf1bCayy+7YeswyN+iy0hMkqeaLxtwuNzyyQUm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i7+NVVwC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i7+NVVwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717629361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kw/ZGwacPfN6ZUbaVn20kczvR8Ku+fcQmm7JERInAVM=;
	b=i7+NVVwC97ZRc4TWhOCgN9IUcuEhYpMug+Jidpao0hAs+LKCZAlng8Y9sNTMHXLwOpvtJ0
	WYwoRlOBzWVKB5SyM9l6wE3iGn/DJ2GqfmDKRFHrvMWBgx7j8eC03H66GKL21sJLMIZYFo
	cLM2oejQRA/h5zYx3NynV3CwVsz4CBk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-xBaaf5oLOP6Mln_Y0r1olg-1; Wed, 05 Jun 2024 19:15:59 -0400
X-MC-Unique: xBaaf5oLOP6Mln_Y0r1olg-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-62a08436241so5451117b3.3
        for <regressions@lists.linux.dev>; Wed, 05 Jun 2024 16:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717629359; x=1718234159;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kw/ZGwacPfN6ZUbaVn20kczvR8Ku+fcQmm7JERInAVM=;
        b=ngz5yUR8pnpPAKVDugmMW+TIaHup1I1tOUfHQhGkO47ylEhWOzUr5SYpAGdGNE/AhF
         N2tG3MGFc41y8MF1j+oLuZnRxJnM2pgZPdS7b93g3tA92njCagTXAcG3XHIbtKQqxmuf
         YAOFKZyTTqX190f2hcAoPIC9zVgTnM4LK0CkEbt6CyqkoP6GDQFZq34Wa/RvrxvYhbY0
         PcdLWhL634BOJ38pGrSgb9mv/4EWn4IplgRHwI0qy+U+E5q69hpsqRZOsTcJBq1wcKWg
         bDExV3/r3mvVOb2U9A9bHb5mshhcy3W0GJ6Qquag+QiJPwYzPtlxp7/cXs6tc+hAgL3C
         /XGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdi9Vp0x0CagiuvW0PdIXrtDFN30IIeFsDmtJKuSfQRgbLB9+b+pI/sKIrKJsC39Ivvv878m/AVwcxstScYm9dh9JgSl2iKtwXD2E=
X-Gm-Message-State: AOJu0YyKMBkBOoe2908kdR2cY4QtzbOWLfK3rw3GkFkZ32o1UCYxFSIu
	6W7dl+dCN8yINxajvOMeUINAlnv67D6RCLTaCUnkNrAXAwY6OlSE8Ka7uHX5rza9o1oy/ZquiNx
	hIQwpB6isuRhJ2MeKVuLkx3jN/4tAsnKvH7SdDx/3csxLaERzfPdX8PB8iBYi
X-Received: by 2002:a81:92c2:0:b0:615:1294:d6b6 with SMTP id 00721157ae682-62cbb48d5cdmr41236887b3.9.1717629358959;
        Wed, 05 Jun 2024 16:15:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgk9m9fU9PEpnvdSZP78uzIT8ZiqXV80OdtsuuvLYsTvy+ltJckv2EpgD6ZPCynTcRuC8F4Q==
X-Received: by 2002:a81:92c2:0:b0:615:1294:d6b6 with SMTP id 00721157ae682-62cbb48d5cdmr41236607b3.9.1717629358428;
        Wed, 05 Jun 2024 16:15:58 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c4c:a000:270f:2a70:881d:60b9? ([2600:4040:5c4c:a000:270f:2a70:881d:60b9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f718fb7sm539206d6.62.2024.06.05.16.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 16:15:57 -0700 (PDT)
Message-ID: <c735dcc6f6e4d4074bc834fba7204e22779e9ab9.camel@redhat.com>
Subject: Re: Early boot regression from f0551af0213 ("x86/topology: Ignore
 non-present APIC IDs in a present package")
From: Lyude Paul <lyude@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Linux regression tracking
 (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello
	 <mario.limonciello@amd.com>, Borislav Petkov <bp@alien8.de>, Linux kernel
 regressions list <regressions@lists.linux.dev>
Date: Wed, 05 Jun 2024 19:15:44 -0400
In-Reply-To: <87ttiha77b.ffs@tglx>
References: <3d77cb89857ee43a9c31249f4eab7196013bc4b4.camel@redhat.com>
	 <abbb7d7ca781f6c664e4c5b1dffc19394ac79691.camel@redhat.com>
	 <87le59vw1y.ffs@tglx>
	 <3a0afe545747e5314a9cb6bbaa9ce90b259ddfac.camel@redhat.com>
	 <87edautcmz.ffs@tglx>
	 <3b1d16e357c1f9badeef405366492f05af26c085.camel@redhat.com>
	 <878r11t8zu.ffs@tglx> <016902d9-3858-4c65-b3ec-f7a5103af63c@amd.com>
	 <51d0dff8-2888-463c-95ab-71b491f12a8f@leemhuis.info> <877cg4ppd5.ffs@tglx>
	 <ea927dad269cc21de1d0baf3d6c9f66ee025b862.camel@redhat.com>
	 <d2c6f335a6eb5892b0d894d5df4a6e713fa013b5.camel@redhat.com>
	 <87jzjxn6s5.ffs@tglx>
	 <d3fe5278e7cd5af6c62b470b281b547b67e3959a.camel@redhat.com>
	 <97bd95480a8b9951edc9ee2d2648d1b9c574e3b0.camel@redhat.com>
	 <87bk58n6le.ffs@tglx>
	 <2fd6009d21d606d13f0c472dbaa754a21f3105d9.camel@redhat.com>
	 <87wmntkhak.ffs@tglx>
	 <d4496b4ed8a8a7bb34cf12e4cce65a6ad6705bc0.camel@redhat.com>
	 <874japh4ww.ffs@tglx> <87sey8g5z6.ffs@tglx> <87ttiha77b.ffs@tglx>
Autocrypt: addr=lyude@redhat.com; prefer-encrypt=mutual;
 keydata=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
 8doKQgPpApRcFGaE=
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2024-05-29 at 00:43 +0200, Thomas Gleixner wrote:
> Lyude!
>=20
> On Thu, May 23 2024 at 12:47, Thomas Gleixner wrote:
> > Something I wanted to ask before. Is the BIOS of that machine up to
> > date?
>=20
> Any update on this? I really don't want to add magic workarounds if
> there is a BIOS update which fixes it.

OK - just booted a normal kernel up after updating the BIOS and you're
right - that does appear to solve the problem :). Thank you!

>=20
> Thanks,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

