Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E922F28EC
	for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120027; cv=none; b=XNRnKm0dSdXOdiRVsjdI/rC00knY/xOfpjGuwsr/Z3elaKagyxpUlrwDy0xjiE+KucktvtLVsPLd15qlnEx2ELohFDVqB9lkfvthbKuUqaHfsq94WGiUo23C0JFVdLJyf+qgrpyQt41TeiBGJHMG0xv1YTrIBz+2NkCa9lMQsgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120027; c=relaxed/simple;
	bh=eK5I0FXdGi22EZiC1nWona0mCu3fJMZ3aNkjHWYqN8A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IhmDa50FGeUHh79kh99keGJc37W9tqjI+Eetl7UblkFF0vjppOoHrysjzwXlMK9E6TWqqqCf5blbYxPR8UsITuu4H/b1no8T+VBL5AFWYgiFYrfRA5bamimHvQY7GrQSEHYmxy1wra7kaiEMM7dejiw2djqxXTnItrdHnPefxXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjydws01; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjydws01"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-74382048b8cso5121407a34.3
        for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758120025; x=1758724825; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eK5I0FXdGi22EZiC1nWona0mCu3fJMZ3aNkjHWYqN8A=;
        b=jjydws01rWwZ0QG9XXxZ1+5vfGpGl/bM/pVwJX3EoRLr2/IOrFNgJvu27LlYpMggMf
         L4V8KUgegvQtC3hXmpshwD95xEYb8jnyxYV9OLTIbDBrZkGGA1YO4dI+xalObpIRf0AJ
         nsOIZNGPhYxQtAAhXdVS5pBfG4j1rySW7lU1k735NhB2wJTEnMtg0UX664NCASscp7yq
         9afoY0GdMxe6W4cWxzXLS2xfKZWyQTPT3KUgzsTf6QRuTYER/gaqZpTDF7v1kAqses/F
         EJZ2y1SBdVDATptPqIBzmdqGZoPucYXtj0DBiqxr57YBFA1UOrKtXTUAqwCjcJhYNAaH
         yYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758120025; x=1758724825;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eK5I0FXdGi22EZiC1nWona0mCu3fJMZ3aNkjHWYqN8A=;
        b=YATbY14lmol6plojaGpFX3bjdfjk7WETK1nSAADS2JUGH8wJIpe+OQQ/UQN0eiSNzW
         2WXS1Y1kFY6IhyucszLK/XnmvAwrg/CP5Xv6J1P2NExOYZQaT+rXDdYDCFSuDwPPGG/0
         oLqoPod+ouHLqdHkp0ky+px9bR2M/DlfNhj9qFZUczCPiOudEY2zS3KaI2TgVN1Ubc8E
         HjXvC1jCkqn74jmtaoYACIDCd4vB93KzVU8OlIuCX749MBVn9eXGgPaOSJToSJS2txfz
         TMe/uk2RVTkLvuIaeJMM6kV58uyEALvlk/AYVCzDrGUbH1sfdky3FZ3qpk5e1LJ65GkN
         /dOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp2lS2p0sf91mChUYkRdJDpYZAaPg78Kvjckt5HqFqDoyeZPEeCd1nN2r0zzG/lEQf1SLdOLrydtP0og==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbq8tgwYzT1aYzFwRYxAVvKM8fD0GgMNjrnprCfeu/eSqBolSG
	ihIe0R7SY85K+kZlMyGmkBl0nFiiZCDfb+6WYUTjqSRe1f133TumJ/pI
X-Gm-Gg: ASbGncv378/027lzDpFbFv2I5ds2JFKmXRWBJ3r0gx11xJB/6611+4kup90ByMftfTD
	XkkfM2ZpHFC3JVgBUK+m22qjT/aDuV1VWH3Gi4TwQQ2ZrvJeey3BwTG3bHBFQQA7Z9dohXGnC5w
	/NGE5tVjp9qNrghpOrXJ+AjYyMoX3+cWudstlstPhhulSqOs6H/qk1/uCNuRfM1/cg5aTzwYgT2
	KzOnD0pVpiPjkfCDDlXAurHHXRlPNYT+KpiwZ6T6qu2i4SK/xT0HUdGKYOrcB5q4cskGfC58+Ym
	pYRuXzjZF83n7fURt3eAB4KcWhnSBxAZ8SGKZEKFrYkV/H7lcUtMt1MdjxbXxf1qYQlHtbIDTBQ
	Yh12pGLrm2rPGw7i5w2l+7sfa39dVCbKO0Uq4bYZ7DLi7apMVblM71VRfyPtpzMrJrPs1bq9CR5
	m/gqqGuc18qmyR1Zzc7ajX76zj7C/0tDg797w=
X-Google-Smtp-Source: AGHT+IFuoZQvqnwPXo5d6wnHV1ZaiWFbmg5Q2lv6uwuvzfmGXwFkkmE+hWJ3iTKF8TqLazP+Spi/Ig==
X-Received: by 2002:a05:6830:6f4c:b0:745:49ef:d74a with SMTP id 46e09a7af769-7632644afc4mr1151794a34.26.1758120024839;
        Wed, 17 Sep 2025 07:40:24 -0700 (PDT)
Received: from [10.0.11.20] (57-132-132-155.dyn.grandenetworks.net. [57.132.132.155])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7524c260735sm5317009a34.39.2025.09.17.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:40:24 -0700 (PDT)
Message-ID: <d994dd8855c3977190b23acbe643c536deb3af71.camel@gmail.com>
Subject: Re: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
From: brian.scott.sampson@gmail.com
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: christian@heusel.eu, davem@davemloft.net, difrost.kernel@gmail.com, 
	dnaim@cachyos.org, edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	kuni1840@gmail.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, 	netdev@vger.kernel.org, pabeni@redhat.com,
 regressions@lists.linux.dev
Date: Wed, 17 Sep 2025 09:40:22 -0500
In-Reply-To: <20250917013352.722151-1-kuniyu@google.com>
References: <c36676c1640cefad7f8066a98be9b9e99d233bef.camel@gmail.com>
	 <20250917013352.722151-1-kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> Could you test it with this diff and see if 2 or 3 splats are logged
> in dmesg ?=C2=A0 and in that case, please share the stack traces.
>=20
> I expect this won't trigger the black screen and you can check dmesg
> after resume.
>=20
> Thanks!
>=20
>=20
Good morning/afternoon. Applied this patch to the latest mainline, but
still see the black screen upon trying to resume after suspend. The
keyboard looks to be unresponsive, as trying to switch to a tty
terminal or back doesn't result in anything happening(as well as
numlock/caps not being responsive either). I also tried using the power
button, as well as closing/reopening the laptop lid to see if I could
trigger resume.=C2=A0

Checked the systemd journal just in case, but no splats or anything
else is recorded after the suspend. Finally, attempted following dmesg
with -Wh to a text file before suspending, but that also doesn't record
any new input after the suspend.
