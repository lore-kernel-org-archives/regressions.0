Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E60264FAE
	for <regressions@lists.linux.dev>; Tue,  8 Apr 2025 09:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104890; cv=none; b=JoCs254Vl2npqgxHEQBxar8L4iRxWhTHfNiD9+hlizEQSReeOyy91PNIGMbzkdlY4G1MF8x+X/RdjqhZiN2QTkJWZTxYy2XMHoNaMUal01etH+MCQScCEcWspFQdXmy+qx+UDgCpUYuzd+B1EtYM/Z1IWIh7NjvDrUXh/FQZEEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104890; c=relaxed/simple;
	bh=PtTeReiTLp+RqAL/cLFtmFLCbjN4w5rpWp84zoyWVVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBiy5kufmFb3e+WcMTht0PRjOQwvUoh6tOjuFjFY6sHBnwcz0HAiyp/oxDfmfVFggpn7ztzWIIXAyoL741bWLzz1sLO7xjwGAkWvR8PayCsFDmi8NLIyVH/p0WNpAHLVPAGLQQhQfGpX3phfGDZOsANI+WwSfNlIE6hamV0JdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhqG9R/b; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhqG9R/b"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72bd5f25ea6so1257476a34.1
        for <regressions@lists.linux.dev>; Tue, 08 Apr 2025 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744104888; x=1744709688; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7Bg64jM6tSWnXjFr3goi8956rwlNjPV/077kclDS9I=;
        b=mhqG9R/btDccCg7mb8yqvYytXVX7I5PrFStys6GCaOPPRx1egYacG8AmsAwRZ6hvzr
         JL9kuGkOSrCPSITQj4dyFFq0Z2iWKesJRVnPMlNPsLHZ4guqwyB0K2Hcx/7e293Hj3+5
         xQh8UM4uZBUsw/pFNko4VB9+MbPaj96MdmhpyjZdpvYl9snHr6OEmreib5qiatqXAIzF
         XwIeSq+8z7DKGVxhf/7csxFyeV5zACHzuZJZrBEu51xlaIKCFRhs24c00cuIQ+MsHSN3
         B9QR+HbjXNIf9UijUtqoe5lOkVhV/rvEzWh7+mzIl9r7kXATuNa3pk0ZQb0D+sbImJL4
         17qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104888; x=1744709688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7Bg64jM6tSWnXjFr3goi8956rwlNjPV/077kclDS9I=;
        b=L/YGAPktC+uJKzx2pLMRvP7acy4Ipxk4Nwdgix1OxDe4pzfzlg26T6MegpwC6FRSSW
         YQ97atAm+lupC01osXcnRs8XXCnJBl+hSmM5DyGiIza51hzFXMXl7RaEWnwarNAAWlH6
         aMK6sfzRH9veWCl2oQKyXwHvAnV8BF+mBWnYMO9zMoO7ebYG1mDYkZaLmvaYOKbZk63T
         gF52qEIh8lZUcjLNWpDS8ZmL025K84oVBAX/v8EQjblUXs85LdYnQ/E9pQXyHOlDXkQX
         HoEOoiR8zwumcXburZfO5ooHNSWMzF5eeTkt7iM7qyRHrCELQwZLVwlvG1o+WiVx0odp
         E3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD3ejES5X9sN+GHTG7rso2ahbsrpA/c2M3fkeVSZrMby99LnnNOkA3btwzVtd16YFwPJ9uEGMuK5jvXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMrrP35TcAoH9EZIAtwggyJtm45XVsbttf0+LLeW0bbAUAejjk
	KvQwbHlV4ANuo64pLPtbjldYgBXBbBauCP+HGOQO9hW3411KgO5DExnGke21mn8pX9aCy6bLEN4
	FxFNcA3HJqRk5Sljl4g7X76cRCr4=
X-Gm-Gg: ASbGncteJ4Ll/4irEtLa4CMFnMT0u/IZcI0ArzBLSAcs5n7fWQfMoq31kMm4S1b6iHT
	EPOHeNnAyEbc85jElrogn3pDBu2t1Fko/kJkz9FjRoy0u609QjFfqbuMTzlkLoM0IQ4Lmsp/C69
	s123B82d5AQXT9bvokkiyjAbQJhVex
X-Google-Smtp-Source: AGHT+IF0RL92qSZNzUfU40xIFIvrvGm2xvag6WpHMC5o7D5ttqQSxe1/GUnQ2Gjqq953tDRmDPDtxGBEWbXMsdqtCLE=
X-Received: by 2002:a05:6830:6c10:b0:72b:a3f3:deb6 with SMTP id
 46e09a7af769-72e3665915emr9937036a34.4.1744104887890; Tue, 08 Apr 2025
 02:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsPXitW-5USFdP4fTGt5vh5J8MRZV+8J873tn7NYXU61wQ@mail.gmail.com>
 <20250407-unmodern-abkam-ce0395573fc2@brauner> <CABXGCsNk2ycAKBtOG6fum016sa_-O9kD04betBVyiUTWwuBqsQ@mail.gmail.com>
 <20250408-regal-kommt-724350b8a186@brauner> <CABXGCsPzb3KzJQph_PCg6N7526FEMqtidejNRZ0heF6Mv2xwdA@mail.gmail.com>
 <20250408-vorher-karnickel-330646f410bd@brauner>
In-Reply-To: <20250408-vorher-karnickel-330646f410bd@brauner>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 8 Apr 2025 14:34:37 +0500
X-Gm-Features: ATxdqUE9g2rEeeo1yAbwscarMFto7S559Ky8HZPkBzoWbN-Fw3wbmzlUemspT4o
Message-ID: <CABXGCsO56m1e6EO82JNxT6-DGt6isp-9Wf1fk4Pk10ju=-zmVA@mail.gmail.com>
Subject: Re: 6.15-rc1/regression/bisected - commit 474f7825d533 is broke
 systemd-nspawn on my system
To: Christian Brauner <brauner@kernel.org>
Cc: sforshee@kernel.org, linux-fsdevel@vger.kernel.org, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, lennart@poettering.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 2:18=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> I'm confused why that's an issue:
>
> > git reset --hard 474f7825d5335798742b92f067e1d22365013107
> HEAD is now at 474f7825d533 fs: add copy_mount_setattr() helper
>
> > git revert --no-edit 474f7825d5335798742b92f067e1d22365013107
> [work.bisect e5673958d85c] Revert "fs: add copy_mount_setattr() helper"
>  Date: Tue Apr 8 11:14:31 2025 +0200
>  1 file changed, 33 insertions(+), 40 deletions(-)

> git reset --hard v6.15-rc1
HEAD is now at 0af2f6be1b42 Linux 6.15-rc1
> git revert -n 474f7825d5335798742b92f067e1d22365013107
Auto-merging fs/namespace.c
CONFLICT (content): Merge conflict in fs/namespace.c
error: could not revert 474f7825d533... fs: add copy_mount_setattr() helper
hint: after resolving the conflicts, mark the corrected paths
hint: with 'git add <paths>' or 'git rm <paths>'
hint: Disable this message with "git config set advice.mergeConflict false"

--=20
Best Regards,
Mike Gavrilov.
