Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801B330F806
	for <regressions@lists.linux.dev>; Wed, 15 Oct 2025 02:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496998; cv=none; b=ZVunqcw47MuXM/q9jFkrBpf/gjJY0ipXpunPHi9AfGY/ghHQsWyjbwkyRkreAEGFUXc5xtRat02nuqm5qsFHzmtBRnFAqFM7Kg8ahdUe1cXV6gFVDdNN1vwJ3CgOWIEZ4PB6fVJAHxoJ1nhP9w88Wo7JwTWvB79tMBwhQ5EE1/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496998; c=relaxed/simple;
	bh=TE1qHUGtE2qlD/mCekHEiwVSHgeYLYgnt1C5+7OY8Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzVvvXnhTblhuKWgGPimft6A0Yjj7LMqmPmjpzXXU7IkLukfROZQw2iTwGZ8CHuWx743U9w2/EhxHee0JrX3Paw41EXk4i1skRwfyd25jkW0VluxOaCr+BK3pmUdkT0+wnVu0PB/Q/K4K6QVx/qMiIaez7TNGkGla72Opi4phnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5Obr6TQ; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5Obr6TQ"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63bcdf5f241so753272d50.0
        for <regressions@lists.linux.dev>; Tue, 14 Oct 2025 19:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760496995; x=1761101795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TE1qHUGtE2qlD/mCekHEiwVSHgeYLYgnt1C5+7OY8Hg=;
        b=b5Obr6TQ1z5eEHcMxz3WhBuqeg9TDvW+XdDkdKWI5k1AT+fBNQgrEZrfLzxLL8leFh
         AWqxQwUUBzsXvSklrnPB1WWnE90CTG3aFqSwhQANmLo1jOGGVEepaBNF9zev2JAnd5QE
         dnGGXKxgAowuGJLLz0gHaj41RmBez/C+m+rlnaiWftDH+9i5tAUm9ygXHFbziwiKlq4E
         W0q4lkgOhfdtu25icE0PEqUTcpncctftPdZ1XYNLfSEfpH0sFuSwINegskpeJdbPV0oe
         wybseChXrxsaPHY6b/F7hziI9M88avY0Au5eqnBtc0atqBGBJkQZ/ehmiP2FXi62X0Sf
         44ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496995; x=1761101795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TE1qHUGtE2qlD/mCekHEiwVSHgeYLYgnt1C5+7OY8Hg=;
        b=uj1mXwFeAuvA6aSWa5SGhgWUS7blYHLiFYs5wOkH2kjen5/gr/Gqw012bgTksLHutv
         5OXXWU6pbfnYMEit5cGePzQ/yPsxCgDRgVY8wUxyVI6vdewmjvodxGdt3gpx+K74/jee
         yTp8YFw0O82dzaB29/fqxStNXzMk81AKXW/S+u+L/R2CHHiOMl+I42wwkMz7uayQoeFO
         qPNWka/vS0pPMNreEUa61WiPxL/uoEpMZMJsLaESN9SFpi0Yu8EEB1G6CGZyydIMxa7g
         c7nIH/Tb9ivwDUnO2wqE6P0iRup7b9Z9eyk4mAjXio7vXUNmqsdDTSM+gkXeLSiULAwf
         8QSA==
X-Forwarded-Encrypted: i=1; AJvYcCWCHYihjLElBkPGnz0MpWEDhQLoJnPP/B8Yg9koEPQ1LMpr5mwIBFTWLjiIeMHeldXbCcBIlvw+9n4qZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwF4j3qouBuciYEhlr+tMkXMzn+gEIPj9HmA7dh7pjzqbN4Ey0Q
	Xu2WjIR74YKSO1/mf4/z1OD0UtrFiTsSc+TGbX3pdxgEukEWPj6NgUOV4rA+rPKv+GQAr8cAIkq
	3BSJyOsGHb/3wblGBWQ8TloO72HAuMiI=
X-Gm-Gg: ASbGncvfBFZg+Kq4jzgbPW+BnPQpl0GtjnBhyBzBkoIK6YIu1FSZhY0Gqg42KP8+sR1
	QtawAntARJ7lyYR9srnsKgvvSbjZMFEgR4qi+54vvCQ5OF1Bqb2gowhHRbnPmMyTXyJPkJCXe+4
	d8F9vkguEVfHXFlpWnd4cIGChDtxLyFN9JWpNvM/SiT1zVXe0NWLSJcA1y6c4i7oAPoWlolBHEG
	Ji2UHsSDiC9u8GtcSi7vyMDmK37rw==
X-Google-Smtp-Source: AGHT+IG3HRitPb0dlcLGv5LgSdqyT8KuXHdCc4yeCJu3F1DpzIoAorsJ2rfH1BjAA338ijrr0+SbQ3r37duOGjwCMlA=
X-Received: by 2002:a53:bf83:0:b0:63b:a691:71fa with SMTP id
 956f58d0204a3-63cbe06465dmr19731581d50.4.1760496995327; Tue, 14 Oct 2025
 19:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251009075149.1083040-1-safinaskar@gmail.com> <aOd27ViaWbsdwNDR@levanger>
In-Reply-To: <aOd27ViaWbsdwNDR@levanger>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 15 Oct 2025 05:55:59 +0300
X-Gm-Features: AS18NWBIftPtYmrWrg2OYbA_p_2SzeJFq9_j6ArULRBmZaQNo6Xg6r4qfIVGAdM
Message-ID: <CAPnZJGDsrSk6GUYVhpofoiTKLS-pVJE4TFU_hA0gttn6Or=q+Q@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] kbuild: CFLAGS=-w no longer works
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	regressions@lists.linux.dev, nathan@kernel.org, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, sam@gentoo.org, 
	thomas.weissschuh@linutronix.de, Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 11:49=E2=80=AFAM Nicolas Schier <nsc@kernel.org> wro=
te:
> If you want to hand-over additional CFLAGS to kbuild you need to use
> KCFLAGS or other variations, see Documentation/kbuild/kbuild.rst.

Oops, I'm sorry.
#regzbot invalid: there is no bug, kbuild works as documented

--=20
Askar Safin
