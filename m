Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0139E746E
	for <regressions@lists.linux.dev>; Thu, 15 May 2025 18:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747334744; cv=none; b=t0ahIhco7lkPmvhO8Lgboe/p7syOOq8jvvLunGjQbt0/wfR3AblGd7bmuWADsxBC+yYqpPyMqKMdM0iL+a2g0d3yNLVEAiJJgzmhsrZGWY7vfOJ26VBvmdXINq3LDmNE3W1zvxw5ZzxdWIESOy2HbUI4d5hFsIvCVOgzlWIskCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747334744; c=relaxed/simple;
	bh=9WLPjYbuxgmzbErUtY6qGPN4XcL2duXSQLLSfRAPlUw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dMg2rhec4tD80AYABGJ+e5Q8NEEt9XOMAk0QJ2BsB+q7bodU0iDb3+Pe4J2Y9EDbNGklHTUekqXROCpDmO3pwQqI8fD6Z9usLfVoMdqeyWYYHuxiey0KVuWXHIOUe+GDid1sAeaXUppsq3vuWb8DjW3JIIEwvvdNgYe87F63+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X85obodZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X85obodZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ede096d73so9216575e9.2
        for <regressions@lists.linux.dev>; Thu, 15 May 2025 11:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747334741; x=1747939541; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zv2KEzheJ/MgPqhI9h8gaX+s/CUBTIKXLdES3z3s/l4=;
        b=X85obodZU1i/FXqFI9RFjzFGfRAJih8DRmMPYy3lvxRFEo3wRqVVHRItBI8lpsRX7Z
         v/xzdYeDvPUJQs+TgAyTiR6izmcXlaLrTX7h9NF61/9VUi+X4HiGwuf3Tvsv+pCnqEr+
         jV/6Qj5xFJUak2IqZpqNoCSdVC3yumGB3crHtD+uKcivylm4bHiBlOxgX25iJaZNxJdW
         KWHSSZYTnZBlG3TzOhdH/1Bzeb91sfyqSGPi/P5oKqNdTYfpTaPJMqjn1u6Btim+3I7q
         2gUWeKBrViov+an9US0mUdv2jytHv2r4j2G2YvN+xhDdZM2ZWfjYPhfJlIM9HcASAm+5
         J12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747334741; x=1747939541;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zv2KEzheJ/MgPqhI9h8gaX+s/CUBTIKXLdES3z3s/l4=;
        b=BaGzQoTwXWwARXyoJGdOgGQb0shdYp+JYAZz8TQYXiwLReoHwNTLDA3H0Sgq41UOcn
         X03bwun0crCwdcAuqI7jTTII6tB/wiyZaOjqMCzjW333UtXg3dEvfG0XUiUOYPTS6KYW
         /0daMV8HaEPlsH31NCxYFDpTJAJwLn66fb9r7dhy7Pt3rqOpGaO6si0L8hgSusDbdpbA
         7rHX9Dfjr+a4vun4GDovQaXr8Okd6nEbYP0fKVrJvYzwa7E9rJAssa38w6/QGipGLtV3
         fN1Ctu5cL4d2j+DQxMJi2TLVunJzvPOhfEOpGvwh3diPzbAAk1vJ19DOuFFMaNeAl7hA
         bwUA==
X-Forwarded-Encrypted: i=1; AJvYcCVcVs8KnbabtTyfjHc4vwRSKa+pE8oIlrtG4nDTTtqPIVizrFyqWWk2pje3xYveIYE7xEHgVxZOxVF5ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzVlbj/+q8VyhrdbfUt3w5PVNwO/PUiDnqvuNM9sFcG9LOnA3S
	6T+iPmMq7QsSM8pAI1cN4UD6tpJCSXCvqvKClXpmtx+zZz3PaV5Y7mIx1Nu0u+24
X-Gm-Gg: ASbGncsGgZHleEOXN7amcrX2F61q6P4MIw2nXm3zYW8WjMt8vL3aMUMBzyZjRGAhBcd
	BZov+5nvafgTf7N0ImepU7XXLBT2vpzfGUAzVxK5UBLLOCvvwykDW2rrjxByhJpCWPxtuB32St9
	0TvQlOTXh0lFbcsfDTc4lMwz2O/G/TYcS8VHSwY3g6XPP6U6Gm2qybvdTGAYXRFBs57qsZ60iO3
	6XA8tVaTygtOO26fIsNlhhQiC4nrxnmngBOU8AsqIfb/NJWN8sZMGk813hMOBblGjbDKXP9iywd
	tweZp3YbPp59B0u/bxxslO/riHXsP31hueXWNhzGzY7iR3XnhYAQDj97d5l+AXlLssuazuTGLNH
	3NNQ0mAKtUWml/7zxomGRLQ==
