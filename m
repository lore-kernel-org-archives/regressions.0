Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B94B1CA94
	for <regressions@lists.linux.dev>; Wed,  8 May 2024 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715202140; cv=none; b=Qwr1RErgC1YYkfLymwbltvcHwPRvyWUh9lReZAzk5K5XEfBbHwjYb0s9ggPJUBnbghE3I47rMlFvHR/LZqZtcsMwVrVnfRYYKtwesmWRKAR3bDjV943aY/GQodWGwDJKtX+z2hgRqRtHT3UpwQZCgFiY4vm2pe0sWZ96c6qjm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715202140; c=relaxed/simple;
	bh=6wHGwPkQd/sjB3p8mhsAho/kp3oSLQUTGgVH9tIR0IU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cYRnV6KurpceyUVmsn1WMkwzLhBIpHiRE0Kt2Z+/D3XfOauUj7e/R93P/niwaU3QE8a+Du7AtvD8k/J3E9z4J6kCuz9LOjKOCdaLAQ5ttbbQ2P/hjXRep6+KHg1C7Jubk2Tajk6axDjkQxFh+pOSoDC+l4CGS18eUHG22VvAfec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PHk8/VkC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PHk8/VkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715202137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6wHGwPkQd/sjB3p8mhsAho/kp3oSLQUTGgVH9tIR0IU=;
	b=PHk8/VkCgMKuiaIVprulMhpwqrq97QLUJZzb2gTW60b/9XlhTygjx9ma+3DEHz15OzUu91
	oUE6ky/lKau8PX5lNNtT34RT9s5tx8vbpgg/elkscWwhEInmQdThmtishjNkq5irc6Tsgp
	GyKmCq5qZWIux/XuD0NK5lsNks+9vHA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-qFte1ozPMiuopdQyHokP8Q-1; Wed, 08 May 2024 17:02:16 -0400
X-MC-Unique: qFte1ozPMiuopdQyHokP8Q-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43d5a4cdfbbso1866671cf.1
        for <regressions@lists.linux.dev>; Wed, 08 May 2024 14:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715202135; x=1715806935;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wHGwPkQd/sjB3p8mhsAho/kp3oSLQUTGgVH9tIR0IU=;
        b=Qt3r6XKNeozUGBCBbl5wJE8Jx+L6vXb267QMNzKxMSQkqYM2uctM3UX1svktxUHSGP
         ppbdSGI2xkQlsMDRtKz9DsFQQ/Zgoy98bndqbN3XjYEnUWnIHBHcCbfU8QDrZHSIvRrj
         qQwC1V/NO0YsUwTiZ4B1UoQjeR/IHWbLbhLy3oLTGFVskdiTFLC1ulgvXDGYWhLKFIO7
         FIOgkqV48DxSbbdgM5JrdU2Qh1sR1VYUoHamGDaken3GMiLU3+7wxokcX7sLbEgnEluF
         w2XiBDohhsqOr62mxszcIeykcNSrpiEBsKFolmkpSZRdqaQZ5OFDdNo+jF6jvjZwUomc
         RD8w==
X-Forwarded-Encrypted: i=1; AJvYcCUmZoNHPeD/2Q/Hc+1DDiotc2McG6gXSsFygoan0UUdkmxuCgkOU+wz5G1/8BOENCzMUAcVtYEC+kHKOToanSdvG5q+bz+1pyL8Wak=
X-Gm-Message-State: AOJu0YwgnON43Sdld7xBQEFAB5+svLSpuNohh0n1mwQuuRXyWHtJoExk
	g2E7M6TJWroDozR21W178DUccWxeCf6YxoVVD0HC2IM8YT49LFaHlUiaRabZpIBbMFAfAZSjr7+
	ZVaQsdOI/steQW9DJuf+ooPiLzw1m9dwr2071T3kmjitUDzxNfXvgEiv1/RwY
X-Received: by 2002:a05:622a:1897:b0:43a:c8ce:4405 with SMTP id d75a77b69052e-43dbf74dc8cmr41127741cf.59.1715202135699;
        Wed, 08 May 2024 14:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVCbj2mpjPWcjmm2vAmxtWot+9whE/qHsFWPc3ushMQYr4HJT4MXkm3rZDA5nZdLDi7Fq3wQ==
X-Received: by 2002:a05:622a:1897:b0:43a:c8ce:4405 with SMTP id d75a77b69052e-43dbf74dc8cmr41127471cf.59.1715202135303;
        Wed, 08 May 2024 14:02:15 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300:ded4:e2aa:1dec:4d9? ([2600:4040:5c6c:a300:ded4:e2aa:1dec:4d9])
        by smtp.gmail.com with ESMTPSA id gc15-20020a05622a59cf00b00435163abba5sm4888456qtb.94.2024.05.08.14.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 14:02:14 -0700 (PDT)
Message-ID: <ea927dad269cc21de1d0baf3d6c9f66ee025b862.camel@redhat.com>
Subject: Re: Early boot regression from f0551af0213 ("x86/topology: Ignore
 non-present APIC IDs in a present package")
From: Lyude Paul <lyude@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>, "Linux regression tracking
 (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Mario Limonciello
	 <mario.limonciello@amd.com>, Borislav Petkov <bp@alien8.de>, Linux kernel
 regressions list <regressions@lists.linux.dev>
Date: Wed, 08 May 2024 17:02:01 -0400
In-Reply-To: <877cg4ppd5.ffs@tglx>
References: <3d77cb89857ee43a9c31249f4eab7196013bc4b4.camel@redhat.com>
	 <20240418082703.GCZiDZVyra7qOQbyqn@fat_crate.local>
	 <fd040809d95b3e12b2fdc78a2409e187716bc66f.camel@redhat.com>
	 <87plumxz4x.ffs@tglx>
	 <abbb7d7ca781f6c664e4c5b1dffc19394ac79691.camel@redhat.com>
	 <87le59vw1y.ffs@tglx>
	 <3a0afe545747e5314a9cb6bbaa9ce90b259ddfac.camel@redhat.com>
	 <87edautcmz.ffs@tglx>
	 <3b1d16e357c1f9badeef405366492f05af26c085.camel@redhat.com>
	 <878r11t8zu.ffs@tglx> <016902d9-3858-4c65-b3ec-f7a5103af63c@amd.com>
	 <51d0dff8-2888-463c-95ab-71b491f12a8f@leemhuis.info> <877cg4ppd5.ffs@tglx>
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

Yes sorry - I was out of work for a bit but I'm back now and can get
you the info today - thanks for the patience =E2=99=A5

On Wed, 2024-05-08 at 12:30 +0200, Thomas Gleixner wrote:
> On Wed, May 08 2024 at 10:38, Linux regression tracking (Thorsten
> Leemhuis) wrote:
> > H! Lyude, Thomas, what's the status here? From here it looks like
> > we
> > were close to a fix, but then it turned out to be a bad fix -- and
> > afterwards nothing much seems to have happened. Did it fall through
> > the
> > cracks, or was this already fixed and I just missed that?
>=20
> I'm waiting for more data still.
>=20
> Thanks,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tglx
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

