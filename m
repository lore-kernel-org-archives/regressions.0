Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDF31877
	for <regressions@lists.linux.dev>; Tue, 28 Nov 2023 01:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhGYtyTN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cf8c462766so34611525ad.1
        for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 17:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701135635; x=1701740435; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIYliXm0ofkZlM2589umeGJhzNWe6+Y4OO+0F9t5Orc=;
        b=PhGYtyTNOVBRSlMYqw7k59MHtMJ3DfoESMJymSO8J5V2TM3K+Bj3tX6EtkyY19JAgF
         uZ5hory2KqQSZBCRyuy1a3qL4w5knTjY3JkNNLnCRGXYs25sIDUy/jRCyxZ5dGd+66kq
         33BKFkA3qliDRptvrUYKPJgjjP/Mcg6RYm1GNE3sPnEPTuzBXagafHXuKpdoHT8tbBpi
         tCR1pOIPuE6tMqz/Ct2WRbrWllVsr+yc6rb18TAV+1kXebQk4yL/ThDYCTrjOjnHjXJY
         VSrTnJqpUUIRc3RRNbFLHt25bF52YmLKboLL278bjcn+IU11Yo5Q9IWdWAPamcXAi2Qv
         OncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701135635; x=1701740435;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aIYliXm0ofkZlM2589umeGJhzNWe6+Y4OO+0F9t5Orc=;
        b=G3ACSRNvyIC4hMX0BAgRc8Eb9A5fWge3wGsVy8xoUslQWowV9MkQJt+LDcM0QAzM8q
         rNGDc5Qr/o4/Yvw3C1pDjY0uazrd25ZyI1Dt2ochAKKL2bfCgdW80pP9lyRXkv+v233K
         wHmOMyV3IF0oW1VqOgb9lox8BcdrrsRkLU6DgVNWSCFY7Ptk7rfvlMVXtkOTtuMXxrIF
         deANWDSPRH335j4kjFFUXIzkffNVgoWQGpiy5VeHYDPAp28TzpRugP4Ofk9SaPv4X1R7
         mjvoADjhmJucgiNrDPpPeTQxizWRzJZguq9nr5DpT3zTKoBb7oG8MEjGmyGl9UyAxRRK
         KS8A==
X-Gm-Message-State: AOJu0Yznvy95qMfM9/tJWrG4BLGd+zfT8Z1iS2Xt3lhWZlLeVynJRsIz
	csjgAg2YndNqdV7W6jxV/Lc=
X-Google-Smtp-Source: AGHT+IHH7Hh0jxT1+lVFU6QA98wAsa4arc2w8gVNhTAdxC8ewdEHb3j2t/uYHVVjyCEKKYPoDbnnzA==
X-Received: by 2002:a17:902:d2cb:b0:1cf:ee3a:2398 with SMTP id n11-20020a170902d2cb00b001cfee3a2398mr1991686plc.42.1701135635185;
        Mon, 27 Nov 2023 17:40:35 -0800 (PST)
Received: from localhost (121-44-66-27.tpgi.com.au. [121.44.66.27])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902b7c300b001cfc9ad74a3sm3101284plz.15.2023.11.27.17.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 17:40:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Nov 2023 11:40:29 +1000
Message-Id: <CXA293HNWDZM.154HY9QTPC3QU@wheely>
Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions"
 <regressions@lists.linux.dev>, "linuxppc-dev"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Timothy Pearson"
 <tpearson@raptorengineering.com>
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse> <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com> <87leaqjs8x.fsf@mail.lhotse> <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com> <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com> <89de310e-bb9a-4485-bc8c-3fbefc90e6f6@csgroup.eu> <871qca4rrc.fsf@mail.lhotse>
In-Reply-To: <871qca4rrc.fsf@mail.lhotse>

On Tue Nov 28, 2023 at 10:59 AM AEST, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Le 27/11/2023 =C3=A0 19:39, Timothy Pearson a =C3=A9crit=C2=A0:
> >> Just wanted to check back and see if this patch was going to be
> >> queued up soon?  We're still having to work around / advertise the
> >> data destruction issues the underlying bug is causing on e.g. Debian
> >> Stable.
> >
> > Has any agreement been reach on the final solution ? Seeing the many=20
> > discussion on patch v2 I had the feeling that it was not the final solu=
tion.
>
> The actual patch is fine I think.
>
> The discussion was about improving the explanation of exactly what's
> happening in the change log, and whether there is a larger bug causing
> FP corruption unrelated to io-uring.

One thing I said is maybe we should remove the "register save" concept
entirely and always giveup. But that would not be suitable for a minimal
fix. I didn't mean it as an alternate fix.

Even if we did always giveup in future, this patch still gives a nicer
API. There would have to be a noticable performance advantage to not
restoring fr0/vs0 after saving before we'd think about changing it back
to clobber, since that encourages foot shooting.

Thanks,
Nick