X-Google-Smtp-Source: AGHT+IGEjWzR/1RM405yibigh6lwHJWxY2UWukv1Rc4Eh4xTQ4c5CammOK7/eC3cazBKUYuuzn3TMw==
X-Received: by 2002:a05:600c:c0d2:20b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442fda2e7d3mr1968665e9.27.1747334740835;
        Thu, 15 May 2025 11:45:40 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:9394:f453:aba3:b8c4? ([2a02:168:6806:0:9394:f453:aba3:b8c4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd59701dsm5147505e9.35.2025.05.15.11.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:45:40 -0700 (PDT)
Message-ID: <f0dc235e3d7bfa1f60cc01fd527da52024af54e0.camel@gmail.com>
Subject: Re: [PATCH] crypto: marvell/cesa - Avoid empty transfer descriptor
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, regressions@lists.linux.dev,
 	linux-kernel@vger.kernel.org, Linux Crypto Mailing List	
 <linux-crypto@vger.kernel.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 EBALARD Arnaud <Arnaud.Ebalard@ssi.gouv.fr>, Romain Perier
 <romain.perier@gmail.com>
Date: Thu, 15 May 2025 20:45:39 +0200
In-Reply-To: <20250515182131.GC1411@quark>
References: <aB8W4iuvjvAZSJoc@gondor.apana.org.au>
	 <41680c5d41ed568e8c65451843e3ff212fd340c4.camel@gmail.com>
	 <aB8t1ZTVBexqGlcm@gondor.apana.org.au>
	 <dcb0b04e479d6f3cfed87795d100ea09e4fbcf53.camel@gmail.com>
	 <aCAX8rj2ie4QMnTo@gondor.apana.org.au>
	 <28184fb96e2de8a0af32816f5ff1b3d776b57217.camel@gmail.com>
	 <aCMOyWVte4tw85_F@gondor.apana.org.au>
	 <8e9b45bdafe6ac3f12bcbb5fce5bc9949566344f.camel@gmail.com>
	 <aCQm0aHYnI6ciyPz@gondor.apana.org.au>
	 <20dde00750d803a9a364ded99dab1e3e22daec77.camel@gmail.com>
	 <20250515182131.GC1411@quark>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-05-15 at 11:21 -0700, Eric Biggers wrote:
>=20
> CRYPTO_SELFTESTS now enables the full set of crypto self-tests, which for=
 the
> past 6 years have been needed to be run anyway to properly validate the d=
rivers;
> just developers often forgot to enable them because they were under a sep=
arate
> kconfig option that had a confusing name.=C2=A0 So the longer test time i=
s expected.
> It's unfortunate that it takes 2 minutes on the platform you're testing (=
on most
> platforms it's much faster), but presumably that is still okay since it's=
 just a
> development option?=C2=A0 People shouldn't be expecting to run these test=
s in
> production kernels.=C2=A0 (But even if they are for some reason, the test=
 time also
> remains configurable via kernel command-line options.)
>=20
> - Eric

Probably it was only the massive amount of printk's which slowed the system=
 down.

With the plain cryptodev tree I now see:

# modprobe marvell-cesa
# dmesg | tail
[    4.949108] mv88e6085 f1072004.mdio-mii:10 lan4: Link is Up - 1Gbps/Full=
 - flow control rx/tx
[    4.949199] br0: port 2(lan4) entered blocking state
[    4.949210] br0: port 2(lan4) entered forwarding state
[   46.915547] marvell-cesa f1090000.crypto: CESA device successfully regis=
tered
[   47.077931] alg: skcipher: skipping comparison tests for mv-cbc-des3-ede=
 because cbc(des3_ede-generic) is unavailable
[   47.096665] alg: skcipher: skipping comparison tests for mv-cbc-aes beca=
use cbc(aes-generic) is unavailable
[   47.103401] alg: skcipher: skipping comparison tests for mv-cbc-des beca=
use cbc(des-generic) is unavailable
[   47.121374] alg: skcipher: skipping comparison tests for mv-ecb-des beca=
use ecb(des-generic) is unavailable
[   47.133757] alg: skcipher: skipping comparison tests for mv-ecb-des3-ede=
 because ecb(des3_ede-generic) is unavailable
[   47.138474] alg: skcipher: skipping comparison tests for mv-ecb-aes beca=
use ecb(aes-generic) is unavailable
# grep test /proc/crypto=20
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed
selftest     : passed

...and the failing marvell-cesa self-tests seem to have magically disappear=
ed.
I now had five successful reboot / modprobe marvell-cesa in a row.

Best regards, Klaus
