Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1492FFDF2
	for <regressions@lists.linux.dev>; Sun,  9 Nov 2025 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762704438; cv=none; b=TJOLot6BqtGhveqODKTR38xJTOzqi5gFh0ilnhQ/YfSGNPraocm9UrSQJ9IA3shCkEyJUwPwMeZZ6C+ItL1/6ixIzLzxkUg3Dn9R7K3DGa3zhsLGcTQgZ/UO+veRx35F7VfdIqHYpb1TWo0TCuuN4nXNrTt8+Glgrt8rITUaT4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762704438; c=relaxed/simple;
	bh=S9fgHs7LNXxCjvnR8z+jGu2x4XIB8BbhT/m8R+mBEHI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f+8wzHiwZukXpLRlDp9adeazzLaC6RIj0uexgst4SK/IduFuI/Vht+U/4Xb3x/bnhipENGIQAqWjLKx/2YhkZ7LlvA3JYEaMdF3wyuYaUMIjoAEAEoQzgDJg6Z/3rs6q1lsbnBGd85PztH6AXU7OL7an8fXqw6MIuCNDc99+UAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G52XZ1SD; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G52XZ1SD"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7c70fb8da69so165485a34.1
        for <regressions@lists.linux.dev>; Sun, 09 Nov 2025 08:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704435; x=1763309235; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S9fgHs7LNXxCjvnR8z+jGu2x4XIB8BbhT/m8R+mBEHI=;
        b=G52XZ1SDXGOcZQhaP5srFur806TeTOvMb+CCq5wRVtbYSU5vZnQ6z4/dUFKOh4Lnol
         Fyy/JyiSiMaZOcbVNR9uK5mC7PjxNE1flAPzkWvk8VisU11aopKgnmBZr3LafUt3I7yu
         QklxeLZGIa6LjC7m2Tq/3kR2oIKQea5rIoJDhHPzC3XQ7OfK2j0Y7l10jZt+K395oU0t
         Ph8OS4EkLaUdj7EAnM0mnaRWAyZ8vlJ5IcbnmK6CdpHMPkMHl0Ib2ayAdccTy0gubCVc
         xUirfq3ev5barzTliu5mOLZR2YWV+GBrTx2TstbJpRUKpVVlF0gJwueXNEGzrQart2WC
         3M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704435; x=1763309235;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S9fgHs7LNXxCjvnR8z+jGu2x4XIB8BbhT/m8R+mBEHI=;
        b=cAt9+QcTjh/qt851QpPgYT8AoIWj6LGhu0XNuULmQP6tcQ6zC0/iSh9MxFLMSjcU5P
         dS7EhCSw4a330NzKm+e/2oH2OV5ORQ58fCMgZS+T717uB5UykT7ciF8n6BYPqWvUltl5
         52sS2KcrmjhAeSCXgaeF+Ixpy19Fp71wExnjFyjqtEzxEDrGnYIaoqsNVYym7kLeRZI1
         k1YNBOB9JN9IAVi4pt0KVfOpQvaoaSjhvS2z2DzYEXc9D3Hvo8ke5f5Cv2bnUjmVuI9o
         djDeSC2gMsO7gxFktfHqvL9+boVp8xxQM3UuDcfuCEt+UN1Q8HECGFbG3VPSJLjATchI
         DkKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmaDHN2CCz9xEFP9/6wQm8I852WihZsqGxQPR8v9TOszTFVlMq0ubAU6tbdek9Wj8G5UqPFnWtcpDkLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRMXePRpMolNvJM7hs13RC2wgryXpkyhEgt2rMd3AJdxbJS7+7
	7gbl1FhVOKQmdoglZxTunlU04LDf9SnaRBIrskamf10vgy98SmkK6FRr
X-Gm-Gg: ASbGncvT3C39NKN7/Iip7rP5Ix9TlS67RTZqnm+SHRLsIzeirbyEDLnHW5+8gqZAZJi
	KQnPpNMz2Fg2jJTnz15yPqSLu0YozShmUybKUzNOf2GZI4SM7ZeRJtkNLNpJFzpWc1doPZNBZEp
	DkJKTribQCOKu/CTKEbrWeG8OWKeXaxw9vXoUjs5VCQGxTFf0Gk4RZIpIrM6JSf/ywM6ZHoBnzG
	+FGER26RTF9ooYYD4fkqVJl3yMuTJ0iN2u0Nym7jBYvc5epV851ygwomxukKPmI7CA4mmhdF+nO
	Vvsjr13AgNxtqlLsYD1wCtimoOk08ElYRf7oX+OB6It8Q3SixJK8gOd2EdC3jal3JyBxYZFp2iW
	ZZ7kKCqVwWV7+G9S0uYJDNRpyNPgIi8AWQrt0C/BiYXRno4UTLt4Syl0B4b5ihgncYaMWxq0//h
	P2cxuD/fDTvUZH/9j7A/wKEDt6hZqzoXkJAQ0Ui/AhQAzd/OpAdBGHh14v
X-Google-Smtp-Source: AGHT+IED6bY5qY6cxFJr2d2ngprwv19bCwEkOcXrTloMgrXhgTLDjUOuHRGjxqnxhNBX+x9pqayApg==
X-Received: by 2002:a05:6808:f8a:b0:44d:baae:fb0a with SMTP id 5614622812f47-4502a280b80mr3116020b6e.5.1762704435376;
        Sun, 09 Nov 2025 08:07:15 -0800 (PST)
Received: from [10.0.10.56] (57-132-132-155.dyn.grandenetworks.net. [57.132.132.155])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45002798bdasm4627637b6e.17.2025.11.09.08.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:07:15 -0800 (PST)
Message-ID: <0947877aeb6ff8c09bdd3bfcd8a9d2602bc54851.camel@gmail.com>
Subject: Re: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
From: brian.scott.sampson@gmail.com
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: christian@heusel.eu, davem@davemloft.net, difrost.kernel@gmail.com, 
	dnaim@cachyos.org, edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	kuni1840@gmail.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, 	netdev@vger.kernel.org, pabeni@redhat.com,
 regressions@lists.linux.dev
Date: Sun, 09 Nov 2025 10:07:12 -0600
In-Reply-To: <6980dba4ac0be1d6bbed8cb595d38114d89a14f5.camel@gmail.com>
References: <caa08e5b15bc35b9f3c24f679c62ded1e8e58925.camel@gmail.com>
			 <20250920035146.2149127-1-kuniyu@google.com>
	 <6980dba4ac0be1d6bbed8cb595d38114d89a14f5.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> No worries! I just applied this patch as well(on top of the other two
> in the order you originally provided), and still seeing the black
> screen upon resume. I am seeing a stack trace now when I check
> systemd's journal, which wasn't there before(not sure if its
> related).
> I do have the System.map as well for this build, but not sure why
> everything seemed to end up so cryptic. I'll paste it below as well
> as
> my desktop:=C2=A0
>=20
> Desktop Environment:=C2=A0Gnome 48.5=C2=A0
> Window Manager: Mutter (Wayland)=C2=A0
> Distribution: CachyOS

Just wanted to report that this is no longer an issue now. I had
avoided suspending my computer for the last few weeks but closing the
laptop lid this morning on accident, and it resumed normally! I also
tested going to the power options and clicking suspend there as well,
and it seems to be waking up normally again. Not sure if anything
changed, but wanted to let you know and thank you for helping!

Current Kernel Version: Linux 6.17.7-3-cachyos
Vanilla Kernel: Didn't test since its working downstream now in Cachyos
