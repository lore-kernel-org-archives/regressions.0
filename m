Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB517C67
	for <regressions@lists.linux.dev>; Wed, 24 Jan 2024 15:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706110435; cv=none; b=tUZUmHT6AIpzpx+VRVn4dhkInah98rJDgQb/kWW/Pfyps7CsEjMjSCnhEjdc70zLE3MK99cGbfFjO0AGJBHgBdBtS5hsJBNkGSiU6zKegt8AzaG4IJ8kaVZwiyOtHUDfvnlrJErzb8vXxcIVMCvAEz3Xiz5GnxK9Uq91rR9lvAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706110435; c=relaxed/simple;
	bh=TCNxtB333piEg8FONxiPrbu3zbb+RD/WcvnF5gMRDbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blBjCTStK2XoB0kF2Aj4sOaRfZvo+UGnj+FIchLMoyg196bmKRfmJzr6+q/Oz6tHg05FDKrza4Ea7yQ4lxB+v/fVcHOvv48FtkHH35Pd3m+YW5mO+wmn/80On2WKV9rjngCq+duNYvZhh5R/oSzCk8czHi704HOc0R9i8cPI8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpup6NUt; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpup6NUt"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5ff7ec8772dso48737837b3.0
        for <regressions@lists.linux.dev>; Wed, 24 Jan 2024 07:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706110433; x=1706715233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF+OHxguRNODCvdH55DenpgBbXkSJhRqehOviUia52g=;
        b=Hpup6NUtOa0FdHBbDSXODzP9P0FMnxyln1dr/xocFpCpwazSaL4TPENp3a56Vi8Ifb
         oKtWMke+2H10a1RIJ+FLnIGH0Qy2/Wm31QSFSILmJ2mKvuV4K45+OqrGIW+6OoEallGD
         Ep/G+2jD6GO+KjkAbEcWWA5ZeE2qJLK6AapOX27+jvAucIemBLPz4wVPBxhW+XE2HJAw
         PXCvvCX7bZwR0/OGP04clzbauVuQklFB/TyXKuG7ipaYeN25cp4GQpTML2Kzyyn098dX
         3xhIExXcaVFhohQpPvDbJHOFXyRbWRB5Gxn4xuyBOInTvO8QS9IXNytOzYg190PBrGsB
         2j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706110433; x=1706715233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF+OHxguRNODCvdH55DenpgBbXkSJhRqehOviUia52g=;
        b=ILgOn5SXWObKcxqbZS/NnOaZDGY2jVKnAmikA5f268AYBTu8bXzs1R5P4fu4izEfx1
         4m/QKbd/4aPBTCCqcvd6fJgap2HIN3h4dUBGPlzwbxbODjd0KzJz/dAm7DveWaFzJMAT
         edjXu0T3n82ngBqfCcUax1X4QIyniz8N+U4nO2MYwkdw7OgO+GVrKkNaKSN7Zw7Se9c2
         qQDX/WgL41Zil/SSxu4GmP2+4T70XUQBu7GVt1wlixD5CXK1AFFz4PRsrtqDPYDWVdLt
         W3G/sYy+jgABk/gypw4r3ruuoQnXKRf2laLUShAPrEMGvjIztdYQAchbzsnDAIjbyt+9
         /9MQ==
X-Gm-Message-State: AOJu0YwlUXOqZmDBjgFelGsWXgg3mNI3sn8Z//dxW+UA5UNIHn1r5Odm
	SFBS4jnW6CwtUYY8YU9cqgDEPIOCEcyHwc9WXnZVL/KBgaJsz/78MO6YqC0p36uwFjBWmbb79ay
	76BDtfOa9YvBGVR4iFdaXzjVdxT0=
X-Google-Smtp-Source: AGHT+IGUS9tuxVIMX25dmxiV7fTiY5eFrs8jLOCRBDlqb/bOIj6etzQYJ1BCdRIcGim1usEdGT+9uK42wTpI2OLXkW4=
X-Received: by 2002:a81:9c47:0:b0:5e8:75e2:9345 with SMTP id
 n7-20020a819c47000000b005e875e29345mr911645ywa.60.1706110433055; Wed, 24 Jan
 2024 07:33:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz> <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
In-Reply-To: <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
From: Donald Carr <sirspudd@gmail.com>
Date: Wed, 24 Jan 2024 07:33:42 -0800
Message-ID: <CAOVeLGSczkyhj61T8SZc2cK1Cjy2izV6URVa2422kcfy8ONYFw@mail.gmail.com>
Subject: Re: [git pull] drm for 6.8
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Dave Airlie <airlied@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 7:31=E2=80=AFAM Donald Carr <sirspudd@gmail.com> wr=
ote:
> I am experiencing the exact same symptoms; sddm (on weston) starts
> perfectly, launching a KDE wayland session freezes at various points
> (leading to plenty of premature celebration), but normally on the
> handoff from sddm to kde (replete with terminal cursor on screen)
>
> Working perfectly as of the end of 6.7 final release, broken as of 6.8 rc=
1.
> Sometimes sddm can be successfully restarted via ssh, other times
> restarting sddm is slow and fails to complete.

This is against the Renoir GPU on the 7950x, but also reproduces
consistently on my 7900 xtx.

Yours sincerely,
Donald

--=20
-------------------------------
 =C2=B0v=C2=B0  Donald Carr
/(_)\ Chaos Reins
^ ^   http://chaos-reins.com/
